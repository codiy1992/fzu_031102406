;��8255����10MS��16�β������β�,��ߵ�-2.5��
DATA SEGMENT
	T0  EQU  280H    ;T0---CTL  Ϊ������0----���ƼĴ����ĵ�ַ
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
;/*8253����10ms������
     MOV DX,CTL53
     MOV AL,00100101B  ;������T0��д����ֽڣ���ʽ2����BCD��
     OUT  DX,AL
     MOV  DX,T0
     MOV  AL,01H
     OUT  DX,AL
;���õڶ���
     MOV DX,CTL53
     MOV AL,01100101B  ;������T1��д����ֽڣ���ʽ2����BCD��
     OUT  DX,AL
     MOV  DX,T1
     MOV  AL,01H
     OUT  DX,AL
     
     MOV DX,CTL55  ;8255��ʽ�ֿ���   ;10011000
     MOV AL,98H
     OUT DX,AL
	CALL DELAY	;��һ�ο���û10ms
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
     JMP NEXT2       ;�������²���

NEXT3:PUSH CX
      MOV CX,10H
NEXT4: MOV  AL,BL
      OUT DX,AL
	CALL DELAY
     LOOP NEXT4    ;�����ϱ�
     POP CX
     MOV DX,DA
NEXT5:SUB AL,08H
       MOV  BL,AL
      OUT DX,AL
	CALL DELAY
     MOV AL,BL
     CMP AL,00H
     JZ  NEXT2
     JMP NEXT5    ;�������²���

DELAY	PROC
	PUSH AL
WAT1:	MOV DX,PC   ;8255 C�� ����
	IN AL,DX
	TEST AL,80H   ;�ж�10mS����
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