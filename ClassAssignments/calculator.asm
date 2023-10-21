.model small
.data

msg1 db "Enter first number $"
msg2 db "Enter second number $" 
msg3 db "Enter operation | press e to exit $"
msg4 db "Result $"
n1 db ?
n2 db ?
op db ?
res dw ?

.code
mov ax, @data
mov ds, ax
again:
; printing message to get operation or escape
mov ah, 9
mov dx, offset msg3
int 21h

; getting operation
mov ah, 1
int 21h
mov op, al

; exit if it is e is pressed for escape
cmp op,'e'
je done

call newLine

; printing message for first number
mov ah, 9
mov dx, offset msg1
int 21h

; reading first number
mov ah, 1
int 21h
sub al,'0'
mov n1, al ; mov to var n1

call newLine

; printing message for second number
mov ah, 9
mov dx, offset msg2
int 21h

; reading second number
mov ah, 1
int 21h
sub al,'0'
mov n2, al ;move to n2

; if +
cmp op, '+'
; then
je addition
; else if -
cmp op,'*'
; then
je multiplication
; else if /
cmp op,'/'
; then
je division
; else if - 
cmp op,'-' 
; then
je subtraction


; addition operation
addition:
    call additionFunc
    call print
; Multiplication operation
multiplication:
    call multiplicationFunc
    call print
; division operation
division:
    call divisionFunc
    call print
; subtraction operation
subtraction:
    call subtractionFunc
    call print

; Addition function
additionFunc PROC
    mov al, n1
    add al, n2
    mov res, ax
    ret
additionFunc ENDP

;Multiplication Function
multiplicationFunc PROC
    mov al, n1
    mov bl, n2
    mul bl
    mov res,ax
    ret
multiplicationFunc ENDP

;Division Function
divisionFunc PROC
    xor ax,ax
    mov al, n1
    mov bl, n2
    div bl
    mov res,ax
    ret
divisionFunc ENDP

;Subtraction Function
subtractionFunc PROC
    mov al,n1
    sub al,n2
    mov res,ax
    ret
subtractionFunc ENDP
;function for print result
print proc
call newLine

; printing result message
mov ah, 9
mov dx, offset msg4
int 21h

; printing answer
mov ah, 2
mov dx, res
add dx,'0'
int 21h

call newLine
; jump to calculate again
jmp again
print endp;end function

; function for new line
newLine proc 
    mov dl, 0Ah
    mov ah, 02h
    int 21h
    ret
newLine endp

; end of program
done:
mov ah, 4Ch
int 21h

end





