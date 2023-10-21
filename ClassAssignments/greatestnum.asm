.model small
.data

inp dw 5,4,6,5,8,2,3,1,7,0
great dw ?
result db " :is greates in Array$"

.code
mov ax,@data
mov ds,ax

; check for greater number loop 
mov si,0
mov cx,9
mov ax,[inp+si]
mov [great],ax
check:
    mov ax,[[inp]+si]
    cmp ax,[great]
    jg greater;if greater jump to greater
    jle endloop;if less or equal jump to endloop to skip greater segment
    greater:
        mov [great],ax
        
    endloop:
        ;we need to increment 2 times as we are using 16-bit register 
        inc si
        inc si
loop check

; printing result value
mov dx, [great]
add dx,'0'
mov ah, 2h
int 21h

; printing result message
mov ah, 9
mov dx, offset result
int 21h

; end program
mov ah,4ch
int 21h
end