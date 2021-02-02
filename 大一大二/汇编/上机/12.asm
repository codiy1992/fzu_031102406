data segment
  dat1 db 10101011b
  dat2 db 11110000b
  sum dw ?
data ends
code segment
  	assume cs:code,ds:data
start:  mov ax,data
  	mov ds,ax
	xor ah,ah
  	;mov bl,dat1
  	;mov al,dat2
  	;add al,bl
	;adc ah,0
  	;mov sum,ax
	mov al,dat1
	cbw
	mov bx,ax
	mov al,dat2
	cbw
	sub ax,bx
	mov sum,ax
  	mov ah,4ch
  	int 21h
code ends
end start