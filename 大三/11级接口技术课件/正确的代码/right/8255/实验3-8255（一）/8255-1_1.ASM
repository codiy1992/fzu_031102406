DATA    SEGMENT

PA      EQU  288H
PB      EQU  289H
PC      EQU  28AH
CTL55     EQU  28BH
TAB  DB 100  DUP(?)
DATA    ENDS

STACK1  SEGMENT PARA STACK
    DW 20H DUP(0)
STACK1  ENDS

COSEG   SEGMENT
        ASSUME CS:COSEG,DS:DATA
START:  MOV AX,DATA
    MOV DS,AX
        MOV CX,100
        MOV SI,0

        MOV DX,CTL55
        MOV AL,10011000B
        OUT DX,AL
    
WAT:    MOV DX,PC  
    IN AL,DX
    AND AL,80H   
    JNZ WAT     



DONE1:  MOV DX,PA  
    IN AL,DX
    MOV DX,PB 
    OUT DX,AL
    MOV TAB[SI],AL 
        INC SI

WAT1:  MOV DX,PC  
        IN AL,DX
    AND AL,80H   
    JZ WAT1   

        LOOP WAT  
        MOV AH,4CH
    INT 21H


COSEG   ENDS
    END START


