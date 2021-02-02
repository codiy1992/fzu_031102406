data segment
	dat dw 2 dup (0ff22h),16 dup(45h)
	n equ ($-dat)/2 
	p dw n dup(?)
	m dw n dup(?)
data ends
code segment
	assume cs:code,ds:data
main proc near
	mov ax,data
	mov ds,ax
	mov si,0
	mov di,0
	mov bp,0
	mov cx,n
lp:	mov ax,dat[si]
	and ax,0ffh
	mov bl,2
	div bl
	cmp ah,0h
	jnz mmm
	mov bx,dat[si]
	mov p[bp],bx
	add bp,2
	jmp next
mmm:	mov bx,dat[si]
	mov m[di],bx
	add di,2
next:	add si,2
	loop lp
	mov  ax,bp
	call print
	mov  ax,di
	call print
	mov ah,4ch
	int 21h
main endp
print proc near
	mov  cl,2
	div  cl
	cmp  al,10h
	jl   copy
	mov  cl,4
	mov  ch,2
	mov  bl,al
lop:	rol  bl,cl
	mov  dl,bl
	and  dl,0fh
	add  dl,30h
	cmp  dl,3ah
	jl   pt
	add  dl,07h
pt:	mov ah,02h
	int 21h
	dec ch
	cmp ch,0
	jnz  lop
	jmp  tc
copy:	mov  dl,al
	add  dl,30h
	cmp  dl,3ah
	jl   prit
	add  dl,07h
prit:	mov ah,02h
	int 21h
tc:	mov dl,48h
	int 21h
	mov dl,20h
	int 21h
	ret
print endp
code ends
	end main