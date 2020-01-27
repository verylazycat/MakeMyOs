## 编译

```sh
i386-elf-gcc -ffreestanding -c function.c -o function.o
```

`-ffreestanding`编译时需要系统依赖

#### 查看汇编代码

```bash
i386-elf-objdump -d function.o
```

可见程序是`32Bit`的

```assembly
function.o:     file format elf32-i386
```



### 链接

```bash
i386-elf-ld -o function.bin -Ttext 0x0 --oformat binary function.o
```

`0x0`即函数在内存中的偏移位置

### 反编译

```bash
ndisasm -b 32 function.bin
```

