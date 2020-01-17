!#bin/sh
echo '编译'
nasm boot_sector_main.asm -o boot_sector_main.bin
echo '运行'
qemu-system-x86_64 boot_sector_main.bin
