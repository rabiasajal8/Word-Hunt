[org 0x100]

jmp start

string: db 'SCORE', 0
string2: db 'STOP', 0
string3: db 'NEW', 0
MSGG: db '~PROJECT BY RABIA SAJAL NIAZI~',0
msg : db'*** WELCOME TO WORD SEARCH ***', 0
msg2: db'ENTER A WORD TO SEARCH', 0
compare : db 'AAAA'
fscreen: db 'WELCOME TO WORD SEARCH',0
score: db 0

a:db 'A', 0
v:db 'V', 0
g:db 'G', 0
o:db 'O', 0

aa:db 'A', 0
l:db 'L', 0
i:db 'I', 0
m:db 'M', 0


a3:db 'A', 0
r:db 'R', 0
w:db 'W', 0
e:db 'E', 0

rr:db 'R', 0
a4:db 'A', 0
k:db 'K', 0
u:db 'U', 0


row1: db 'AVGO'
row2:  db 'ALIM'
row3:  db 'ARWE'
row4: db 'RAKU'
col1: db 'AAAR'
col2:  db 'VLRA'
col3: db 'GIWK'
col4: db 'OMEU'
diag1: db 'ALWU'
diag2 : db 'OIRR'





scoreincremeting:

 push bp 
 mov bp, sp 
 push es 
 push ax 
 push bx 
 push cx 
 push dx 
 push di 
 mov ax, 0xb800 
 mov es, ax
 mov ah, 2
 mov al, byte[score]
 add al,0x30 
 mov bx ,0x20
mov[es:174],bx
mov[es:174],ax
 
 pop di 
 pop dx 
 pop cx 
 pop bx 
 pop ax 
 pop es 
 pop bp 
 ret 


clrscr:
push es
push ax
push cx
push di

mov ax, 0xb800
mov es, ax

mov di, 0
mov ax, 0x3020

mov cx, 4000

cld
rep stosw





pop di
pop cx
pop ax
pop es
ret

strlen:
push bp
mov bp, sp

push ax
push di
push cx
push es

mov di, [bp + 4]
push ds
pop es

mov cx, 0xFFFF
mov al, 0
repne scasb

mov ax, 0xFFFF
sub ax, cx
dec ax

mov [bp + 4], ax

pop es
pop cx
pop di
pop ax
pop bp
ret

stringprinting:
push bp
mov bp, sp

push es
push di
push si
push ds
push ax
push bx
push cx

mov si, [bp + 4]
push si
call strlen
pop cx

mov ax, 0xb800
mov es, ax

mov ax, [bp + 6]
mov bx, 80 
mul bl

add ax, [bp + 8]
shl ax, 1

mov di, ax

mov ax, [bp + 10]
mov ah, al

print:
lodsb
stosw
loop print

pop cx
pop bx
pop ax
pop ds
pop si
pop di
pop es
pop bp
ret 8






movingstar:

push es
push ax 
push di
mov ax,0xb800
mov es,ax
mov di,0

mov di, 800

first:                                       
mov word[es:di],0x133d
add di,2
cmp di,960
jne first

mov di, 1760

first2:                                       
mov word[es:di],0x433d
add di,2
cmp di,1920
jne first2

mov di, 2720
first3:                                       
mov word[es:di],0x133d
add di,2
cmp di,2880
jne first3





; for vertical



mov di,40
toptobottomright:

mov word[es:di],0x0240
add di,160
cmp di,3880
jne toptobottomright

mov di,80
toptobottomright2:

mov word[es:di],0x0240
add di,160
cmp di,3920
jne toptobottomright2

mov di,120
toptobottomright3:

mov word[es:di],0x0240
add di,160
cmp di,3960
jne toptobottomright3






pop di
pop ax 
pop es
ret






; call the score incrementing subroutine if they match 
strcmp: push bp 
 mov bp,sp 
 push cx 
 push si 
 push di 
 push es 
 push ds 
 lds si, [bp+4]               ; point ds:si to first string 
 les di, [bp+8]               ; point es:di to second string 
 push ds                                   ; push segment of first string 
 push si                                                    ; push offset of first string 
 
 
                   
 repe cmpsb                          ; compare both strings 
 jcxz exitsimple                           ; are they successfully compared 
exitfalse: mov ax, 0
jmp exit                     ; store 0 to mark unequal 
exitsimple:
          

inc byte[score]

 call scoreincremeting ; call the score subroutine

exit:

pop ds 
 pop es 
 pop di 
 pop si 
 pop cx 
 pop bp 
 
 ret 8






 









start:
call clrscr

call movingstar

mov ax, 01001110b	; Color for score
push ax

mov ax, 1		; X - Coordinate
push ax

mov ax, 1		; Y - Coordinate
push ax

mov ax, string		; Message score
push ax

call stringprinting
 call scoreincremeting

mov ax, 11011111b	; Color for welcome to word search
push ax

mov ax, 28	; X - Coordinate
push ax

mov ax, 0		; Y - Coordinate
push ax

mov ax, msg		; Message   welcome to word search
push ax

call stringprinting


mov ax, 01001110b	; Color for prject by RABIA
push ax

mov ax, 28	; X - Coordinate
push ax

mov ax, 1		; Y - Coordinate
push ax

mov ax, MSGG		; Message   welcome to word search
push ax

call stringprinting









mov ax, 11011110b	; Color for enter a word
push ax

mov ax, 31 	; X - Coordinate
push ax

mov ax, 24		; Y - Coordinate
push ax

mov ax, msg2		; Message 2 enter a word
push ax

