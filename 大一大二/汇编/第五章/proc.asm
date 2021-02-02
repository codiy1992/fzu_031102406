code segment
   assume cs:code
Main proc far
Repeat: call decibin
        call crlf
        call binihex
        call crlf
        jmp  repeat
         ret
Main      endp 

decibin     proc   near
	     mov bx,0
newchar:	mov ah,1
		int 21h      
		sub al,30h
		cmp al,0
		jl   exit
		cmp al,09
		jg  exit
		cbw
		xchg  ax ,bx
		mov   cx,10d
		mul cx
		xchg  ax,bx 
		add   bx,ax	
		jmp newchar
Exit:		ret
decibin  endp

binihex     proc   near
           mov ch,4
 rotate: mov cl,4
            rol  bx, cl
            mov al,bl
            and al,0fh
            add  al,30h
            cmp al,3ah
             jl   printit
             add al ,7
 printit:     mov ah,02
             mov dl,al
	    int 21h
             dec ch                          
             jnz    rotate 
             ret
binihex  endp

Crlf   proc near
           mov  dl,0dh
           mov ah,02h
           int 21h
           mov dl,0ah
           int 21h
           ret
Crlf    endp
code ends
end main
