;用8255生成10MS，16次产生梯形波,最高点-2.5伏
DATA SEGMENT
	T0  EQU  280H    ;T0---CTL  为计数器0----控制寄存器的地址
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
;/*8253产生10ms的脉冲
     MOV DX,CTL53
     MOV AL,00100101B  ;计数器T0，写入高字节，方式2，用BCD码
     OUT  DX,AL
     MOV  DX,T0
     MOV  AL,01H
     OUT  DX,AL
;设置第二级
     MOV DX,CTL53
     MOV AL,01100101B  ;计数器T1，写入高字节，方式2，用BCD码
     OUT  DX,AL
     MOV  DX,T1
     MOV  AL,01H
     OUT  DX,AL
     
     MOV DX,CTL55  ;8255方式字控制   ;10011000
     MOV AL,98H
     OUT DX,AL

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
     JMP NEXT2       ;产生上坡波形

NEXT3:PUSH CX
      MOV CX,10H
NEXT4: MOV  AL,BL
      OUT DX,AL
	CALL DELAY
     LOOP NEXT4    ;产生上边
     POP CX
     MOV DX,DA
NEXT5:SUB AL,08H
       MOV  BL,AL
      OUT DX,AL
	CALL DELAY
     MOV AL,BL
     CMP AL,00H
     JZ  NEXT2
     JMP NEXT5    ;产生下坡波形

DELAY	PROC
	PUSH AL
WAT1:	MOV DX,PC   ;8255 C口 读入
	IN AL,DX
	TEST AL,80H   ;判断10mS脉冲
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