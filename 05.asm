.model small
.stack 100h
.data
n1 db 2
n2 db 3
msg1 db "num1 : 2 $"
msg2 db "num2 : 3 $"
msg3 db "Addition of num1 and num2 : $"
msg4 db "Subtraction of num2 and num1 : $"
msg5 db "Multiplication of num1 and num2 : $"
msg6 db "Division of num1 and num2 : $"
.code
start:

mov ax,@data
mov ds,ax

mov dx, offset msg1
mov ah,09h
int 21h

mov dl, 10
mov ah, 02h
int 21h

mov dx, offset msg2
mov ah,09h
int 21h

mov dl, 10
mov ah, 02h
int 21h

mov dx, offset msg3
mov ah,09h
int 21h

mov dl,n1
add dl,n2
add dl,48
mov ah, 02h
int 21h

mov dl, 10
mov ah, 02h
int 21h

mov dx, offset msg4
mov ah,09h
int 21h

mov dl,n2
sub dl,n1
add dl,48
mov ah, 02h
int 21h

mov dl, 10
mov ah, 02h
int 21h

mov dx, offset msg5
mov ah,09h
int 21h

mov al,n1
mul n2
mov dl, al
add dl,48
mov ah, 02h
int 21h

mov dl, 10
mov ah, 02h
int 21h

mov dx, offset msg6
mov ah,09h
int 21h

mov al,n2
mov ah,0
div n1
mov dl,al
add dl,48
mov ah, 02h
int 21h

mov dl, 10
mov ah, 02h
int 21h

mov ax, 4c00h
int 21h
end start