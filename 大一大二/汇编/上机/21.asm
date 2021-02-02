data segment
	dat db 0f2h,13h,77h,82h,99h
	COUNT	EQU	$-dat
	T0 db 0
	T1 db 0
data ends

code segment
	assume cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
	XOR CX,CX
	XOR DX,DX
	mov cx,count
	mov si,0
LOP:	test byte ptr dat[si],80h
	jns zs
	inc dl
	inc si
	loop lop
	jmp en
zs:	inc dh
	inc si
	loop lop
en:	mov t0,dl
	mov t1,dh
	MOV AH,4CH
	INT 21H
code ends
end start