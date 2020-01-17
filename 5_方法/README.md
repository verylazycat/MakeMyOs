### 字符

```assembly
mystring:
	db 'Hello,world',0
```

###### 0定义结束

-------

#### 控制结构

```assembly
cmp ax,4
je ax_is_four
jmp else
jmp endif

ax_is_four:
	...
	jmp endif
else:
	...
	jmp endidf
endif:
```

---------

#### 方法调用

```assembly
mov al,'X'
jmp print
endprint:

....

print:
	mov ah,0x0e
	int 0x10
	jmp endprint
```

----

#### 文件导入

```assembly
%include "file.asm"
```

