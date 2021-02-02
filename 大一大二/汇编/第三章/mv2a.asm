data segment
       org 1000h
       db  100 dup (0)
data ends

code segment
     assume  ds:data, cs:code

start:
                mov  ax, data
                mov  ds,ax
                MOV  DI,1000H 
                MOV  CX,64H 
                MOV  AL,2AH
AGAIN:  MOV  [DI],AL
                INC  DI
                DEC  CX
                JNZ AGAIN
                
                   mov ah,4ch
                   int 21h

code ends
          end start