.model small
.data

char db ?
inp db "Enter a character: $"
vow db " : is vowel$"
nvow db " : is not vowel$"
check db "Check Again Y/N: $"

array db 'a','A','e','E','i','I','o','O','u','U'

.code
mov ax,@data
mov ds,ax

checkAgain:
call newLine

;print message Enter a character
mov ah, 9
mov dx, offset inp
int 21h

mov ah, 1
int 21h
mov [char],al
; loop to check vowel
mov si,0
mov cx,10
lop:
    mov ah,[[array]+si]
    cmp [char],ah
    je vowel
    inc si
loop lop
jmp notvowel

vowel:
    call newLine

    mov dl, [char]
    mov ah, 2h
    int 21h

; print message is vowel
    mov ah, 9
    mov dx, offset vow
    int 21h
    
    call checkVowel

notVowel:
    call newLine

    mov dl, [char]
    mov ah, 2h
    int 21h

; print message is not vowel
    mov ah, 9
    mov dx, offset nvow
    int 21h

    call checkVowel
; end program
last:
    mov ah,4ch
    int 21h

; function to check again
checkVowel PROC
    call newLine
    mov ah, 9
    mov dx, offset check
    int 21h
    
    mov ah, 1
    int 21h
    
    cmp al,'y'
    je checkagain
    cmp al,'Y'
    je checkagain
    jne last
checkVowel ENDP

; function for newline
newLine proc
    mov dl, 0Ah
    mov ah, 02h
    int 21h
    ret
newLine endp
end

