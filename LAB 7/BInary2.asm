.model small
.stack 100h

.data
promt db "   Binary value is: $"
msg1 db "1$"
msg2 db "0$"
number db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 01h
    int 21h
    sub al, '0'
    mov number, al
    lea dx,promt
    mov ah,09h
    int 21h 
    mov ah, number
    mov cx,8
printloop:
    shl al,1
    jc jumpcarry

    lea dx,msg2
    mov ah,09h
    int 21h
    jmp endloop

jumpcarry:
    lea dx,msg1
    mov ah,09h
    int 21h

endloop:
    loop printloop

    mov ah,4ch
    int 21h
main endp

end main