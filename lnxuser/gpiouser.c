#include "gpiouser.h"

void openGPIO(uint8_t gpioNum, uint8_t initDirection, uint8_t initValue) {
    char filePath[50];
    sprintf(filePath, "%s%d", GPIO_CNTRL, gpioNum);
    
    // Check to see if the GPIO has already been exported
    if(access(filePath, F_OK) != -1) {
        fprintf(stderr, "The specified GPIO has already been opened\n");
        return;
    }

    // Write the pin number to export
    char exportPath[50] = EXPORT_PATH;
    int export_fd = open(exportPath, O_WRONLY);
    if(export_fd < 0) {
        perror("Error opening GPIO export file");
        return;
    }

    char gpioStr[5];
    sprintf(gpioStr, "%d", gpioNum);
    if(write(export_fd, gpioStr, strlen(gpioStr)) < strlen(gpioStr)) {
        perror("Could not write to the gpio export file");
        return;
    }
    if(close(export_fd)) {
        perror("Could not close the gpio export file");
    }

    // Initialize the GPIO to given arguments
    setPinMode(gpioNum, initDirection);
    if(!initDirection) {
        // Initialized to out, set the initial value
        digitalWrite(gpioNum, initValue);
    }

}

void setPinMode(uint8_t pin, uint8_t mode) {
    char filePath[50];
    sprintf(filePath, "%s%d", GPIO_CNTRL, pin);
    
    // Check to see if the GPIO has already been exported
    if(access(filePath, F_OK) == -1) {
        fprintf(stderr, "The specified GPIO has not been opened yet\n");
        fprintf(stderr, "Please call 'openGPIO' first\n");
        return;
    }

    char dirPath[50];
    sprintf(dirPath, "%s%d%s", GPIO_CNTRL, pin, MODE_STUB);
    int dir_fd = open(dirPath, O_WRONLY);
    if(dir_fd < 0) {
        perror("Could not open the gpio mdoe file");
        return;
    }
    
    char mode_str[5];
    sprintf(mode_str, "%s", mode ? "in" : "out");
    if(write(dir_fd, mode_str, strlen(mode_str)) < strlen(mode_str)) {
        perror("Unable to write to gpio mode file");
        return;
    }

    if(close(dir_fd)) {
        perror("Error closing gpio mode file");
    }

}

void digitalWrite(uint8_t pin, uint8_t value) {
    char filePath[50];
    sprintf(filePath, "%s%d", GPIO_CNTRL, pin);
    
    // Check to see if the GPIO has already been exported
    if(access(filePath, F_OK) == -1) {
        fprintf(stderr, "The specified GPIO has not been opened yet\n");
        fprintf(stderr, "Please call 'openGPIO' first\n");
        return;
    }

    char valPath[50];
    sprintf(valPath, "%s%d%s", GPIO_CNTRL, pin, VAL_STUB);
    int val_fd = open(valPath, O_WRONLY);
    if(val_fd < 0) {
        perror("Could not open the gpio value file");
        return;
    }

    char * val_str;
    val_str = (value) ? "1" : "0";
    if(write(val_fd, val_str, strlen(val_str)) < strlen(val_str)) {
        perror("Could not write to the gpio value file");
        return;
    }

    if(close(val_fd)) {
        perror("Could not close the gpio value file");
    }

}

uint8_t digitalRead(uint8_t pin) {
    char filePath[50];
    sprintf(filePath, "%s%d", GPIO_CNTRL, pin);
    
    // Check to see if the GPIO has already been exported
    if(access(filePath, F_OK) == -1) {
        fprintf(stderr, "The specified GPIO has not been opened yet\n");
        fprintf(stderr, "Please call 'openGPIO' first\n");
        return;
    }

    char valPath[50];
    sprintf(valPath, "%s%d%s", GPIO_CNTRL, pin, VAL_STUB);
    int val_fd = open(valPath, O_RDONLY);
    if(val_fd < 0) {
        perror("Could not open the gpio value file");
        return;
    }

    char result[2];
    if(read(val_fd, result, 1) < 1) {
        perror("Could not read from the gpio value file");
        return;
    }

    if(close(val_fd)) {
        perror("Could not close the gpio value file");
    }

    if(result[0] == '0') {
        return 0;
    } else {
        return 1;
    }

    return 0;
}