#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <linux/i2c-dev.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <fcntl.h>
#include <time.h>

int i2c_adx	=	0b01110001;
int adc_slave = 0x48;

char i2cport[] = "/dev/i2c-1";
void writeByte(int fd, char * data);
void writeCandD(int fd, char command, char data);
void writeADC(int adc);
int readADC(int adc);
int readADCOutput(int channel);

int main() {
	int fd, adc;
	time_t rawtime;
	struct tm * cur;
	char hour1, hour2, minute3, minute4;

	// Set up the I2C port
	if((fd = open(i2cport, O_RDWR)) < 0) {
		printf("FAILED TO OPEN I2C PORT FOR SEG7\n");
		exit(1);
	}

	if((adc = open(i2cport, O_RDWR)) < 0) {
		printf("FAILED TO OPEN I2C PORT FOR ADC\n");
		exit(1);
	}

	// Attach seg 7 to the bus
	if(ioctl(fd, I2C_SLAVE,i2c_adx) < 0) {
		printf("FAILED TO LINK WITH SEG7\n");
		exit(1);
	}

	// Attach adc to the bus
	if(ioctl(adc, I2C_SLAVE, adc_slave) < 0) {
		printf("FAILED TO LINK WITH ADC\n");
		exit(1);
	}

	char clear = 0x76;
	writeByte(fd, &clear); // clear the display
	writeCandD(fd, 0x77, 0x10); // turn on the colon 
	time(&rawtime);
	cur = localtime(&rawtime);
	hour1 = (char) (cur->tm_hour / 10);
	hour2 = (char) (cur->tm_hour % 10);
	minute3 = (char) (cur->tm_min / 10);
	minute4 = (char) (cur->tm_min % 10);
	writeByte(fd, &hour1);
	writeByte(fd, &hour2);
	writeByte(fd, &minute3);
	writeByte(fd, &minute4);

	while(1) {
		char t_hour1, t_hour2, t_minute3, t_minute4;
		usleep(1000);
		//time(&rawtime); // get the current time  --- same as rawtime = time(NULL);		
		rawtime = time(NULL);
		cur = localtime(&rawtime); // convert to usable format and local time
		t_hour1 = (char) (cur->tm_hour / 10);
		t_hour2 = (char) (cur->tm_hour % 10);
		t_minute3 = (char) (cur->tm_min / 10);
		t_minute4 = (char) (cur->tm_min % 10);
		
		if(t_hour1 != hour1) {
			hour1 = t_hour1;
			writeCandD(fd, 0x79, 0x00);
			usleep(500);
			writeByte(fd, &hour1);
			usleep(1000);
		}
		if(t_hour2 != hour2) {
			hour2 = t_hour2;
			writeCandD(fd, 0x79, 0x01);
			usleep(500);
			writeByte(fd, &hour2);
			usleep(1000);
		}

		if(t_minute3 != minute3) {
			minute3 = t_minute3;
			writeCandD(fd, 0x79, 0x02);
			usleep(500);
			writeByte(fd, &minute3);
			usleep(1000);
		}
		if(t_minute4 != minute4) {
			minute4 = t_minute4;
			writeCandD(fd, 0x79, 0x03);
			usleep(500);
			writeByte(fd, &minute4);
			usleep(1000);
		}

		// Turn the colon on every other second
		if(cur->tm_sec % 2 == 0) {
			writeCandD(fd, 0x77, 0x10);
		} else {
			writeCandD(fd, 0x77, 0x00);
		}
		usleep(50000);
		// writeADC(adc);
		// usleep(1000);
		// int value = readADC(adc);
		// printf("\tAIN0:\t%d\n", value);
	}


} 

void writeByte(int fd, char * data) {
	write(fd, data, 1);
}

void writeCandD(int fd, char command, char data) {
	char packet[2] = {command, data};
	write(fd, packet, 2);
}

void writeADC(int adc){
	// 0x01 sets the pointer register to the config register
	// 0x44 sets single ended read of ain0, and default gain (+/- 2.5v), in continuous conversion mode
	// 0x00 sets the data rate to the fastest possible, and also deals with the comparator, which is unused here
	char packet[] = {0x01, 0x42, 0xE0};
	write(adc, packet, 3);
}


int readADC(int adc) {
	// First we must set the ADC to read the proper register
	char data = 0x00;
	write(adc, &data, 1);
	char buf[2];
	read(adc, buf, 2);
	int result = 0;
	result |= ((buf[0] >> 4) & 0x0F) << 8;
	result |= ((buf[0] << 4) & 0xF0) | ((buf[1] >> 4) & 0x0F);
	return result;
}


int readADCOutput(int channel) {
	return -1;
}



