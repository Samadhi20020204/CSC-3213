.model small
.stack 100h
.data
msg1 db "Enter the first Number : $"
n1 db 0
msg2 db "Enter the second Number : $"
n2 db 0
msg3 db "Sum : $"
msg4 db "Difference : $"
msg5 db "Product : $"
msg6 db "Quotient : $"

.code
start:

mov ax,@data
mov ds,ax

mov dx, offset msg1
mov ah,09h
int 21h

mov ah,01h   ; al=2
int 21h
sub al,48
mov n1,al

mov dl,10
mov ah,02h
int 21h

mov dx, offset msg2
mov ah,09h
int 21h

mov ah,01h   ; al=2
int 21h
sub al,48
mov n2,al

mov dl,10
mov ah,02h
int 21h

mov dx, offset msg3
mov ah,09h
int 21h

mov al,n1
add al,n2
add al,48
mov dl,al
mov ah, 02h
int 21h

mov dl, 10
mov ah, 02h
int 21h

mov dx, offset msg4
mov ah,09h
int 21h

mov al, n1
sub al, n2
add al, 48
mov dl, al
mov ah, 02h
int 21h

mov dl, 10
mov ah, 02h
int 21h

mov dx, offset msg5
mov ah, 09h
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
mov ah, 09h
int 21h

mov al, n1
mov ah, 0
div n2
add al, 48
mov dl, al
mov ah, 02h
int 21h

mov dl, 10
mov ah, 02h
int 21h

mov ax, 4c00h
int 21h
end start