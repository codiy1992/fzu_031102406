data segment
	table db 11h,22h,33h,44h
	count equ $-table
	dat db 33h
	no  db ?
data ends
code segment
	assume cs:code,ds:data
start:  mov ax,data
	mov ds,ax
	mov cx,count
	mov si,0
	mov al,dat
lop:	mov ah,table[si]
	cmp ah,al
	jz  number
	add si,1
	loop lop
	mov no,0ffh
	jmp en
number: mov  no,si
	add no,1
en:	mov ah,4ch
	int 21h
code ends
	end start