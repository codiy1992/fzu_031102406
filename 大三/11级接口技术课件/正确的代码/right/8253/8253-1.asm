;产生一个周期为1ms的连续方波，并在示波器上显示
DATA SEGMENT
T0  EQU   280H
T1  EQU   281H
T2  EQU   282H
CTL EQU   283H
DATA ENDS

STACK1 SEGMENT PARA STACK 
       DW 20H DUP(0)
STACK1 ENDS

COSEG SEGMENT
      ASSUME CS:COSEG,DS:DATA,SS:STACK1
START: MOV AX,DATA
       MOV DS,AX
       
       MOV DX,CTL
       MOV AL,00110111B
       OUT DX,AL
       
       MOV DX,T0
       MOV AL,00H
       OUT DX,AL
       MOV AL,10H
       OUT DX,AL
             
       MOV AH,4CH
       INT 21H
COSEG  ENDS
       END  START