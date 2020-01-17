print:
    pusha; push all
; while (string[i] != 0) { print string[i]; i++ }
start:
    mov al, [bx] ;[bx]为字符串首地址
    cmp al, 0 
    je done

    mov ah, 0x0e
    int 0x10 

    add bx, 1
    jmp start

done:
    popa
    ret



print_nl:
    pusha
    
    mov ah, 0x0e
    mov al, 0x0a ; 0x0a == '\n'
    int 0x10
    mov al, 0x0d ; 0x0d == 回车
    int 0x10
    
    popa
    ret