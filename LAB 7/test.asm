.model small
.stack 100h
.data 
sum db 0
chh dw 0
num dw 0
array db 5 dup (?)

.code
mov ax,@data
mov ds,ax

mov si,0
mov cx,5
input: 
mov ah,1
int 21h   
mov [array+si],al
inc si
loop input

mov si,0
hi:

mov bl,[array+si] 


mov ax,0
mov cx,5
mov di,0
lopp:
mov al,[array+di]
cmp bl,al
je plus
again:
inc di
loop lopp

mov dl,sum
sub dl,1
add dl,48 
 
cmp dl,'0'
je check

mov ah,2
int 21h 

check:
inc num
mov sum,0
mov si,num 



cmp num,5
je done
jmp hi

done:
mov ah,4ch
int 21h

plus:
inc sum 
jmp again


end