CFLAGS=$(shell if which libusb-config > /dev/null; then		\
	   		libusb-config --cflags;							\
	    fi)
LDFLAGS=$(shell if which libusb-config > /dev/null; then	\
	   		libusb-config --libs;							\
		  else												\
		  	echo -lusb;										\
	      fi)
all: rkflashtool

rkflashtool: rkflashtool.c
	gcc -o rkflashtool rkflashtool.c $(CFLAGS) $(LDFLAGS)-1.0 -O2 -W -Wall

param:
	sudo ./rkflashtool r 0x0000 0x2000 > /tmp/parm
