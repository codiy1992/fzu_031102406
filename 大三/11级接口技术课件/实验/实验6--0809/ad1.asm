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
        MOV AL,27H  ;8253��ʽ�ֿ���,����1mS����
     	MOV DX,28BH
    	OUT DX,AL
     	MOV AL,10H
     	MOV DX,288H 
    	OUT DX,AL
  
    	MOV AL,67H  ;8253��ʽ�ֿ���,����1S����
    	MOV DX,28BH
    	OUT DX,AL
    	MOV AL,10H
    	MOV DX,289H
    	OUT DX,AL

        MOV DX,283H  ;8255��ʽ�ֿ���   ;10011000
	MOV AL,98H
	OUT DX,AL

L0:     MOV  AH,01H    ;konggejian
        INT 21H
        CMP  AL,20H
        JNE L0
        cmp al,"s"
        je  exit
        MOV CX,100h
LOP:	MOV  BH,0
        MOV  BL,DAT
        CALL LED
        MOV DX,282H   ;8255 C�� ����
	IN AL,DX
	TEST AL,40H   ;�ж�1S����
	JNZ LOP
         
        MOV DX,290H   ;��Ϊ������ʱ,����0809����ת��
        MOV AL,00H
        OUT DX,AL
L1:     MOV DX,282H  ;ת����ʱ
        IN AL,DX
        TEST  AL,80H
        JZ  L1
        
        MOV DX,290H   ;ת������,����ȡ���
        IN AL,DX
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
        INT 21H
        MOV DL,' '
        INT 21H 
        ;CALL CRT   ;��ʾ����Ļ��
        ;CALL TABLE  ;�����ڴ浥Ԫ
        
L2:     MOV  DX,282H 
        IN   AL,DX
        TEST AL,40H
        JZ  L2
        ;inc cx
        LOOP LOP 
     exit: MOV AH,4CH
         INT 21H

LED1          PROC  
              LEA       SI,TABLE
              ADD       SI,BX
              MOV       AL,[SI]
              OR        AL,80H    ;ZHI AL ZUIGAOWEI WEI 1 ,JI BU XIANSHI XIAOSHUDIAN
              MOV       DX,281H
              OUT       DX,AL
              RET
LED1          ENDP

LED           PROC
              push      cx
              PUSH      BX

              MOV       BH,0
              AND       BL,0FH   ;disiwei
   
              MOV       DX,282H  ;xuanzedisiwei
              MOV       AL,0FEH
              OUT       DX,AL
              CALL      LED1

              MOV       DX,282H  ;xiweima
              MOV       AL,0FFH
              OUT       DX,AL
              MOV       DX,281H
              MOV       AL,0FFH
              OUT       DX,AL

              POP       BX
              PUSH      BX
              MOV       BH,0
              MOV       CL,4
              SHR       BL,CL
              AND       BL,0FH   ;gaosiwei

              MOV       DX,282H   ;xuanzegaosiwei
              MOV       AL,0FDH
              OUT       DX,AL
              CALL      LED1 

              MOV       DX,282H  ;xiweima
              MOV       AL,0FFH
              OUT       DX,AL
              MOV       DX,281H
              MOV       AL,0FFH
              OUT       DX,AL

              POP       BX
              pop       cx
              RET
LED           ENDP
;CRT   PROC
  ;    PUSH AX
  ;    AND AL,0F0H
   ;   push cx
    ;  mov  cl,4
    ;  SHR AL,cl
    ;  pop  cx
     ; ADD AL,30H
     ; MOV DL,AL
     ; MOV AH,02H
      ;INT 21H
     ; POP AX
     ; PUSH AX
     ; AND AL,0FH
     ; ADD AL,30H
     ; MOV DL,AL
     ; MOV AH,02H
     ; INT 21H
     ; POP AX
;CRT   ENDP  
;TABLE PROC
  ;    MOV [DI],AL
  ;    INC DI 
;TABLE ENDP 
      
CODE ENDS
     END  START
