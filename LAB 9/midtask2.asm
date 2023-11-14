.model small
.data
i db 1
j db 5
.code
mov ax,@data
mov ds,ax

mov cl, 5 ;number of iterations
outerloop:    
    mov bh,[j]
    spaceloop:
        mov dl, ' '
        mov ah, 2h
        int 21h
        dec bh
    jnz spaceloop

    ;star
    mov bl,[i]
    starloop:
        mov dl, ch
        add dl,'*'
        mov ah, 2h
        int 21h
        dec bl
    jnz starloop

    mov dl, 0Ah
    mov ah, 02h
    int 21h

    dec j
    cmp j,0
    je endloop
    inc i
    

loop outerloop
endloop:
mov ah,4ch
int 21h
end

