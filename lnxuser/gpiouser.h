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

#define SYSFS_GPIO  "/sys/class/gpio"
#define GPIO_CNTRL  "/sys/class/gpio/gpio"
#define EXPORT_PATH "/sys/class/gpio/export"

#define MODE_STUB   "/direction"
#define EDGE_STUB   "/edge"
#define VAL_STUB    "/value"

#define INPUT   1
#define OUTPUT  0

#define HIGH    1
#define LOW     0


void openGPIO(uint8_t gpioNum, uint8_t initDirection, uint8_t initValue);
void setPinMode(uint8_t pin, uint8_t mode);
void digitalWrite(uint8_t pin, uint8_t value);
uint8_t digitalRead(uint8_t pin);

#endif