call stringprinting



mov ax, 11001110b ;color for stop message
push ax

mov ax, 4
push ax 

mov ax, 24
push ax

mov ax, string2          ; stop message
push ax

call stringprinting

mov ax, 11001110b ;color for new 
push ax

mov ax, 76
push ax

mov ax, 24
push ax

mov ax, string3
push ax

call stringprinting






; grid filling row 1


mov ax, 01011111b 
push ax

mov ax, 10
push ax

mov ax, 3
push ax

mov ax, a
push ax

call stringprinting




mov ax, 01011111b
push ax

mov ax, 25
push ax

mov ax, 3
push ax

mov ax, v
push ax

call stringprinting


mov ax, 01011111b 
push ax

mov ax, 45
push ax

mov ax, 3
push ax

mov ax, g
push ax

call stringprinting

mov ax, 01011111b 
push ax

mov ax, 65
push ax

mov ax, 3
push ax

mov ax, o
push ax

call stringprinting










; row 2 grid filling




mov ax, 01011111b 
push ax

mov ax, 10
push ax

mov ax, 8
push ax

mov ax, aa
push ax

call stringprinting




mov ax, 01011111b 
push ax

mov ax, 25
push ax

mov ax, 8
push ax

mov ax, l
push ax

call stringprinting


mov ax, 01011111b 
push ax

mov ax, 45
push ax

mov ax, 8
push ax

mov ax, i

push ax

call stringprinting

mov ax, 01011111b 
push ax

mov ax, 65
push ax

mov ax, 8
push ax

mov ax, m
push ax

call stringprinting









; row 3 grid filling




mov ax, 01011111b 
push ax

mov ax, 10
push ax

mov ax, 14
push ax

mov ax, a3
push ax

call stringprinting




mov ax, 01011111b 
push ax

mov ax, 25
push ax

mov ax, 14
push ax

mov ax, r
push ax

call stringprinting


mov ax, 01011111b
push ax

mov ax, 45
push ax

mov ax, 14
push ax

mov ax, w

push ax

call stringprinting

mov ax, 01011111b
push ax

mov ax, 65
push ax

mov ax, 14
push ax

mov ax, e
push ax

call stringprinting






; row 4 grid filling




mov ax, 01011111b 
push ax

mov ax, 10
push ax

mov ax, 20
push ax

mov ax, rr
push ax

call stringprinting




mov ax, 01011111b 
push ax

mov ax, 25
push ax

mov ax, 20
push ax

mov ax, a4
push ax

call stringprinting


mov ax, 01011111b 
push ax

mov ax, 45
push ax

mov ax, 20
push ax

mov ax, k

push ax

call stringprinting

mov ax, 01011111b 
push ax

mov ax, 65
push ax

mov ax, 20
push ax

mov ax, u
push ax

call stringprinting


;for input

again:

mov cx, 4
nextchar:
mov ah, 1
int 21h
  
mov byte[compare], al
loop nextchar



  ;for comrasion 




push ds                            ; push segment of first string 
 mov ax, compare 
 push ax                     ; push offset of first string 
 push ds                                ; push segment of second string 
 mov ax, row1 
 push ax                      ; push offset of second string 


 call strcmp 

 call scoreincremeting


 push ds ; push segment of first string 
 mov ax, compare 
 push ax ; push offset of first string 


 push ds ; push segment of third string 
 mov ax, row2 
 push ax ; push offset of third string 


 call strcmp 
 ;cmp ax, 0
 ;jne gameon

push ds ; push segment of first string 
 mov ax, compare 
 push ax ; push offset of first string 


 push ds ; push segment of third string 
 mov ax, row3 
 push ax ; push offset of third string 


 call strcmp 
cmp ax, 0
 jne gameon



push ds ; push segment of first string 
 mov ax, compare 
 push ax ; push offset of first string 


 push ds ; push segment of third string 
 mov ax, row4
 push ax ; push offset of third string 


 call strcmp 
 cmp ax, 0
 jne gameon


push ds ; push segment of first string 
 mov ax, compare 
 push ax ; push offset of first string 


 push ds ; push segment of third string 
 mov ax, col1 
 push ax ; push offset of third string 


 call strcmp 
cmp ax, 0
 jne gameon




push ds ; push segment of first string 
 mov ax, compare 
 push ax ; push offset of first string 


 push ds ; push segment of third string 
 mov ax, col2 
 push ax ; push offset of third string 


 call strcmp 

 cmp ax, 0
 jne gameon




push ds ; push segment of first string 
 mov ax, compare 
 push ax ; push offset of first string 


 push ds ; push segment of third string 
 mov ax, col3 
 push ax ; push offset of third string 


 call strcmp 
 cmp ax, 0
 jne gameon




push ds ; push segment of first string 
 mov ax, compare 
 push ax ; push offset of first string 


 push ds ; push segment of third string 
 mov ax, col4 
 push ax ; push offset of third string 


 call strcmp 
cmp ax, 0
 jne gameon

push ds ; push segment of first string 
 mov ax, compare 
 push ax ; push offset of first string 


 push ds ; push segment of third string 
 mov ax, diag1 
 push ax ; push offset of third string 


 call strcmp 
 cmp ax, 0
 jne gameon


push ds ; push segment of first string 
 mov ax, compare 
 push ax ; push offset of first string 


 push ds ; push segment of third string 
 mov ax, diag2 
 push ax ; push offset of third string 


 call strcmp 
cmp ax, 0
 jne gameon

gameon:
 sub byte[score],5
 jnz again


mov ax, 0x4c00
int 21h