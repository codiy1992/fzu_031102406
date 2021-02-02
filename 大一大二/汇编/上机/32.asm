data segment
	tab  db 01h,10h,05h,60h,30h,11h
	n equ $-tab
	dab db n dup(?)
data ends
code segment
	assume cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
	mov bx,0
	mov cx,n
q:	mov al,tab[bx]
	mov dab[bx],al
	inc bx
	loop q
	mov cx,n
	dec cx
lop:	mov di,cx
	mov bx,0
lop1:	mov al,dab[bx]
	cmp al,dab[bx+1]
	jnb next
	xchg al,dab[bx+1]
	mov dab[bx],al
next:
	inc bx
	dec cx
	loop lop1
	mov cx,di
	dec cx
	loop lop
	mov ah,4ch
	int 21h
code ends 
	end start