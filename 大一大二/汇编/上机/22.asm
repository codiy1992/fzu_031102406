data segment 
	dat dw 0f4h,33h,88h,888h,0,111h 
	count equ $-dat 
	max dw ? 
	min dw ? 
data ends 
code segment
 	assume cs:code,ds:data 
start: 	mov ax, data 
	mov ds,	ax 
	xor ax,	ax 
	xor bx, bx 
	xor cx, cx 
	xor dx,	dx 
	mov cx, count/2 
	dec cx 
	mov si, 0 
lop:	mov ax,dat[si] 
	cmp ax,dat[si+2] 
	js fs 
	mov max,ax 
	add si,2 
	loop lop 
fs:	mov min,ax 
	add si,2
	loop lop 
	mov bx,max 
	mov dx,min 
	mov ah,4ch 
	int 21h 
code ends 
	end start