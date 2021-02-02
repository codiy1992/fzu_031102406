DATA SEGMENT
       T0  EQU  280H    
       T1  EQU  281H
       T2  EQU  282H
       CTL1 EQU  283H
       PA  EQU  288H   
       PB  EQU  289H
       PC  EQU  28AH
       CTL EQU  28BH
       TABLE    DB        40H,79H,24H,30H,19H,12H,02H,78H
                DB        00H,10H,08H,03H,46H,21H,06H,0EH
       DAT      DB         ?
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:  MOV AX,DATA
        MOV DS,AX
        LEA DI,TABLE


     MOV DX,CTL1
     MOV AL,00100101B 
     OUT  DX,AL
     MOV  DX,T0
     MOV  AL,20H
     OUT  DX,AL

     MOV DX,CTL1
     MOV AL,01100111B  
     OUT  DX,AL
     MOV  DX,T1
     MOV  AL,10H
     OUT  DX,AL


        MOV DX,CTL 
    MOV AL,98H
    OUT DX,AL


        MOV CX,10
LOP:    MOV  BH,0
        MOV  BL,DAT

        CALL LED

        MOV DX,PC  
    IN AL,DX
    TEST AL,80H  
    JNZ LOP
         
        MOV DX,PA
        IN  AL,DX
        MOV DAT,AL

        SHR AL,1
        SHR AL,1
        SHR AL,1
        SHR AL,1
        CMP AL,0AH
        JC  S1
        ADD AL,7H
  S1:   ADD AL,30H
        MOV  DL,AL  
        MOV AH,02H
        INT 21H
        
        MOV AL,DAT
        AND AL,0FH
        CMP AL,0AH
        JC  S2
        ADD AL,7H
  S2:   ADD AL,30H
        MOV  DL,AL  
        MOV AH,02H  
        INT 21H
        MOV DL,' '  
        MOV AH,02H
        INT 21H
     
L2:     MOV  DX,PC 
        IN   AL,DX
        TEST AL,80H
        JZ  L2

        INC  CX
        LOOP LOP 
        MOV AH,4CH
        INT 21H

LED1          PROC    
              LEA       SI,TABLE
              ADD       SI,BX
              MOV       AL,[SI]
              OR        AL,80H  
              not al 
              MOV       DX,PB
              OUT       DX,AL
              RET
LED1          ENDP

LED           PROC
              PUSH      CX
              PUSH      BX

              MOV       Bl,dat
              mov bh,0
              AND       BL,0FH   
   
              MOV       DX,PC 
              MOV       AL,01h
              OUT       DX,AL
              CALL      LED1

              MOV       DX,PC  
              MOV       AL,00h
              OUT       DX,AL
              MOV       DX,PB 
              MOV       AL,00h
              OUT       DX,AL

              POP       BX
              PUSH      BX
              MOV       BH,0
              MOV       CL,4
              SHR       BL,CL
              AND       BL,0FH  

              MOV       DX,PC  
              MOV       AL,02h
              OUT       DX,AL 
              CALL      LED1 

              MOV       DX,PC  
              MOV       AL,00h
              OUT       DX,AL
              MOV       DX,PB  
              MOV       AL,00h
              OUT       DX,AL

              POP       BX
              POP       CX
              RET
LED           ENDP

CODE ENDS
     END  START
