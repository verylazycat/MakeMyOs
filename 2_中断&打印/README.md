### 目标：打印HELLO到屏幕上

---

将HELLO每个字符写到寄存器`al`上（`ax`的低位），将`0x0e`写到寄存器ah里面（ax高位）,0x10是视屏中的一般中断

----

[BIOS](https://baike.baidu.com/item/BIOS/91424)中断调用（BIOS interrupt calls）是一组功能，为[DOS](https://baike.baidu.com/item/DOS/32025)程序与一些软件提供使用[IBM](https://baike.baidu.com/item/IBM/9190) PC兼容机上BIOS的功能。一些操作系统在系统引导时也使用BIOS以检测并初始化硬件资源

---

调用中断，可以使用x86汇编语言的INT指令

指令原型：

```assembly
int n
```

- n表示中断号，1字节正整数范围：【0~255】

- 执行“int n”时，CPU从中断向量表中，找到第n号表项，修改CS和IP
  $$
  IP = n * 4\\
  CS = (n * 4 + 2)
  $$

- 对8086PC，中断向量表指定放在内存地址0处（地址固定），共1024个字节。每个表项占两个字，低字存放偏移地址，高字存放段地址

---

```assembly
mov ah,0x0e
mov al,'H'
int 0x10
mov al,'E'
int 0x10
mov al,'L'
int 0x10
int 0x10
mov al,'O'
int 0x10
jmp $
times 510-($ - $$) db 0
dw 0xaa55
```

