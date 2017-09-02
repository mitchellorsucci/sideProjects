#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <unistd.h>
#include "GPIO.h"
#include <linux/spi/spidev.h>
#include <linux/i2c-dev.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <time.h>
#include <signal.h>
#include <stdint.h>

#define SPI_PORT "/dev/spidev0.0"
#define ARD_ADX 0x33
#define I2C_PORT "/dev/i2c-1"
#define CLOCKID CLOCK_REALTIME
#define SIG SIGRTMIN
// Sets to refresh at 20 Hz
//#define FREQ_NANO 100000000
//#define FREQ_NANO    50000000
#define FREQ_NANO   25000000
#define ZERO_b 	0b00111111
#define ONE_b  	0b00000110
#define TWO_b	0b01011011
#define THREE_b	0b01001111
#define FOUR_b	0b01100110
#define FIVE_b	0b01101101
#define SIX_b	0b01111101
#define SEVEN_b 	0b00000111
#define EIGHT_b	0b01111111
#define NINE_b	0b01100111

#define GREEN(value) 	value + 40
#define RED(value)		value + 111	
#define BLUE(value)		value + 182


const uint8_t ZERO[] = {1, 2, 3, 9, 11, 17, 19, 25, 27, 33, 34, 35, NULL};
const uint8_t ONE[] = {3, 11, 19, 27, 35, NULL}; 
const uint8_t TWO[] = {1, 2, 3, 11, 17, 18, 19, 25, 33, 34, 35, NULL};
const uint8_t THREE[] = {1, 2, 3, 11, 17, 18, 19, 27, 33, 34, 35, NULL};
const uint8_t FOUR[] = {1, 3, 9, 11, 17, 18, 19, 27, 35, NULL};
const uint8_t FIVE[] = {1, 2, 3, 9, 17, 18, 19, 27, 33, 34, 35, NULL};
const uint8_t SIX[] = {1, 2, 3, 9, 17, 18, 19, 25, 27, 33, 34, 35, NULL};
const uint8_t SEVEN[] = {1, 2, 3, 11, 18, 19, 27, 35, NULL};
const uint8_t EIGHT[] = {1, 2, 3, 9, 11, 17, 18, 19, 25, 27, 33, 34, 35, NULL};
const uint8_t NINE[] = {1, 2, 3, 9, 11, 17, 18, 19, 27, 35, NULL};
const uint8_t * NUMS[] = {ZERO, ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE};

void writeByte(int fd, char * data);
void writeCandD(int fd, char command, char data);
static void handler(int sig, siginfo_t * si, void * uc);
void writeData();
void spiTransfer();

/* Stuff to handle SPI and time */
int fd;
time_t rawtime;
struct tm * cur;
char hour1, hour2, minute3, minute4, second5, second6;
char nums_b[] = {ZERO_b, ONE_b, TWO_b, THREE_b, FOUR_b, FIVE_b, SIX_b, SEVEN_b, EIGHT_b, NINE_b};
Pin ** LED;
char tx_buf[4];

/* I2C Control */
int i2c_fd;


/* variables that are used during interrupt handling*/
static uint8_t * left;
static uint8_t * right;
static uint8_t count = 0;
static uint8_t flag = 0;


int main() {
	/***********************************************************/
	/* SPI initializations */
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
	/***********************************************************/

	/* GPIO Initializations */
	LED = createPins(1);
	instPin(LED[0], 17, "out");
	writePin(LED[0], 0);

	/***********************************************************/
	/* I2C initialization */
	if((i2c_fd = open(I2C_PORT, O_RDWR)) < 0) {
		fprintf(stderr, "FAILED TO OPEN I2C PORT FOR ARDUINO");
		exit(1);
	}
	// Attach arduino to the bus
	if(ioctl(i2c_fd, I2C_SLAVE, ARD_ADX) < 0) {
		fprintf(stderr, "FAILED TO LINK WITH ARDUINO\n");
		exit(1);
	}
	/***********************************************************/

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
	time(&rawtime);
	cur = localtime(&rawtime);
	if(cur->tm_hour > 12) {
		cur->tm_hour -= 12;
	}
	
	/****************************************************/
	/* Seg 7 control */
	/* Digit 1 control */
	hour1 = (char) (cur->tm_hour / 10);
	if(hour1 == 0) {
		writeCandD(fd, 0x7B, 0x00);
	} else {
		writeCandD(fd, 0x7B, nums_b[hour1]);
	}
	hour2 = (char) (cur->tm_hour % 10);
	minute3 = (char) (cur->tm_min / 10);
	minute4 = (char) (cur->tm_min % 10);
	second5 = (char) (cur->tm_sec / 10);
	second6 = (char) (cur->tm_sec % 10);
	
	/* Digits 2 - 4 control */
	writeCandD(fd, 0x7C, nums_b[hour2]);
	writeCandD(fd, 0x7D, nums_b[minute3]);
	writeCandD(fd, 0x7E, nums_b[minute4]);

	if(cur->tm_sec % 2 == 0) {
		writeCandD(fd, 0x77, 0x10);
		writePin(LED[0], 1);
	} else {
		writeCandD(fd, 0x77, 0x00);
		writePin(LED[0], 0);
	}
	/****************************************************/

	/****************************************************/
	/* Arduino Control over I2C */
	if(count == 0) {
		if(second5 != flag) {
			// Special instructions for second5
			flag = second5;
			uint8_t clearAll = 0xFF;
			write(i2c_fd, &clearAll, 1); // Send clear command to arduino
			usleep(2000);
			left = NUMS[second5];
			right = NUMS[second6];
		} else {
			uint8_t clearRight = 0xFE;
			write(i2c_fd, &clearRight, 1); // Clear only the right digit
			usleep(2000);
			left = NULL;
			right = NUMS[second6];
		}
	}

	if(left != NULL) {
		/* This is the case where we need to update the left digit */
		if((*left) != NULL) {
			tx_buf[3] = *left;
			tx_buf[1] = GREEN((count + 5) * 3);
			tx_buf[2] = RED((count + 3));
			tx_buf[0] = BLUE(0);
			//fprintf(stderr, "*left = %d\t", *left); 
			write(i2c_fd, tx_buf, 4);
			usleep(2000);
			left++;
		}
	}

	if ((*right) != NULL) {
		tx_buf[3] = (*right) + 4;
		tx_buf[1] = GREEN(0);
		tx_buf[2] = RED(3 + count);
		tx_buf[0] = BLUE((5 + count) * 2);
		//fprintf(stderr, "*right = %d\n", *right + 4);
		write(i2c_fd, tx_buf, 4);
		usleep(2000);
		right++;
	}
	/****************************************************/

	count = (count == 39) ? 0 : count + 1;
}

void writeByte(int fd, char * data) {
	spiTransfer(data, 1);
}

void writeCandD(int fd, char command, char data) {
	char packet[2] = {command, data};
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
