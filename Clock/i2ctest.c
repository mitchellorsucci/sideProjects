#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<linux/i2c-dev.h>
#include<sys/ioctl.h>
#include<sys/types.h>
#include<fcntl.h>

int i2c_adx = 0b01110001;
char i2cport[] = "/dev/i2c-1";

int main() {
	int fd;
	
	if((fd = open(i2cport, O_RDWR)) < 0) {
		printf("FAILED TO OPEN I2C PORT\n");
		exit(1);
	}

	if(ioctl(fd, I2C_SLAVE,i2c_adx) < 0) {
		printf("FAILED TO LINK WITH SLAVE\n");
		exit(1);
	}
	
	unsigned char clear = 0x76;
	unsigned char nums[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
	write(fd, &clear, 1);
	write(fd, nums + 1 , 1);
	write(fd, nums + 2, 1);
	write(fd, nums + 3, 1);
	write(fd, nums + 4, 1);

}
