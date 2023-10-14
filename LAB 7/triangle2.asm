.model small
.data
i dw ?
.code
mov ax, @data
mov ds, ax

mov ch, 5
mov si,5


outerLoop:
    mov i,5
    mov bx,si
    sub i,bx

    innerLoop:
        cmp i,0
        je continue
        jne space
        space:
            mov ah, 02h
            mov dl, ' '
            int 21h
            dec [i]
            jmp innerloop
            
        continue:
            mov ah, 02h
            mov dl, '*'
            int 21h
            dec bx

    jnz innerLoop

    ; printing new line
    mov dl, 0Ah
    mov ah, 02h
    int 21h

    ;changing value
    dec si
    dec ch
    jnz outerLoop

mov ah, 4Ch
int 21h
end
 