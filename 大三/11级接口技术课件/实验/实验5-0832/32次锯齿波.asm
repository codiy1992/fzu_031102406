//延时法，32次产生锯齿波，最高点-5V
DATA SEGMENT
DATA ENDS
STACK1 SEGMENT PARA STACK
       DW 20H DUP(0)
STACK1 ENDS
COSEG SEGMENT
      ASSUME CS:COSEG,DS:DATA,SS:STACK1
START:MOV AX,DATA
      MOV DS,AX
      MOV CX,0FFFFH
NEXT1:MOV AL,00H

NEXT2:MOV DX,280H
      OUT DX,AL
      CALL DELAY
      CMP AL,80H
      JZ NEXT3
      ADD AL,08H
      JMP NEXT2

NEXT3:LOOP NEXT1
      MOV AH,4CH
      INT 21H

DELAY PROC NEAR
      PUSH CX
      MOV CX,200H
NEXT4:LOOP NEXT4
      POP CX
      RET
DELAY ENDP
COSEG ENDS
      END START