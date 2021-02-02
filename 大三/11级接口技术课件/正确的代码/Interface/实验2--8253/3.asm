该程序产生1s方波，并在LED上显示
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
       MOV AL,00100101B
       OUT DX,AL
       
       MOV DX,T0
       MOV AL,10H
       OUT DX,AL

       MOV DX,CTL
       MOV AL,01100111B
       OUT DX,AL
      
       MOV DX,T1
       MOV AL,10H
       OUT DX,AL
             
       MOV AH,4CH
       INT 21H
COSEG  ENDS