#ifndef GPIO_H
#define GPIO_H

//P8
#define GPIO_P8_4 39
#define GPIO_P8_6 35
#define GPIO_P8_7 66
#define GPIO_P8_8 67
#define GPIO_P8_9 69
#define GPIO_P8_10 68
#define GPIO_P8_11 45
#define GPIO_P8_12 44
#define GPIO_P8_14 26
#define GPIO_P8_15 47
#define GPIO_P8_16 46
#define GPIO_P8_17 27
#define GPIO_P8_18 65
#define GPIO_P8_26 61


// P9
#define GPIO_P9_12 60
#define GPIO_P9_15 48
#define GPIO_P9_23 49
#define GPIO_P9_25 117
#define GPIO_P9_27 115

typedef struct Pin {
    FILE* val;
    FILE* dir;
} Pin;

Pin* instPin(Pin* pin, int pinNum, char* dir);
void writePin(Pin* pin, int value);
void setDir(Pin* pin, char* dir);
void unPin(Pin** pin, int numPins);
void closeGPIO();
void initGPIO();
Pin** createPins(int numPin);
#endif
