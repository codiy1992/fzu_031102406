code segment
    assume cs:code
start:
               mov        bx,1234h
               mov        CH,4	;��ʾ��������
rotate:	mov	CL,4
	rol	Bx,CL
	mov	Ax,Bx
	and	Ax,0FH
	add	AL,30H
	cmp	AL,3AH
	jl	printit
	add	AL,7H
printit:
	mov	DL,AL
	mov	AH,2
	int	21h
	dec	ch
	jnz	rotate

	mov	DL,10	;�����Ȼ��10���Ƶ�
	int	21h	
      mov         dl,0dh
      int            21h
      mov         ah,4ch
      int           21h
code ends
     end start