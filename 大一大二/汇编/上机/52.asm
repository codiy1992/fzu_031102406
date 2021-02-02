data segment
	a db ?
	b db ?
	c dw ?
data ends
code segment
	assume cs:code,ds:data
main proc near
	mov ax,data
	mov ds,ax
	call decibin
	call crlf
	mov a[0],bl
	call decibin
	call crlf
	mov b[0],bl
	add bl,a[0]
	adc bh,0
	mov c[0],bx
	mov ax,bx
	call binidec
	call crlf
	mov ah,4ch
	int 21h
main endp
decibin proc near
	mov bx,0
newchar: mov ah,1
        int 21h      
	sub al,30h
	cmp al,0
	jl  exit
	cmp al,09
	jg  exit
	cbw
	xchg ax ,bx
	mov cx,10d
	mul cx
	xchg ax,bx
	add  bx,ax	
	jmp newchar
exit:	ret
decibin  endp
binidec proc near
	push bx
	mov dh,0ah
	div dh
	mov bh,ah
	cmp al,0ah
	jl prit
	cbw
	call binidec
	jmp xxx
prit:   and al,0fh
        add al,30h
	mov ah,02h
        mov dl,al
	int 21h
xxx:	add bh,30h
	mov dl,bh
	mov ah,02h
	int 21h
	pop bx
	ret
binidec  endp
crlf proc near
	push ax
	push dx
	mov ah,02h
	mov dl,0ah
	int 21h
	mov dl,0dh
	int 21h
	pop dx
	pop ax
	ret
crlf endp
code ends
	end main