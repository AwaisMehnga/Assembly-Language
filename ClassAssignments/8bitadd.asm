.model small
.data
msg1 db "Enter first digit: $" ;message for first digit
msg2 db "Enter second digit: $" ;message for second digit
res db ? ;creating a variable to store result initialize with ?
.code
mov ax,@data
mov ds,ax

; Printing first message
mov ah, 9
mov dx, offset msg1
int 21h

; taking first input
mov ah, 1
int 21h
sub al,'0';converting to decimal
mov bl,al ;moving to bl as input always stores in al register

; printing a new line
mov dl, 0Ah
mov ah, 02h
int 21h

; Printing second message
mov ah, 9
mov dx, offset msg2
int 21h

; taking second input
mov ah, 1
int 21h
sub al,'0';converting to decimal

; adding the digits
add al,bl ;it adds bl value in al value and stores in al
mov [res],al
; printing a new line
mov dl, 0Ah
mov ah, 02h
int 21h

; printing result
mov dl, [res]
add dl,'0' ;converting to ASCII
mov ah, 2h
int 21h

;ending the program
mov ah,4ch
int 21h

end