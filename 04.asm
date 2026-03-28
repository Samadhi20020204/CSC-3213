.model small
.stack 100h
.data
n1 db 9
n2 db 3
.code
start:

mov ax,@data
mov ds,ax

mov al,n1
mov ah,0
div n2
mov dl,al
add dl,48

mov ah, 02h
int 21h

mov ax, 4c00h
int 21h
end start