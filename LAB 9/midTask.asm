.model small
.data
isDivided db " :is divided  $"
notDivided db " :not divided    $"
char dw ?



.code
mov ax,@data
mov ds,ax

mov si,1
mov cx, 9 ;number of iterations
mov ax,0
check:
    mov dx, si
    mov dx,0
    mov [char],si
     
    mov ax, [char]
    mov bx, 3
    div bx
    
    cmp dx,0
    je printeven
    
    mov dx, [char]
    add dx,'0'
    mov ah, 2h
    int 21h
    
    mov ah, 9
    mov dx, offset notDivided
    int 21h
    
    jmp endloop
    
    printeven:
        mov dx, [char]
        add dx,'0'
        mov ah, 2h
        int 21h

        mov ah, 9
        mov dx, offset isDivided
        int 21h

    
    endloop:
    inc si
loop check

mov ah,4ch
int 21h
end