#include "gpiouser.h"


/*************************************************************************
*   Attempts to open the gpio referenced by gpioNum
*   If the gpio has already been opened, returns early
*   If the gpio has not already been opened, and the open succeeds,
*       sets the direction referenced by initDirection.
*       The User can use OUTPUT or INPUT directly in the function arguments
*       as these macros are defined in gpiouser.h
*   If the gpio is set to OUTPUT, also sets the gpio to the requested
*       'initValue' --> User can use 'HIGH' or 'LOW' directly for this argument
*   If the gpio is set to INPUT, the contents of 'initValue' are discarded
*       and are arbitrary
**************************************************************************/
void openGPIO(uint8_t gpioNum, uint8_t initDirection, uint8_t initValue) {
    char filePath[50];
    sprintf(filePath, "%s%d", GPIO_CNTRL, gpioNum);
    
    // Check to see if the GPIO has already been exported
    if(access(filePath, F_OK) != -1) {
        fprintf(stderr, "The specified GPIO has already been opened\n", gpioNum);
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


/*************************************************************************
*   Attempts to close the GPIO referenced by gpioNum
*   Returns early if there is nothing to close
**************************************************************************/
void closeGPIO(uint8_t gpioNum) {
    char filePath[50];
    sprintf(filePath, "%s%d", GPIO_CNTRL, gpioNum);
    
    // Check to see if the GPIO has already been exported
    if(access(filePath, F_OK) == -1) {
        fprintf(stderr, "The specified GPIO has not already been opened\n", gpioNum);
        return;
    }

    char unexportPath[50] = "/sys/class/gpio/unexport";
    int unexport_fd = open(unexportPath, O_WRONLY);
    if(unexport_fd < 0) {
        perror("Error opening GPIO unexport file");
        return;
    }

    char gpioStr[5];
    sprintf(gpioStr, "%d", gpioNum);
    if(write(unexport_fd, gpioStr, strlen(gpioStr)) < strlen(gpioStr)) {
        perror("Failed to write the GPIo to the unexport file");
        return;
    }

    if(close(unexport_fd)) {
        perror("Could not close the gpio unexport file");
    }

}


/*************************************************************************
*   Attempts to set the mode of the GPIO specified by pin
*   mode can be INPUT (1) or OUTPUT (0)
*   Returns early if there is no GPIO open at the requested location
**************************************************************************/
void setPinMode(uint8_t pin, uint8_t mode) {
    char filePath[50];
    sprintf(filePath, "%s%d", GPIO_CNTRL, pin);
    
    // Check to see if the GPIO has already been exported
    if(access(filePath, F_OK) == -1) {
        fprintf(stderr, "The specified GPIO %d has not been opened yet\n", pin);
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


/*************************************************************************
*   Attempts to set the value of the GPIO referenced by pin
*   value can be HIGH (1) or LOW(0), though any non-zero value is
*       interpreted as high
*   Returns early if there is not a GPIO open at the requested location
**************************************************************************/
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


/*************************************************************************
*   Attempts to Read the value of the GPIO referenced by pin
*   returns HIGH (1) if the GPIO is currently high
*   returns LOW (0) if the GPIO is currently low
*   if the pin is set to OUTPUT mode, returns the value that it was
*       initialized to, or last set to
*   If any error occurs, returns 2
**************************************************************************/
uint8_t digitalRead(uint8_t pin) {
    char filePath[50];
    sprintf(filePath, "%s%d", GPIO_CNTRL, pin);
    
    // Check to see if the GPIO has already been exported
    if(access(filePath, F_OK) == -1) {
        fprintf(stderr, "The specified GPIO %d has not been opened yet\n", pin);
        fprintf(stderr, "Please call 'openGPIO' first\n");
        return 2;
    }

    char valPath[50];
    sprintf(valPath, "%s%d%s", GPIO_CNTRL, pin, VAL_STUB);
    int val_fd = open(valPath, O_RDONLY);
    if(val_fd < 0) {
        perror("Could not open the gpio value file");
        return 2;
    }

    char result[2];
    if(read(val_fd, result, 1) < 1) {
        perror("Could not read from the gpio value file");
        return 2;
    }

    if(close(val_fd)) {
        perror("Could not close the gpio value file");
    }

    if(result[0] == '0') {
        return LOW;
    } else {
        return HIGH;
    }

    return LOW;
}


/*************************************************************************
*   Attempts to set the polled mode edge operation of the gpio 
*       referenced by gpioNum
*   The string must be 'rising', 'falling', 'both', or 'none'
*   If the string is not in this format, the function will return early
*       having done nothing
**************************************************************************/
void setEdge(uint8_t gpioNum, char * string){
    char filePath[50];
    sprintf(filePath, "%s%d", GPIO_CNTRL, gpioNum);
    
    // Check to see if the GPIO has already been exported
    if(access(filePath, F_OK) == -1) {
        fprintf(stderr, "The specified GPIO %d has not been opened yet\n", gpioNum);
        fprintf(stderr, "Please call 'openGPIO' first\n");
        return;
    }
    
    // Check to see if the string is valid
    char rising[] = "rising";
    char both[] = "both";
    char falling[] = "falling";
    char none[] = "none";
    uint8_t flag = 0;
    char * edges[4] = {rising, both, falling, none};
    for(int i = 0; i < 4; i++) {
        if(strcmp(string, edges[i]) == 0) {
            flag = 1;
            break;
        }
    }

    if(!flag) {
        fprintf(stderr, "That is not a vlaid edge to set\n");
        fprintf(stderr, "Please use 'rising', 'falling', 'both', or 'none'\n");
        return;
    }
    
    char edgePath[50];
    sprintf(edgePath, "%s%d%s", GPIO_CNTRL, gpioNum, EDGE_STUB);
    int edge_fd = open(edgePath, O_WRONLY);
    if(edge_fd < 0) {
        perror("Could not open the gpio edge file");
        return;
    }

    if(write(edge_fd, string, strlen(string)) < strlen(string)) {
        perror("Could not write to the gpio edge file");
        return;
    }

    if(close(edge_fd)) {
        perror("Could not close the gpio value file");
    }

}


/*************************************************************************
*   Writes the value contained in mask to the array of gpioNumbers located
*       in gpioList
*   numGpios must contain the total number of gpios in gpioList
*   values in mask are written to the gpios in little endian format
**************************************************************************/
void writeMultiple(uint8_t numGpios, uint8_t * gpioList, unsigned int mask){
    for(int i = 0; i < numGpios; i++) {
        digitalWrite(*gpioList++, (mask >> i) & 0x01);
    }
}


/*************************************************************************
*   Opens multiple gpios
*       the list of gpios to open must be contained in gpioList
*       and the total number of items in gpioList must be stored in numGpios
*   dirMask and valMask are the initial values assigned to to the gpios
*       on initialization in a little endian format
**************************************************************************/
void openMultiple(uint8_t numGpios, uint8_t * gpioList, unsigned int dirMask, unsigned int valMask) {
    for(int i = 0; i < numGpios; i++) {
        openGPIO(*gpioList++, (dirMask >> i) & 0x01, (valMask >> i) & 0x01);
    }
}


/*************************************************************************
*   Closes multiple gpios
*       the list of gpios to open must be contained in gpioList
*       and the total number of items in gpioList must be stored in numGpios
**************************************************************************/
void closeMultiple(uint8_t numGpios, uint8_t * gpioList){
    for(int i = 0; i < numGpios; i++) {
        closeGPIO(*gpioList++);
    }
}