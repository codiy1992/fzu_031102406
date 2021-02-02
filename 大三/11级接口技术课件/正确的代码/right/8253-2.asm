
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
       MOV AL,00010001B
       OUT DX,AL
       
       MOV DX,T0
       MOV AL,09H
       OUT DX,AL
      
             
       MOV AH,4CH
       INT 21H
COSEG  ENDS
end start