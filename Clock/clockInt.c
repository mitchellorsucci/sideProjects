#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <linux/i2c-dev.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <fcntl.h>
#include <time.h>
#include <signal.h>

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

int i2c_adx	=	0b01110001;
int adc_slave = 0x48;
int fd;
time_t rawtime;
struct tm * cur;
char hour1, hour2, minute3, minute4;
char nums[] = {ZERO, ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE};

char i2cport[] = "/dev/i2c-1";
void writeByte(int fd, char * data);
void writeCandD(int fd, char command, char data);
static void handler(int sig, siginfo_t * si, void * uc);
void writeData();

int main() {
	// Set up the I2C port
	if((fd = open(i2cport, O_RDWR)) < 0) {
		printf("FAILED TO OPEN I2C PORT FOR SEG7\n");
		exit(1);
	}

	// Attach seg 7 to the bus
	if(ioctl(fd, I2C_SLAVE,i2c_adx) < 0) {
		printf("FAILED TO LINK WITH SEG7\n");
		exit(1);
	}

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

    // /* Block the timer temporarily */
    // printf("Blocking signal %d\n", SIG);
    // sigemptyset(&mask);
    // sigaddset(&mask, SIG);
    // if (sigprocmask(SIG_SETMASK, &mask, NULL) == -1)
    // 	fprintf(stderr, "Failed to block timer\n");
    // 	return EXIT_FAILURE;

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

    // if (sigprocmask(SIG_UNBLOCK, &mask, NULL) == -1)
    // 	fprintf(stderr, "Failed to unblock signal");
    //     return EXIT_SUCCESS;

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
	
	hour1 = (char) (cur->tm_hour / 10);

	if(hour1 == 0) {
		writeCandD(fd, 0x7B, 0x00);
	} else {
		writeCandD(fd, 0x7B, nums[hour1]);
	}
	hour2 = (char) (cur->tm_hour % 10);
	minute3 = (char) (cur->tm_min / 10);
	minute4 = (char) (cur->tm_min % 10);

	
//	writeCandD(fd, 0x7B, nums[hour1]);
	writeCandD(fd, 0x7C, nums[hour2]);
	writeCandD(fd, 0x7D, nums[minute3]);
	writeCandD(fd, 0x7E, nums[minute4]);

	// writeCandD(fd, 0x79, 0x00);
	// writeByte(fd, &minute1);
	// writeCandD(fd, 0x79, 0x01);
	// writeByte(fd, &minute2);
	// writeCandD(fd, 0x79, 0x02);
	// writeByte(fd, &second3);
	// writeCandD(fd, 0x79, 0x03);
	// writeByte(fd, &second4);
	// Turn the colon on every other second
	if(cur->tm_sec % 2 == 0) {
		writeCandD(fd, 0x77, 0x10);
	} else {
		writeCandD(fd, 0x77, 0x00);
	}
}

void writeByte(int fd, char * data) {
	write(fd, data, 1);
	usleep(5000);
}

void writeCandD(int fd, char command, char data) {
	char packet[2] = {command, data};
	write(fd, packet, 2);
	usleep(5000);
}

