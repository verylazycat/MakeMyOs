!#bin/sh
echo '编译'
nasm -f bin boot_sector_memory.asm -o boot_sector_memory.bin
echo '运行'
nasm -f bin boot_sector_memory.asm -o boot_sector_memory.bin
