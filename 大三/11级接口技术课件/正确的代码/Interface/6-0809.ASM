DATA SEGMENT
        TABLE    DB        40H,79H,24H,30H,19H,12H,02H,78H
                 DB        00H,10H,08H,03H,46H,21H,06H,0EH
        DAT      DB         ?
DATA ENDS
CODE SEGMENT
	ASSUME CS:CODE,DS:DATA
START:  MOV AX,DATA
	MOV DS,AX
	LEA DI,TABLE
	MOV AL,27H  ;8253方式字控制,产生1mS方波
	MOV DX,28BH
	OUT DX,AL
	MOV AL,10H
	MOV DX,288H 
	OUT DX,AL

	MOV AL,67H  ;8253方式字控制,产生1S方波
	MOV DX,28BH
	OUT DX,AL
	MOV AL,10H
	MOV DX,289H
	OUT DX,AL

	MOV DX,283H  ;8255方式字控制   ;10011000
	MOV AL,98H
	OUT DX,AL

LOP:	CALL LED
	MOV DX,282H   ;8255 C口 读入
	IN AL,DX
	TEST AL,40H   ;判断1S脉冲
	JNZ LOP
         
        MOV DX,290H   ;当为负脉冲时,驱动0809进行转换
        MOV AL,00H
        OUT DX,AL
L1:     MOV DX,282H  ;转换延时
        IN AL,DX
        TEST AL,40H
        JZ L1
        
        MOV DX,290H   ;转换结束,读数取结果
        IN AL,DX
        MOV DAT,AL
	CALL CRT
        JMP LOP 
	MOV AH,4CH
	INT 21H


CRT	PROC
	SHR AL,1
        SHR AL,1
        SHR AL,1
        SHR AL,1
        CMP AL,0AH
        JC  S1
        ADD AL,7H
S1:	ADD AL,30H
       
        MOV  DL,AL
        MOV AH,02H
        INT 21H
        
        MOV AL,DAT
        AND AL,0FH
        CMP AL,0AH
        JC  S2
        ADD AL,7H
S2:	ADD AL,30H
        MOV  DL,AL
        MOV AH,02H
        INT 21H
        MOV DL,' '
        INT 21H
CRT	ENDP


LED1    PROC  
	MOV AL,BL
	LEA BX,TABLE
	XLAT
        MOV DX,281H
        NOT AL
        OUT DX,AL
        RET
LED1    ENDP


LED     PROC
        MOV BH,0
        MOV BL,DAT
        AND BL,0FH   ;低四位

        MOV DX,282H  ;选择低四位
        MOV AL,01H
        OUT DX,AL
      
        CALL LED1

        MOV DX,282H  ;息位码
        MOV AL,00H
        OUT DX,AL
        MOV DX,281H
        MOV AL,00H
        OUT DX,AL

     
	MOV BL,DAT
        MOV BH,0
        MOV CL,4
        SHR BL,CL
        AND BL,0FH   ;高四位

        MOV DX,282H   ;选择高四位
        MOV AL,02H
        OUT DX,AL
        CALL LED1 

        MOV DX,282H  ;息位码
        MOV AL,00H
        OUT DX,AL
        MOV DX,281H
        MOV AL,00H
        OUT DX,AL
	RET
LED     ENDP
CODE ENDS
     END  START