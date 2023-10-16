.model small
.stack 100h
.data
    input db 100h dup('|')
    digits db '0','1','2','3','4','5','6','7','8','9'
    msg1 db "Enter A string: $"
    msg2 db "Filtered String: $"
    len db ?
.code
    mov ax, @data
    mov ds, ax

    mov ah, 9
    mov dx, offset msg1
    int 21h

    lea dx, input
    mov ah, 0Ah
    int 21h
    
    call newLine
    
; print message of printing string
    mov ah,09h
    lea dx,msg2
    int 21h

; finding the length of string entered for the next loop

mov si,2
mov [len],-1
count:
    mov al,[input+si]
    cmp al,'|'
    je outloop
    jne continue
    continue:
    inc [len]
    inc si
loop count
outloop:


; printing string
    mov si,2
    mov cl, len
    t:  
      
        mov dl,[input+si]
        mov di, 9
        che:
           mov ah,[digits+di]
           cmp ah,dl
           je skip
           dec di
        jnz che
        mov ah,02h
        int 21h
        skip:
        inc si
        
    loop t

    mov ah,4ch
    int 21h
    
    

    newLine proc
    mov dl, 0Ah
    mov ah, 02h
    int 21h
    ret
    newLine endp

    end