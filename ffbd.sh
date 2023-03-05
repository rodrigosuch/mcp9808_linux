make clean
make -C /home/rodrigosuch/linux M=/home/rodrigosuch/Projects/simple LDDINCDIR=/home/rodrigosuch/Projects/simple/../include modules ARCH=arm KERNELDIR=/home/rodrigosuch/linux CC=arm-linux-gnueabihf-gcc
scp simple.ko rodrigosuch@192.168.1.77:/tmp/
