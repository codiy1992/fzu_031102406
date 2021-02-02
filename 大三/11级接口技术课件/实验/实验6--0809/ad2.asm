DATA SEGMENT
        TABLE    DB        40H,79H,24H,30H,19H,12H,02H,78H
                 DB        00H,10H,08H,03H,46H,21H,06H,0EH
        DAT      DB         ?
        ROUTE    DB        00H,01H,02H,03H,04H,05H,06H,07H
        COUNT    DB        0
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:  MOV AX,DATA
        MOV DS,AX
        MOV AL,27H  ;8253·½Ê½×Ö¿ØÖÆ,²úÉú1mS·½²¨
     	MOV DX,28BH
    	OUT DX,AL
     	MOV AL,10H
     	MOV DX,288H 
    	OUT DX,AL
  
    	MOV AL,67H  ;8253·½Ê½×Ö¿ØÖÆ,²úÉú1S·½²¨
    	MOV DX,28BH
    	OUT DX,AL
    	MOV AL,10H
    	MOV DX,289H
    	OUT DX,AL

        MOV DX,283H  ;8255·½Ê½×Ö¿ØÖÆ   ;10011000
	MOV AL,98H
	OUT DX,AL

L0:     MOV  AH,01H    ;konggejian
        INT 21H
        CMP  AL,20H
        JNE L0
        
        MOV CX,100H
        LEA DI,ROUTE

LOP:	MOV  BH,0
        MOV  BL,DAT
        CALL LED
        MOV DX,282H   ;8255 C¿Ú ¶ÁÈë
	IN AL,DX
	TEST AL,40H   ;ÅÐ¶Ï1SÂö³å
	JNZ LOP
        
        MOV DX,290H   ;µ±Îª¸ºÂö³åÊ±,Çý¶¯0809½øÐÐ×ª»»
        ADD DL,[DI]
        MOV AL,00H
        OUT DX,AL
L1:     MOV DX,282H  ;×ª»»ÑÓÊ±
        IN AL,DX
        TEST  AL,80H
        JZ  L1        
        INC [COUNT]
      
        MOV DX,290H   ;×ª»»½áÊø,¶ÁÊýÈ¡½á¹û
        ADD DL,[DI]
        IN AL,DX
        MOV DAT,AL
        MOV DL,[DI]
        ADD DL,30H
        MOV AH,02H
        INT 21H
        PUSH CX
        MOV AL,DAT
        MOV CH,2
        MOV CL,4
        ROR AL,CL
    S0: AND AL,0FH
        CMP AL,0AH
        JL  S1
        ADD AL,7H
  S1:   ADD AL,30H       
        MOV  DL,AL
        MOV AH,02H
        INT 21H         
        MOV AL,DAT
        DEC CH
        JNZ S0
        POP CX
        MOV DL,' '
        INT 21H
        MOV DL,' '
        INT 21H 
        ;CALL TABLE  ;´æÈëÄÚ´æµ¥
        
L2:     MOV  DX,282H 
        IN   AL,DX
        TEST AL,40H
        JZ  L2
        INC DI
        CMP COUNT,8
        JL  L3
        MOV COUNT,0
        MOV DI,OFFSET ROUTE
 L3:    LOOP LOP 

         MOV AH,4CH
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