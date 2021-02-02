DATA SEGMENT
    T0 EQU 280H
    T1 EQU 281H
    T2 EQU 282H
    CTL53 EQU 283H
    PA EQU 288H
    PB EQU 289H
    PC EQU 28AH
    CTL55 EQU 28BH
       TABLE    DB        40H,79H,24H,30H,19H,12H,02H,78H
                DB        00H,10H,08H,03H,46H,21H,06H,0EH
       DAT      DB         ?
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
START:    MOV AX,DATA
    MOV DS,AX
    MOV DX,CTL53
    MOV AL,00100111B
    OUT DX,AL
    MOV DX,T0
    MOV AL,10H
    OUT DX,AL
    MOV DX,CTL53
    MOV AL,01100111B
    OUT DX,AL
    MOV DX,T1
    MOV AL,10H
    OUT DX,AL    ;8253产生一秒OUT1接PA7用于之后判断
    MOV DX,CTL55
    MOV AL,10010000B
    OUT DX,AL
    
L0: MOV DX,PA    ;等待第一次脉冲到来
    IN AL,DX
    TEST AL,80H
    JZ L0
    

    CALL CHOSE    ;比较开关值，选择分支
;PC6 红灯 PC5绿灯 PC4黄灯
NEXT0:    
    MOV BL,60H
    MOV DX,PC
    MOV AL,40H   ;置PC6且保持PC7不变
    OUT DX,AL   ;PC6为1时红灯亮
    MOV AH,40H
    CALL LOP
    
NEXT1:
    MOV BL,40H
    MOV DX,PC
    MOV AL,20H
    OUT DX,AL   ;PC5为1时绿灯亮
    MOV AH,20H
    CALL LOP

NEXT2:
    MOV BL,05H
    MOV DX,PC
    MOV AL,10H
    
    OUT DX,AL;PC4为1时黄灯亮
    MOV AH,10H
    
    CALL LOP
    CALL CHOSE
NEXT3: 
	MOV DAT,BL
    CALL LED
    MOV DX,PC
    MOV AL,00H
    OUT DX,AL
    MOV AH,4CH
    INT 21H

LOP PROC
L1: MOV DAT,BL
    CALL DELAY  
    CALL CMAP
    MOV BH,BL
    AND BH,0FH
    CMP BH,00H
    JNZ TT
    SUB BL,06H
TT: DEC BL
    JNZ L1
    RET
LOP ENDP

CHOSE PROC
    MOV DX,PA
    IN AL,DX     ;从PA读入K0和K1值
    AND AL,0FH
    CMP AL,00H
    JZ NEXT0
    CMP AL,01H
    JZ NEXT1
    CMP AL,02H
    JZ NEXT2
    CMP AL,03H
    JZ NEXT3
    RET
CHOSE ENDP

CMAP PROC
    MOV DX,PA
    IN AL,DX
    TEST AL,80H
    JZ EITCMAP
    CALL CHOSE
EITCMAP:RET
CMAP ENDP


DELAY PROC
L2: 
	CALL LED
    MOV DX,PA
    IN AL,DX
    TEST AL,40H
    JNZ L2
L3: 
	CALL LED 
   MOV DX,PA
    IN AL,DX
    TEST AL,40H
    JZ L3
    RET
DELAY ENDP 


LED1    PROC
    PUSH AX  
    PUSH BX
    MOV AL,BL
    LEA BX,TABLE
    XLAT
        MOV DX,PB
        NOT AL
        OUT DX,AL
        POP BX
        POP AX
        RET
LED1    ENDP

LED     PROC
        PUSH AX
        PUSH BX
        MOV BH,0
        MOV BL,DAT
        AND BL,0FH   ;低四位

        MOV DX,PC  ;选择低四位
        MOV AL,01H
        OUT DX,AL
      
        CALL LED1

        MOV DX,PC  ;息位码
        MOV AL,00H
        ADD AL,AH
        OUT DX,AL
        MOV DX,PB
        MOV AL,00H
       
        OUT DX,AL

	MOV BL,DAT
        MOV BH,0
        MOV CL,4
        SHR BL,CL
        AND BL,0FH   ;高四位

        MOV DX,PC   ;选择高四位
        MOV AL,02H
        ADD AL,AH
        OUT DX,AL
        CALL LED1 

        MOV DX,PC  ;息位码
        MOV AL,00H
        ADD AL,AH
        OUT DX,AL
        MOV DX,PB
        MOV AL,00H
        OUT DX,AL
        POP BX
        POP AX
    RET
LED     ENDP
CODE ENDS
    END START