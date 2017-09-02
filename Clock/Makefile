CC = gcc -std=gnu99
SRC1= i2ctest.c
SRC2= i2ctime.c
SRC3= clockInt.c
SRC4= spiClock.c GPIO_Fun.c Seg7.c
HEADERS= GPIO.h Seg7.h
EXEC1= test
EXEC2= time
EXEC3= interrupt
EXEC4= spi

$(EXEC1): $(SRC1) $(HEADERS)
	$(CC) -g -o $(EXEC1) $(SRC1)

$(EXEC2): $(SRC2) $(HEADERS)
	$(CC) -lrt -g -o $(EXEC2) $(SRC2)

$(EXEC3): $(SRC3) $(HEADERS)
	$(CC) -lrt -g -o $(EXEC3) $(SRC3)

$(EXEC4): $(SRC4) $(HEADERS)
	gcc -std=gnu99 -lrt -g -o $(EXEC4) $(SRC4)

.PHONY: clean

clean:
	rm -f *.0 *~ $(EXEC1) $(EXEC2) $(EXEC3) $(EXEC4)
