.model small
.data

inpTemp db 0
additive db 0

qoutiont db 0



.code
mov ax,@data
mov ds,ax

    call input
    mov bl,al
    call input
    add al,bl
    
    call ouput
    call ouput
    mov ah,4ch
int 21h
    


    ;Input a number [the value is stored in al register]
    input PROC
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
        ret
    input ENDP




    ;Output value
    ouput PROC
        ; setting qoutiont
        mov [qoutiont],0
        mov [qoutiont],al
        ; seprating each character and storing on stack
        ; pop ax
        op:
            xor ax,ax
            mov al,[qoutiont]
            mov bl, 10
            div bl
            mov [qoutiont],al  
            push ax    
            cmp al,0
        jnz op
        
        ; printing value
       
        printOP:
        pop ax
        mov dl, ah      
        add dl, '0'        
        mov ah, 02h        
        int 21h            
        cmp sp,0
        jne printOP 
    
        ret
    ouput ENDP

end
