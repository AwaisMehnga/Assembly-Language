.model small
.data



.code
mov ax,@data
mov ds,ax
call input

call input
mov cx,10
mov bx,ax
mov dl,0
mov ah,0
output:
    div cx
    add dl,'0'
    push dx
    cmp bx,0
jnz output

print:
    pop dx
    mov ah,02h
    int 21h

    cmp sp,0
jnz print


;input a number
input PROC
    mov ah, 01h
    xor dx, dx
    inp:
        int 21h 
        sub al, '0'
        mov bx, ax

        cmp al, 13         ; Check for Enter (carriage return)
        je endInpLoop

        mov cx, 10
        mul cx

        add ax, bx
        jmp inp
    endInpLoop:
    ret
input ENDP


mov ah,4ch
int 21h

end