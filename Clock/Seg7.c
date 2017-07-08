#include <stdio.h>
#include <stdlib.h>

#include "Seg7.h"
#include "GPIO.h"

#define ZERO    0x3F
#define ONE     0x06
#define TWO     0x5B
#define THREE   0x4F
#define FOUR    0x66
#define FIVE    0x6D
#define SIX     0x7D
#define SEVEN   0x07
#define EIGHT   0x7F
#define NINE    0x6F
#define AAA     0x77
#define BBB     0x7C
#define CCC     0x58
#define DDD     0x5E
#define EEE     0x79
#define FFF     0x71
#define DOT     0x80

unsigned char hexDig[17] = {ZERO, ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN,
        EIGHT, NINE, AAA, BBB, CCC, DDD, EEE, FFF, DOT};

void printDigit(Pin** pins, int digit){
	printByte(pins, hexDig[digit]);
}

void printByte(Pin** pins, unsigned char pattern) {
	writePin(pins[0], ((pattern >> 0) & 0x01));
	writePin(pins[1], ((pattern >> 1) & 0x01));
	writePin(pins[2], ((pattern >> 2) & 0x01));
	writePin(pins[3], ((pattern >> 3) & 0x01));
	writePin(pins[4], ((pattern >> 4) & 0x01));
	writePin(pins[5], ((pattern >> 5) & 0x01));
	writePin(pins[6], ((pattern >> 6) & 0x01));
}
