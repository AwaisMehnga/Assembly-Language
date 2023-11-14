.model small
.data
inpTemp db 0
additive db 0
promt db "   Binary value is: $"
msg1 db "1$"
msg2 db "0$"
.code
mov ax,@data
mov ds,ax


mov [inptemp],0
        mov [additive],0
        mov si,-1
        inp:
            mov ah,01h
            int 21h
            ; if enter exit the loop
    
            cmp al,0Dh
            je TerminateInpLoop

            inc si
            sub al,'0'
            ; if it's first iteration skip next steps
            cmp si,0
            je endInpLoop

            ; coverting to number
        
            mov [inpTemp],al
            mov al,[additive]
            mov bl, 10
            mul bl
            add al,[inpTemp]
            endInpLoop:
            mov [additive],al
            
            mov ax,0
        jmp inp
        TerminateInpLoop:
        mov al,[additive]
        

        lea dx,promt
    mov ah,09h
    int 21h 
    mov ah, [additive]
    mov cx,8
printloop:
    shl al,1
    jc jumpcarry

    lea dx,msg2
    mov ah,09h
    int 21h
    jmp endloop

jumpcarry:
    lea dx,msg1
    mov ah,09h
    int 21h

endloop:
    loop printloop
        mov ah,4ch
        int 21h
end