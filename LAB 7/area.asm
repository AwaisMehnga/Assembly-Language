.model small
.data
height db ?
wid db ?
area db ?
wmsg db "Enter width: $"
hmsg db "Enter height: $"
result db "Area is: $"
unit db " meter square $"
.code
mov ax,@data
mov ds,ax

; getting width
mov ah, 9
mov dx, offset wmsg
int 21h

mov ah, 1
int 21h
mov [wid],al

call newLine
; getting height
mov ah, 9
mov dx, offset hmsg
int 21h

mov ah, 1
int 21h
mov [height],al

; calculating area
mov al, [wid]
mov bl, [height]
mul bl  
mov [result],dl

; printing result
call newLine
mov ah, 9
mov dx, offset result
int 21h

mov dl, [result]
mov ah, 2h
int 21h

mov ah, 9
mov dx, offset unit
int 21h

mov ah,4ch
int 21h

newLine proc
mov dl, 0Ah
mov ah, 02h
int 21h
ret
newLine endp
end