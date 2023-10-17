; check whether the number repeates and how many times
.model small
.data

input db 100h dup('|')
uniqueChar db 100 dup(?)
dupCount db 50 dup(?)
dupC db ?
msg1 db "Enter A string: $"
len db ?


.code
mov ax,@data
mov ds,ax

mov ah, 9
mov dx, offset msg1
int 21h

lea dx, input
mov ah, 0Ah
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
        mov al,[input+si]
        mov di,0
        checkUnique:
            mov ah,[uniquechar+di]
            cmp ah,'|'
            je skipTloop
            cmp al,ah
            je skipTloop
            mov bx,di
        loop checkunique
        skipTloop:
        mov [uniquechar+bx],al

        
        
        
        
        
    loop t

    mov ah,4ch
    int 21h

call newLine
    
newLine proc
mov dl, 0Ah
mov ah, 02h
int 21h
ret
newLine endp
end