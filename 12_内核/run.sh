#!bin/sh
i386-elf-gcc -ffreestanding -c function.c -o function.o
i386-elf-ld -o function.bin -Ttext 0x0 --oformat binary function.o
