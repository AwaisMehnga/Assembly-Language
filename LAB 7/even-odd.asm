.model small
.data
array db 2,4,3,5,6
rem db ?
num db ?

msg1 db "   Even: $"
msg2 db "   Odd: $"

.code
mov ax,@data
mov ds,ax


; loop for array
mov cx, 5 
mov si,0

mov bl,2


EO:
    xor ax,ax
    mov al, [array+si]
    mov [num],al 
    
    div bl
    add ah,'0'
    mov [rem],ah
    mov dl,[rem]
    xor dx,dx

    cmp rem,'0'
    je evenN
    jne oddN
    
    evenN:
        mov ah, 9
        mov dx, offset msg1
        int 21h
        
        add [num],'0'
        mov dl, [num]
        mov ah, 2h
        int 21h
        
        jmp endloop
    
    oddN:
        mov ah, 9
        mov dx, offset msg2
        int 21h
        
        add [num],'0'
        mov dl, [num]
        mov ah, 2h
        int 21h
        
    endloop:
    inc si    
loop EO

mov ah,4ch
int 21h

end