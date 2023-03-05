# Comment/uncomment the following line to disable/enable debugging
#DEBUG = y

CC=arm-linux-gnueabihf-gcc 
LD=arm-linux-gnueabihf-ld 
KERNELDIR=/home/rodrigosuch/linux

# Add your debugging flag (or not) to CFLAGS
ifeq ($(DEBUG),y)
  DEBFLAGS = -O -g # "-O" is needed to expand inlines
else
  DEBFLAGS = -O2
endif

CFLAGS += $(DEBFLAGS) -I$(LDDINCDIR)

ifneq ($(KERNELRELEASE),)
# call from kernel build system

obj-m	:= simple.o

else

KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD       := $(shell pwd)

$(info ************ gcc $(CC) **********)
$(info ************ kernel dir $(KERNELDIR) **********)
$(info ************ LDDINCDIR $(LDDINCDIR) **********)

default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) LDDINCDIR=$(PWD)/ modules

endif


clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions

depend .depend dep:
	$(CC) $(CFLAGS) -M *.c > .depend


ifeq (.depend,$(wildcard .depend))
include .depend
endif
