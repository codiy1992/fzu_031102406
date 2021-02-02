;ÓÃ8255Éú³É10MS£¬16´Î²úÉúÌÝÐÎ²¨,×î¸ßµã-2.5·ü
DATA SEGMENT
	T0  EQU  280H    ;T0---CTL  Îª¼ÆÊýÆ÷0----¿ØÖÆ¼Ä´æÆ÷µÄµØÖ·
       T1  EQU  281H
       T2  EQU  282H
       CTL53 EQU  283H
       PA  EQU  288H   
       PB  EQU  289H
       PC  EQU  28AH
       CTL55 EQU  28BH
       DA  EQU  290H
DATA ENDS

COSEG SEGMENT
      ASSUME CS:COSEG,DS:DATA
START:MOV AX,DATA
      MOV DS,AX
      MOV AL,00H
;/*8253²úÉú10msµÄÂö³å
     MOV DX,CTL53
     MOV AL,00100101B  ;¼ÆÊýÆ÷T0£¬Ð´Èë¸ß×Ö½Ú£¬·½Ê½2£¬ÓÃBCDÂë
     OUT  DX,AL
     MOV  DX,T0
     MOV  AL,01H
     OUT  DX,AL
;ÉèÖÃµÚ¶þ¼¶
     MOV DX,CTL53
     MOV AL,01100101B  ;¼ÆÊýÆ÷T1£¬Ð´Èë¸ß×Ö½Ú£¬·½Ê½2£¬ÓÃBCDÂë
     OUT  DX,AL
     MOV  DX,T1
     MOV  AL,01H
     OUT  DX,AL
     
     MOV DX,CTL55  ;8255·½Ê½×Ö¿ØÖÆ   ;10011000
     MOV AL,98H
     OUT DX,AL
	CALL DELAY	;µÚÒ»´Î¿ÉÄÜÃ»10ms
      MOV AL,00H
			MOV BL,00H
NEXT2:MOV DX,DA
			MOV AL,BL
      OUT DX,AL

	CALL DELAY

     CMP AL,80H
     JZ NEXT3
     ADD AL,08H
			MOV BL,AL
     JMP NEXT2       ;²úÉúÉÏÆÂ²¨ÐÎ

NEXT3:PUSH CX
      MOV CX,10H
NEXT4: MOV  AL,BL
      OUT DX,AL
	CALL DELAY
     LOOP NEXT4    ;²úÉúÉÏ±ß
     POP CX
     MOV DX,DA
NEXT5:SUB AL,08H
       MOV  BL,AL
      OUT DX,AL
	CALL DELAY
     MOV AL,BL
     CMP AL,00H
     JZ  NEXT2
     JMP NEXT5    ;²úÉúÏÂÆÂ²¨ÐÎ

DELAY	PROC
	PUSH AL
WAT1:	MOV DX,PC   ;8255 C¿Ú ¶ÁÈë
	IN AL,DX
	TEST AL,80H   ;ÅÐ¶Ï10mSÂö³å
	JNZ  WAT1
WAT2:	IN AL,DX
	TEST AL,80H
	JZ   WAT2
	POP AL
DELAY	ENDP
      
      MOV AH,4CH
      INT 21H
COSEG ENDS
      END START