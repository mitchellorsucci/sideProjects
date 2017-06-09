#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<linux/i2c-dev.h>
#include<sys/ioctl.h>
#include<sys/types.h>
#include<fcntl.h>
#include<time.h>

int i2c_adx = 0b01110001;
char i2cport[] = "/dev/i2c-1";
void writeByte(int fd, char * data);
void writeCandD(int fd, char command, char data);

int main() {
	int fd;
	time_t rawtime;
	struct tm * cur;
	char hour1, hour2, minute3, minute4;

	// Set up the I2C port
	if((fd = open(i2cport, O_RDWR)) < 0) {
		printf("FAILED TO OPEN I2C PORT\n");
		exit(1);
	}

	// Attach slave to the bus
	if(ioctl(fd, I2C_SLAVE,i2c_adx) < 0) {
		printf("FAILED TO LINK WITH SLAVE\n");
		exit(1);
	}
	

	//unsigned char clear = 0x76;
	//unsigned char nums[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
	//write(fd, &clear, 1);
	//write(fd, nums + 1 , 1);
	//write(fd, nums + 2, 1);
	//write(fd, nums + 3, 1);

	writeCandD(fd, 0x77, 0x10); // turn on the colon 
	while(1) {
		writeCandD(fd, 0x79, 0x00);
		usleep(1000);
		time(&rawtime); // get the current time  --- same as rawtime = time(NULL);		
		cur = localtime(&rawtime); // convert to usable format and local time
		hour1 = (char) (cur->tm_hour / 10);
		hour2 = (char) (cur->tm_hour % 10);
		minute3 = (char) (cur->tm_min / 10);
		minute4 = (char) (cur->tm_min % 10);
		writeByte(fd, &hour1);
		writeByte(fd, &hour2);
		writeByte(fd, &minute3);
		writeByte(fd, &minute4);
		usleep(500000);
	}

} 

void writeByte(int fd, char * data) {
	write(fd, data, 1);
}

void writeCandD(int fd, char command, char data) {
	char packet[2] = {command, data};
	write(fd, packet, 2);
}
