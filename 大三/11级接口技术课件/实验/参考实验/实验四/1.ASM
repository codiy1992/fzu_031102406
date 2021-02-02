;A口工作在方式0，输入，接4个开关，B口工作在方式0，输出，接八段显示器，;PC7接单脉冲，输入负脉冲时，读一次A口，同时在B口显示，读10次结束。
DATA SEGMENT
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
        MOV DX,CTL  ;8255方式字控制   ;10011000
    MOV AL,98H
    OUT DX,AL
        MOV CX,10
L0:    
        MOV DX,PC
        IN  AL,DX
        TEST  AL,80H
        JNZ  L0
        MOV  DX,PA
        IN   AL,DX
        AND  AL,0FH
        MOV  BX,OFFSET  TABLE
        XLAT 
        MOV  DX,PB
        OUT  DX,AL
L1:     MOV  DX,PC
        IN   AL,DX
        TEST  AL,80H
        JNZ  L1
        LOOP  L0 

        MOV AH,4CH
        INT 21H
    
CODE ENDS
     END  START
