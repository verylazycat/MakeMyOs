!#bin/sh
echo '编译'
nasm -f bin interrupts_print.asm -o interrupts_print.bin 
echo '运行'
qemu-system-x86_64 interrupts_print.bin
