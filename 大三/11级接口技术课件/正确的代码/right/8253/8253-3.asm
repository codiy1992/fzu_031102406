
DATA SEGMENT
T0  EQU   298H
T1  EQU   299H
T2  EQU   29aH
CTL EQU   29bH
DATA ENDS
STACK1 SEGMENT PARA STACK 
       DW 20H DUP(0)

STACK1 ENDS

COSEG SEGMENT
      ASSUME CS:COSEG,DS:DATA
START: MOV AX,DATA
       MOV DS,AX
       
       MOV DX,CTL
       MOV AL,00100101B
       OUT DX,AL
       
       MOV DX,T0
       MOV AL,10H
       OUT DX,AL

       MOV DX,CTL
       MOV AL,01100111B
       OUT DX,AL
       
       MOV DX,T1
       MOV AL,01H
       OUT DX,AL
      COSEG  ENDS
       END  START
