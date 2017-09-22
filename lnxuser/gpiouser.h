#ifndef GPIOUSER_H
#define GPIOUSER_H

#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <errno.h>
#include <stdlib.h>
#include <poll.h>
#include <stdint.h>

/***************************MACRO DEFINITIONS**************************/
#define SYSFS_GPIO  "/sys/class/gpio"
#define GPIO_CNTRL  "/sys/class/gpio/gpio"
#define EXPORT_PATH "/sys/class/gpio/export"

#define MODE_STUB   "/direction"
#define EDGE_STUB   "/edge"
#define VAL_STUB    "/value"

// GPIO PIN MODES
#define INPUT   1
#define OUTPUT  0

// GPIO VALUES
#define HIGH    1
#define LOW     0

/**************************FUNCTION DEFINTIONS**************************/
void openGPIO(uint8_t gpioNum, uint8_t initDirection, uint8_t initValue);
void closeGPIO(uint8_t gpioNum);
void setPinMode(uint8_t pin, uint8_t mode);
void digitalWrite(uint8_t pin, uint8_t value);
uint8_t digitalRead(uint8_t pin);
void setEdge(uint8_t gpioNum, char * string);
void writeMultiple(uint8_t numGpios, uint8_t * gpioList, unsigned int mask);
void openMultiple(uint8_t numGpios, uint8_t * gpioList, unsigned int dirMask, unsigned int valMask);
void closeMultiple(uint8_t numGpios, uint8_t * gpioList);

#endif