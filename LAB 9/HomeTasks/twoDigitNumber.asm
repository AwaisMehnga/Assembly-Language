.model small
.data

num1 db ?
num2 db ?

.code
mov ax, @data
mov ds, ax

; Input the first number
mov ah, 01h
int 21h
sub al, '0'  ; Convert ASCII to integer
mov num1, al

; Input the second number
mov ah, 01h
int 21h
sub al, '0'  ; Convert ASCII to integer
mov num2, al

; Shift and combine the numbers
mov al, num1
shl al, 4        ; Shift the first number to the left by 4 bits
mov bl, num2
and bl, 0FH      ; Extract the lower 4 bits of the second number
or al, bl        ; Combine both numbers

; Convert the result back to ASCII
add al, '0'
mov dl, al       ; Result in DL register

; Display the result
mov ah, 02h
int 21h
mov ah,4ch
int 21h
end

