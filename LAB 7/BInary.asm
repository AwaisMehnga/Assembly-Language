; binary of a given number

.model small
.stack 100h 
.data
 
  q db 0
  msg db 'Enter the decimal number: $'
  msg1 db 0dh, 0ah, 'Binary number is: $'

.code
mov ax, @data
mov ds, ax

mov ah, 9
mov dx, offset msg
int 21h


mov ah, 01h
int 21h
sub al,'0'
mov q,al
;converting to binary
mov sp,0
again:
xor ax,ax
mov al, q
mov bl, 2
div bl
push ax
mov q,al

cmp q, 0
jne again
exitloop:

mov ah, 9
mov dx, offset msg1
int 21h

disp:
pop ax
mov dl,ah
add dl,'0'
mov ah,02h
int 21h
cmp sp,0
jne disp



mov ah, 4ch
int 21h


end
