.model small
.stack 100h
.data
    input dw 100h dup('?')
    rem dw 0
    num dw 0
    digits dw 100h dup('?')
    msg1 db "Enter A string: $"
   
.code
    mov ax, @data
    mov ds, ax

    mov ah, 9
    mov dx, offset msg1
    int 21h

; taking input
    lea dx, input
    mov ah, 0Ah
    ; sub al,'0'
    int 21h
    
    call newLine

; converting test
    mov si,2
    
    convert:
    mov ax,[input+si]
    mov ah,0
    cmp al,0DH
    je outconvert ;jump out if al is equal to ENTER key

    sub ax,'0'
    mov rem, ax

    mov dx, ax
    add dx,'0'
    mov ah, 2h
    int 21h
    
    mov ax, [num]
    mov bx, 10
    mul bx

    add ax,[rem]
    mov num,ax

    ; increment to move to next
    inc si
    loop convert
    outconvert:
    mov ax,num



; end programm
    mov ah,4ch
    int 21h

    newLine proc
    mov dl, 0Ah
    mov ah, 02h
    int 21h
    ret
    newLine endp

    end
    
