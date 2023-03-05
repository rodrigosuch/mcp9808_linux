make clean
make -C /home/rodrigosuch/linux M=$(pwd) LDDINCDIR=/home/rodrigosuch/Projects/simple/../include modules ARCH=arm KERNELDIR=/home/rodrigosuch/linux CC=arm-linux-gnueabihf-gcc
scp simple.ko rodrigosuch@192.168.1.77:/tmp/
