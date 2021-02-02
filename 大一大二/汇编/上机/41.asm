data segment
	buf dw 0ac45h
	mas db 4 dup(?)
data ends
code segment
	assume cs:code,ds:data
main proc near
start:  mov ax,data
	mov ds,ax
	call decibin
	 mov ah,4ch
	int 21h
main endp
decibin proc near
	mov si,0
	mov ch,4h
lop:	mov cl,4h
	mov ax,buf[0]
	rol ax,cl
	mov buf[0],ax
	and ax,0fh
	cmp al,0ah
	jl  xxx
	add al,7h
xxx:	add al,30h
	mov mas[si],al
	call print
	inc si
	dec ch
	cmp ch,0h
	jg lop
	ret
decibin endp
print proc near  
	push cx
	mov bl,al
	mov ch,2
rotate: mov cl,4h
	rol bl,cl
	mov al,bl
	and al,0fh
	add al,30h
	mov dl,al
	mov ah,2
	int 21h
	dec ch
	jnz rotate
	mov DL,0ah 
	int 21h 
        mov dl,0dh
        int 21h
	pop cx
	ret
print endp
code ends
	end start