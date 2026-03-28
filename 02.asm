;Write an 8086 Assembly Language program to read two two-digit numbers from the keyboard, add them, and display the sum, and sub


.model small
.stack 100h
.data
msg1 db "Enter the 1st Number : $"
msg2 db "Enter the 2nd Number : $"
msg3 db "Sum is : $"
msg4 db "Sub is : $"
t1 db 0  ; 24 
o1 db 0
dig1 db 0
r1 db 0
t2 db 0  ; 32
o2 db 0
dig2 db 0
r2 db 0

.code
start:
mov ax, @data
mov ds, ax

mov dx, offset msg1
mov ah, 09h
int 21h

;read the 1st digit

mov ah, 01h   ; al=50
int 21h
sub al, 48  ; al-48=2
mov t1,al  ;  t=2

;read the 2nd digit

mov ah,01h  ; al=51
int 21h
sub al, 48  ; al-48=3
mov o1, al  ; o=4

; t=2  o=3   t*10+o
mov bl, 10  ; bl=10
mov al, t1; al = 2
mul bl  ; al=al*bl = 2*10
add al, o1  ; al+o = 20+4
mov dig1, al ; dig1 = al= 24 /10 = 2 rem 4

mov dl, 10
mov ah, 02h
int 21h

mov dx, offset msg2
mov ah, 09h
int 21h

;read the 3rd digit

mov ah, 01h   ; al=50
int 21h
sub al, 48  ; al-48=2
mov t2,al  ;  t=3

;read the 4th digit

mov ah,01h  ; al=51
int 21h
sub al, 48  ; al-48=3
mov o2, al  ; o=2

; t=3  o=2   t*10+o
mov bl, 10  ; bl=10
mov al, t2; al = 3
mul bl  ; al=al*bl = 3*10
add al, o2  ; al+o = 30+2
mov dig2, al ; dig2 = al= 32 /10 = 3 rem 2

mov dl, 10
mov ah, 02h
int 21h

mov dx, offset msg3
mov ah, 09h
int 21h

mov bl, 10
mov dl, dig1
add dl, dig2
mov al, dl
mov ah, 00
div bl

mov r1, ah

mov dl, al ; print 2
add dl,48
mov ah, 02h
int 21h

mov dl,r1 ; print 4
add dl, 48
mov ah, 02h
int 21h

mov dl, 10
mov ah, 02h
int 21h

mov dx, offset msg4
mov ah, 09h
int 21h

mov bl, 10
mov dl, dig2
sub dl, dig1
mov al, dl
mov ah, 00
div bl

mov r2, ah

mov dl, al ; print 3
add dl,48
mov ah, 02h
int 21h

mov dl,r2 ; print 2
add dl, 48
mov ah, 02h
int 21h

mov ax, 4c00h
int 21h
end start
