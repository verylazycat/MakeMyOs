!#bin/sh
echo '编译'
nasm -f bin boot_sector.asm -o boot_sector.bin
echo '运行'
qemu-system-x86_64 boot_sector.bin
