display:
    push ax
    push bx
.start:
    lodsb         
    cmp al, 0     
    jz .end
    mov ah, 0x0E  
    mov bx, 0x07  
    int 0x10
    jmp .start

.end:
    pop bx
    pop ax
    ret
