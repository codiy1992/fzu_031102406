;��8255����10MS��16�β������β�,��ߵ�-2.5��
DATA SEGMENT
T0  EQU  280H    ;T0---CTL  Ϊ������0----���ƼĴ����ĵ�ַ
       T1  EQU  281H
       T2  EQU  282H
       CTL1 EQU  283H
       PA  EQU  288H   
       PB  EQU  289H
       PC  EQU  28AH
       CTL EQU  28BH
       DA  EQU  290H
DATA ENDS
STACK1 SEGMENT PARA STACK
       DW 20H DUP(0)
STACK1 ENDS
COSEG SEGMENT
      ASSUME CS:COSEG,DS:DATA,SS:STACK1
START:MOV AX,DATA
      MOV DS,AX
      MOV AL,00H
;/*8253����10ms������

     MOV DX,CTL1
     MOV AL,00100101B  ;ѡ��ͨ��0��д����ֽڣ���ʽ2����BCD��
     OUT  DX,AL
     MOV  DX,T0
     MOV  AL,20H
     OUT  DX,AL
;���õڶ���
     MOV DX,CTL1
     MOV AL,01100111B  ;ѡ��ͨ��1��д����ֽڣ���ʽ3����BCD��
     OUT  DX,AL
     MOV  DX,T1
     MOV  AL,10H
     OUT  DX,AL


     
     MOV DX,CTL  ;8255��ʽ�ֿ���   ;10011000
     MOV AL,98H
     OUT DX,AL

DELAY11:MOV DX,PC   ;8255 C�� ����
     IN AL,DX
     TEST AL,80H   ;�ж�10mS����
     JNZ  DELAY11
DELAY12:IN AL,DX
     TEST AL,80H
     JZ   DELAY12
     
      MOV AL,00H
      MOV BL,00H
NEXT2:MOV DX,DA
      MOV AL,BL
      OUT DX,AL
      
      
DELAY21:MOV DX,PC   ;8255 C�� ����
     IN AL,DX
     TEST AL,80H   ;�ж�10mS����
     JNZ  DELAY21
DELAY22:IN AL,DX
     TEST AL,80H
     JZ   DELAY22
     
     MOV AL,BL
     CMP AL,80H
     JZ NEXT3
     ADD BL,08H
     JMP NEXT2       ;�������²���
NEXT3:
      PUSH CX
      MOV CX,10H
NEXT4: MOV  AL,BL
      OUT DX,AL
      
      
      
DELAY31:MOV DX,PC   ;8255 C�� ����
     IN AL,DX
     TEST AL,80H   ;�ж�10mS����
     JNZ  DELAY31
DELAY32:IN AL,DX
     TEST AL,80H
     JZ   DELAY32
     
     
     LOOP NEXT4    ;�����ϱ�
     POP CX
     
     MOV DX,DA
NEXT5:SUB BL,08H
      OUT DX,AL
 DELAY41:MOV DX,PC   ;8255 C�� ����
     IN AL,DX
     TEST AL,80H   ;�ж�10mS����
     JNZ  DELAY41
DELAY42:IN AL,DX
     TEST AL,80H
     JZ   DELAY42
     MOV AL,BL
     CMP AL,00H
     JZ  NEXT2
     JMP NEXT5    ;�������²���

      MOV AH,4CH
      INT 21H


COSEG ENDS
      END START