.model small

.data
num dw ?           ; 2-byte variable to store the input
numMsg db "Enter a number $"
msg1 db "Entered Number is even $"
msg2 db "Entered Number is odd $"

.code
mov ax, @data
mov ds, ax

; Printing message for input
mov ah, 9
mov dx, offset numMsg
int 21h

; Taking input
mov ah, 1
int 21h
sub al, '0'
mov [num], ax 

; printing a new line
mov dx, 0Ah
mov ah, 02h
int 21h

; Check if the number is even or odd
mov ax, [num]
test ax, 1 ;check the least significant bit (LSB) of the number to determine if it's even or odd
jz evenNum  ; Jump to evenNum if LSB is 0

; odd msg segment
oddNum:
    mov ah, 9
    mov dx, offset msg2
    int 21h
    jmp last

;even number message segment
evenNum:
    mov ah, 9
    mov dx, offset msg1
    int 21h

last:
mov ah, 4Ch
int 21h

end
