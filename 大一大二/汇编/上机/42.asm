data segment
	dat db ?  
data ends
code segment
	assume cs:code,ds:data
main proc near
	mov ax,data
	mov ds,ax
xxx:	call scanf
	call crlf
	call print
	call crlf
	jmp xxx
	ret
main endp
scanf proc near
	mov si,0
new:	mov ah,01h
	int 21h
	cmp al,41h
	jl exit
	cmp al,5ah
	jng copy
	cmp al,61h
	jl exit
	cmp al,7ah
	jg exit
copy:	mov dat[si],al
	inc si
	jmp new
exit:	ret
scanf endp
print proc near
	mov bx,si
	mov si,0
lop:	mov bh,dat[si] 
	mov ch,2
	mov cl,4
next:	rol bh,cl
	mov dl,bh
	and dl,0fh
	add dl,30h
	cmp dl,3ah
	jl  prit
	add dl,7
prit:	mov ah,02h
	int 21h
	dec ch
	cmp ch,0h
	jnz next
	mov dl,20h
	mov ah,02h
	int 21h
	inc si
	dec bl
	cmp bl,0h
	jnz lop
	ret
print endp
crlf proc near
	push ax
	push dx
	mov  ah,02h
	mov  dl,0ah
	int  21h
	mov  dl,0dh
	int  21h
	pop dx
	pop ax
	ret
crlf endp
code ends
	end main
