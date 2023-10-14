.model small
.data

inp db 5 dup(?)
great db ?
temp db ?

inpArraymsg db "Enter an array of 5 elements.$"
checkAgainmsg db "Check again. (Y) $"
result db " :is greates in Array$"

.code
mov ax,@data
mov ds,ax
again:
call newLine
; starting input array
mov ah, 9
mov dx, offset inparraymsg
int 21h
call newLine

; loop
mov si,0
mov cx,5
mov ah,01h
input:
    int 21h
    mov [inp+si],al
    inc si
loop input

; check for greater number loop 
mov si,1
mov cx,4
mov ah,[inp]
mov [great],ah
check:
    xor ax,ax
    mov al,[[inp]+si]
    cmp al,[great]
    jg greater
    jle endloop
    
    greater:
        mov [great],0
        mov [great],al
    endloop:
        inc si
loop check

call newLine

; printing result
mov dl, [great]
mov ah, 2h
int 21h

mov ah, 9
mov dx, offset result
int 21h

; checking again
checkagain:
    call newLine
    mov ah, 9
    mov dx, offset checkagainmsg
    int 21h

    mov ah, 1
    int 21h

    cmp al,'y'
    je again
    cmp al,'Y'
    je again

mov ah,4ch
int 21h
; new line functions
newLine proc
mov dl, 0Ah
mov ah, 02h
int 21h
ret
newLine endp

end