[BITS 32]
[ORG 0x1000]

; video memory -> 0xB8000
    mov byte [0xB8900], 'L'
    mov byte [0xB8901], 0x97

    mov byte [0xB8902], 'O'
    mov byte [0xB8903], 0x97 

    mov byte [0xB8904], 'L'
    mov byte [0xB8905], 0x37 ; 0x3 <- Background color, 0x07 <- color

end:
    jmp end
