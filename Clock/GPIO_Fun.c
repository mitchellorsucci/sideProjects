#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "GPIO.h"

FILE* sys;
char initStatusGPIO = 0;

// This function writes 1 to pin if the value is nonzero. Otherwise is writes
// 0 to the pin.
void writePin(Pin* pin, int value) {
    fprintf(pin->val, "%d", !!value);
    fflush(pin->val);
}

// This function sets/changes the direction of a pin to dir.
void setDir(Pin* pin, char* dir) {
    fprintf(pin->dir, "%s", dir);
    fflush(pin->dir);
}

void initGPIO() {
    if (!initStatusGPIO)
        sys = fopen("/sys/class/gpio/export", "w");
    assert(sys != NULL);
    initStatusGPIO = 1;
}

void closeGPIO() {
    if (initStatusGPIO && sys)
        fclose(sys);
    initStatusGPIO = 0;
}

// This function instantiates a pin given the pin number, direction, and GPIO
// filesystem
Pin* instPin(Pin* pin, int pinNum, char* dir) {
    initGPIO();
    fprintf(sys, "%d", pinNum);
    fflush(sys);

    char dirName[33] = "/sys/class/gpio/gpio00/direction";
    char valName[29] = "/sys/class/gpio/gpio00/value";

    dirName[20] += (pinNum % 100)/10;
    dirName[21] += pinNum % 10;
    valName[20] = dirName[20];
    valName[21] = dirName[21];

    //Setup the GPIO direction
    pin->dir = fopen(dirName, "w");
    assert(pin->dir != NULL);
    fseek(pin->dir, 0, SEEK_SET);
    setDir(pin, dir);

    //Opens the file that controls if the pin is high or low
    pin->val = fopen(valName, "w");
    assert(pin->val != NULL);
    fseek(pin->val, 0, SEEK_SET);

    return pin;
}

// This function closes an array of pins.
void unPin(Pin** pin, int numPins) {
    for (int i = 0; i < numPins; i++) {
        fclose(pin[i]->dir);
        fclose(pin[i]->val);
        free(pin[i]);
    }

    free(pin);
}

Pin** createPins(int numPin) {
    Pin** pin = (Pin**) malloc(numPin*sizeof(Pin*));

    for (int i = 0; i < numPin; i++) {
        pin[i] = (Pin*) malloc(sizeof(Pin));
    }

    return pin;
}
