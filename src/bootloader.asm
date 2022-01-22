[BITS 16]
[ORG 0x0]

jmp start
%include "src/utils/UTIL.INC"
start:

    mov ax, 0x07C0
    mov ds, ax
    mov es, ax
    mov ax, 0x8000  
    mov ss, ax
    mov sp, 0xf000

    mov [bootdrv], dl  

    mov si, msgLoading
    call display

; loading kernel
    xor ax, ax
    int 0x13

    push es
    mov ax, 0x100
    mov es, ax
    mov bx, 0

    mov ah, 2
    mov al, 1 
    mov ch, 0
    mov cl, 2
    mov dh, 0
    mov dl, [bootdrv]
    int 0x13
    pop es

; GDT pointer
    mov ax, gdtend    
    mov bx, gdt
    sub ax, bx
    mov word [gdtptr], ax

    xor eax, eax     
    xor ebx, ebx
    mov ax, ds
    mov ecx, eax
    shl ecx, 4
    mov bx, gdt
    add ecx, ebx
    mov dword [gdtptr+2], ecx

    cli 
    lgdt [gdtptr]    
    ; protected mode to 1 (ON) 0 = OFF
    mov eax, cr0
    or  ax, 1 
    mov cr0, eax        

    jmp next
next:
    mov ax, 0x10       
    mov ds, ax
    mov fs, ax
    mov gs, ax
    mov es, ax
    mov ss, ax
    mov esp, 0x9F000    

    jmp dword 0x8:0x1000    

bootdrv:  db 0
msgLoading: db "Loading kernel...", 13, 10, 0

gdt:
    db 0, 0, 0, 0, 0, 0, 0, 0
gdt_cs:
    db 0xFF, 0xFF, 0x0, 0x0, 0x0, 10011011b, 11011111b, 0x0
gdt_ds:
    db 0xFF, 0xFF, 0x0, 0x0, 0x0, 10010011b, 11011111b, 0x0
gdtend:

gdtptr:
    dw 0  ; limit
    dd 0  ; base

times 510-($-$$) db 144
dw 0xAA55
