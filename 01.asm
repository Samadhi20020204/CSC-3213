;Write an 8086 Assembly Language program to read two single-digit numbers from the keyboard, add them, and display the sum , and sub

.model small
.stack 100h
.data
msg1 db "Enter the First Single-digit number : $"
n1 db 0
msg2 db "Enter the Second Single-digit number : $"
n2 db 0
msg3 db "The Sum is : $"
msg4 db "The Subscription is : $"

.code
start:
mov ax, @data  ; ax = al+ah
mov ds, ax

mov dx, offset msg1 ; print the msg1     dx = dl+dh
mov ah, 09h   ; string function
int 21h

mov ah, 01h   ;01h = key board / input function    Read the unput number 01
int 21h   ; 2=al=50
sub al,48  ; al = al-48
mov n1,al ; n1 = 2

mov dl,10
mov ah,02h
int 21h

mov dx, offset msg2
mov ah, 09h
int 21h

mov ah, 01h
int 21h
sub al, 48
mov n2, al

mov dl,10
mov ah,02h
int 21h

mov dx, offset msg3
mov ah,09h
int 21h

mov dl, n1
add dl, n2
add dl, 48

mov ah, 02h
int 21h

mov dl,10
mov ah,02h
int 21h

mov dx, offset msg4
mov ah,09h
int 21h

mov dl, n1
sub dl, n2
add dl, 48

mov ah, 02h
int 21h

mov ax, 4c00h
int 21h
end start