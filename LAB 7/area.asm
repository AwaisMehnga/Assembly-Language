.model small
.data
height dw ?
wid dw ?
area dw ?
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
sub ax,'0'
mov [wid],ax

call newLine
; getting height
mov ah, 9
mov dx, offset hmsg
int 21h

mov ah, 1
int 21h
sub ax,'0'
mov [height],ax

; calculating area
xor ax,ax
mov ax, [wid]
mov bx, [height]
mul bx  

mov [area],ax

; printing result
call newLine
mov ah, 9
mov dx, offset [result]
int 21h

mov dx, [area]
add dx, '0'
mov ah, 2h
int 21h

mov ah, 9
mov dx, offset [unit]
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