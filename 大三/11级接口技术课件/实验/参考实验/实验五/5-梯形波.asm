;用延时法，16次产生梯形波,最高点-2.5伏
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
      MOV AL,00H
NEXT2:MOV DX,280H
      OUT DX,AL
      CALL DELAY
      CMP AL,80H
      JZ NEXT3
      ADD AL,08H
      JMP NEXT2
NEXT3:
      PUSH CX
      MOV CX,10H
NEXT4:OUT DX,AL
      CALL DELAY
      LOOP  NEXT4
      POP CX
NEXT5:SUB AL,08H
      OUT DX,AL
      CALL DELAY
      CMP AL,00H
      JZ  NEXT2
      JMP NEXT5

      MOV AH,4CH
      INT 21H

DELAY PROC NEAR
      PUSH CX
      MOV CX,200H
NEXT6:LOOP NEXT6
      POP CX
      RET
DELAY ENDP

COSEG ENDS
      END START