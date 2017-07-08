#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <unistd.h>
#include "GPIO.h"
#include <linux/spi/spidev.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <time.h>
#include <signal.h>

#define SPI_PORT "/dev/spidev0.0"
#define CLOCKID CLOCK_REALTIME
#define SIG SIGRTMIN
// Sets to refresh at 10 Hz
#define FREQ_NANO 100000000
#define ZERO 	0b00111111
#define ONE  	0b00000110
#define TWO	0b01011011
#define THREE	0b01001111
#define FOUR	0b01100110
#define FIVE	0b01101101
#define SIX	0b01111101
#define SEVEN 	0b00000111
#define EIGHT	0b01111111
#define NINE	0b01100111

void writeByte(int fd, char * data);
void writeCandD(int fd, char command, char data);
static void handler(int sig, siginfo_t * si, void * uc);
void writeData();
void spiTransfer();

int fd;
time_t rawtime;
struct tm * cur;
char hour1, hour2, minute3, minute4;
char nums[] = {ZERO, ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE};
Pin ** LED;
char tx_buf[2];

int main() {
	char SPI_MODE = SPI_MODE_0; //CPHA = 0, CPOL = 0
	char bits = 8;
	int speed = 250000; //max speed is 250KHz
	/* Open the SPI port */
	if((fd = open(SPI_PORT, O_RDWR)) < 0) {
		printf("FAILED TO OPEN SPI PORT FOR SEG7\n");
		exit(1);
	}

	int spi;
	
	if((spi = ioctl(fd, SPI_IOC_WR_MODE, &SPI_MODE)) < 0) {
		printf("Failed to Set SPI Write Mode\n");
	}
	if((spi = ioctl(fd, SPI_IOC_RD_MODE, &SPI_MODE)) < 0) {
		printf("Failed to Set SPI Read Mode\n");
	}
	if((spi = ioctl(fd, SPI_IOC_WR_BITS_PER_WORD, &bits)) < 0) {
		printf("Failed to set packet size on writes\n");
	}
	if((spi = ioctl(fd, SPI_IOC_RD_BITS_PER_WORD, &bits)) < 0) {
		printf("Failed to set packet size on writes\n");
	}
	if((spi = ioctl(fd, SPI_IOC_WR_MAX_SPEED_HZ, &speed)) < 0) {
		printf("Failed to set max write speed\n");
	}
	if((spi = ioctl(fd, SPI_IOC_RD_MAX_SPEED_HZ, &speed)) < 0) {
		printf("Failed to set max write speed\n");
	}

	LED = createPins(1);
	instPin(LED[0], 17, "out");
	writePin(LED[0], 0); 

	writeCandD(fd, 0x7A, 100); // Set brightness to 100%
	timer_t timerid;
    struct sigevent sev;
    struct itimerspec its;
    long long freq_nanosecs = FREQ_NANO;
   	struct sigaction sa;

   	/* Set up the handler */
   	printf("Establishing handler for signal %d\n", SIG);
    sa.sa_flags = SA_SIGINFO;
    sa.sa_sigaction = handler;
    sigemptyset(&sa.sa_mask);
    if (sigaction(SIG, &sa, NULL) == -1) {
        fprintf(stderr, "Failed to establish the handler\n");
        exit(EXIT_FAILURE);
    }

    /* Create the timer */
    sev.sigev_notify = SIGEV_SIGNAL;
    sev.sigev_signo = SIG;
    sev.sigev_value.sival_ptr = &timerid;
    if (timer_create(CLOCKID, &sev, &timerid) == -1) {
        fprintf(stderr, "Failed to create the timer\n");
        exit(EXIT_FAILURE);
    }

    /* Timing constraints */
    its.it_value.tv_sec = freq_nanosecs / 1000000000;
    its.it_value.tv_nsec = freq_nanosecs % 1000000000;
    its.it_interval.tv_sec = its.it_value.tv_sec;
    its.it_interval.tv_nsec = its.it_value.tv_nsec;
	
	/* Start the timer */
	if (timer_settime(timerid, 0, &its, NULL) == -1) {
		fprintf(stderr, "Failed to start timer");
		exit(EXIT_FAILURE);
	}

	while(1) {

	}

}

static void handler(int sig, siginfo_t * si, void * uc) {
	writeData();
}

void writeData() {
	//char clear = 0x76;
	//writeByte(fd, &clear); // clear the display
	time(&rawtime);
	cur = localtime(&rawtime);
	
	if(cur->tm_hour > 12) {
		cur->tm_hour -= 12;
	}
	
	/* Digit 1 control */
	hour1 = (char) (cur->tm_hour / 10);
	if(hour1 == 0) {
		writeCandD(fd, 0x7B, 0x00);
	} else {
		writeCandD(fd, 0x7B, nums[hour1]);
	}
	hour2 = (char) (cur->tm_hour % 10);
	minute3 = (char) (cur->tm_min / 10);
	minute4 = (char) (cur->tm_min % 10);

	
	/* Digits 2 - 4 control */
	writeCandD(fd, 0x7C, nums[hour2]);
	writeCandD(fd, 0x7D, nums[minute3]);
	writeCandD(fd, 0x7E, nums[minute4]);

	if(cur->tm_sec % 2 == 0) {
		writeCandD(fd, 0x77, 0x10);
		writePin(LED[0], 1);
	} else {
		writeCandD(fd, 0x77, 0x00);
		writePin(LED[0], 0);
	}
}

void writeByte(int fd, char * data) {
	// write(fd, data, 1);
	// usleep(5000);
	spiTransfer(data, 1);
}

void writeCandD(int fd, char command, char data) {
	char packet[2] = {command, data};
	// write(fd, packet, 2);
	// usleep(5000);
	spiTransfer(packet, 2);
}

void spiTransfer(char * tx, int numBytes) {
	struct spi_ioc_transfer transfer = {
		.tx_buf = tx,
		.rx_buf = NULL,
		.len = numBytes,
		.delay_usecs = 0,
		.speed_hz = 0,
		.bits_per_word = 0,
	};
	int er;
	if ((er = ioctl(fd, SPI_IOC_MESSAGE(1), &transfer)) < 0) {
		fprintf(stderr, "FAILED TO SEND SPI DATA\n");
	}
}