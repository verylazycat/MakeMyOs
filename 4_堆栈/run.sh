!#bin/sh
echo '编译'
nasm stack.asm -o stack.bin
echo '运行'
qemu-system-x86_64 stack.bin
