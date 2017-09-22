#include "gpiouser.h"
#include <signal.h>
#include <time.h>



#define FREQ_NANO   200000000 //5 HZ
#define CLOCKID     CLOCK_REALTIME
#define SIG         SIGRTMIN

#define numPins     4

static uint8_t flag = 0;
uint8_t pinArray[numPins] = {66, 67, 68, 69};
static uint8_t count = 0;

void handler1();
void handler2();
void changeHandler();

int main() {

    openGPIO(48, INPUT, 0);
    openMultiple(numPins, pinArray, 0x0, 0x0);

    timer_t timerid;
    struct sigevent sev;
    struct itimerspec its;
    long long freq_nanosecs = FREQ_NANO;
   	struct sigaction sa;

   	/* Set up the handler */
   	fprintf(stderr, "Establishing handler for signal %d\n", SIG);
    sa.sa_flags = SA_SIGINFO;
    sa.sa_sigaction = handler1;
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

    setEdge(48, "falling");


    int timeout = 50;
    char filepath[] = "/sys/class/gpio/gpio48/value";
    int fd = open(filepath, O_RDONLY);
    if(fd < 0) {
        fprintf(stderr, "Faield to open the GPIO value file\n");
        exit(EXIT_FAILURE);
    }

    struct pollfd fdset;

    while(1) {
        char buf;
        memset((void*)&fdset, 0, sizeof(fdset));
        fdset.fd = fd;
        fdset.events = POLLPRI;
        poll(&fdset, 1, timeout);
        if(fdset.revents & POLLPRI) {
            lseek(fd, 0, SEEK_SET);
            read(fd, &buf, 1);
            changeHandler();
        }
    }

}

void handler1() {
    if(count % 2 == 0) {
        writeMultiple(numPins, pinArray, 0x5);
    } else {
        writeMultiple(numPins, pinArray, 0x0);
    }
    count++;
}

void handler2() {
    if(count % 2 == 0) {
        writeMultiple(numPins, pinArray, 0xA);
    } else {
        writeMultiple(numPins, pinArray, 0x0);
    }
    count++;
}

void changeHandler() {
    if(flag) {
        flag = 0;
    } else {
        flag = 1;
    }

    long long freq_nanosecs = FREQ_NANO;
   	struct sigaction sa;

    sa.sa_flags = SA_SIGINFO;
    sa.sa_sigaction = (flag) ? handler2 : handler1;
    sigemptyset(&sa.sa_mask);
    if (sigaction(SIG, &sa, NULL) == -1) {
        fprintf(stderr, "Failed to establish the handler\n");
        exit(EXIT_FAILURE);
    }

}