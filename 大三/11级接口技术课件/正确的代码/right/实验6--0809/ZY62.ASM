DATA SEGMENT
TABLE_LED DB 3FH,06H,5BH,4FH,66H,6DH,7DH,07H
          DB 7FH,6FH,77H,7CH,58H,5CH,79H,71H
          DB 80H
TABLE_CRT DB 30H,31H,32H,33H,34H,35H,36H,37H
          DB 38H,39H,41H,42H,43H,44H,45H,46H
TABLE_KONG DW 0,290H,291H,292H,293H,294H,295H,296H,297H
NUM1 DB 10H
NUM2 DW 1010H
TABLE_CUN DB 240 DUP(0)
DATA ENDS
STACK1 SEGMENT PARA STACK
       DW 40H DUP(0)
STACK1 ENDS
COSEG SEGMENT
      ASSUME CS:COSEG,DS:DATA,SS:STACK1
START:MOV AX,DATA
      MOV DS,AX
       MOV DX,28BH  ;8253¿ØÖÆ×Ö
       MOV AL,00100101B
       OUT DX,AL
       MOV DX,288H
       MOV AL,10H
       OUT DX,AL
       MOV DX,28BH
       MOV AL,01100111B
       OUT DX,AL
       MOV DX,289H
       MOV AL,10H
       OUT DX,AL
      MOV AL,10001001B;¿ØÖÆ×ÖA³ö£¬B³ö£¬C¸ßÈë£¬CµÍÈë
      MOV DX,283H
      OUT DX,AL
NEXT: MOV AH,01H
      INT 21H
      CMP AL,20H
      JNZ NEXT
      MOV CX,11
      MOV SI,0
NEXT1:MOV DI,0
     
DUAN: CALL LED ;8¶ÎÏÔÊ¾
      MOV DX,282H;¶ÁC¿Ú
      IN AL,DX
      AND AL,01H ;PC0=0£¿
      JZ DUAN  ;PC0=0
      
      INC DI
      CMP DI,9
      JZ  NEXT_EN
      
  
      
      PUSH DI
      SHL DI,1
      MOV DX,TABLE_KONG[DI]
      POP DI
      OUT DX,AL
      CALL DELAY
      IN AL,DX
      MOV AH,AL;¸ßÎ»AHµÍÎ»ALÖÐ
      PUSH CX
      MOV CL,4;¶Á¸ß4Î»AHÖÐ
      SHR AH,CL;¶Á¸ß4Î»AHÖÐ
      POP CX
      AND AL,0FH;µÍÎ»ALÖÐ
      MOV NUM2,AX
      MOV AX,DI
      MOV NUM1,AL
      CALL CRT ;CRTÏÔÊ¾
      CALL BAOCUN
      
NEXT2:MOV DX,282H ;¶ÁC¿Ú
      IN AL,DX
      AND AL,01H
      JNZ NEXT2  ;PC0=1
      JMP DUAN  
NEXT_EN: DEC CX
         CMP CX,0
         JZ NEXT_END  ;CX=0£¿
         JMP NEXT1
NEXT_END:MOV AH,4CH
         INT 21H


DELAY PROC NEAR
      PUSH DX
NEXT3:MOV DX,282H;¶ÁC¿Ú
      IN AL,DX
      AND AL,80H ;PC7=0£¿
      JZ NEXT3  ;PC7=0
      POP DX
      RET
DELAY ENDP 
      
LED   PROC NEAR
      MOV AX,NUM2
      LEA BX,TABLE_LED;È¡µÍÎ»
      XLAT TABLE_LED
      NOT AL
      MOV DX,280H
      OUT DX,AL
      MOV AL,0EFH;ËÍPC4=0
      MOV DX,281H;ËÍ8¶ÎÏÔÊ¾
      OUT DX,AL

      MOV DX,280H
      MOV AL,0FFH
      OUT DX,AL
      MOV DX,281H
      MOV AL,0FFH
      OUT DX,AL

      MOV AX,NUM2
      MOV AL,AH
      XLAT TABLE_LED;È¡¸ßÎ»
      NOT AL
      MOV DX,280H
      OUT DX,AL
      MOV AL,0DFH;ËÍPC5=0
      MOV DX,281H
      OUT DX,AL

      MOV DX,280H
      MOV AL,0FFH
      OUT DX,AL
      MOV DX,281H
      MOV AL,0FFH
      OUT DX,AL

      MOV AL,NUM1
      LEA BX,TABLE_LED;È¡DI
      XLAT TABLE_LED
      NOT AL
      MOV DX,280H
      OUT DX,AL
      MOV AL,0BFH;ËÍPC4=0
      MOV DX,281H;ËÍ8¶ÎÏÔÊ¾
      OUT DX,AL

      MOV DX,280H
      MOV AL,0FFH
      OUT DX,AL
      MOV DX,281H
      MOV AL,0FFH
      OUT DX,AL
      RET
LED   ENDP

CRT   PROC NEAR
      MOV AL,NUM1
      LEA BX,TABLE_CRT
      XLAT TABLE_CRT;È¡µÍÎ»
      MOV DL,AL
      MOV AH,02H
      INT 21H
      MOV DL,' '
      MOV AH,02H
      INT 21H

      MOV AX,NUM2
      MOV AL,AH
      LEA BX,TABLE_CRT;È¡¸ßÎ»
      XLAT TABLE_CRT
      MOV DL,AL
      MOV AH,02H
      INT 21H
      MOV AX,NUM2
      XLAT TABLE_CRT;È¡µÍÎ»
      MOV DL,AL
      MOV AH,02H
      INT 21H
      MOV DL,' '
      MOV AH,02H
      INT 21H
      MOV DL,' '
      MOV AH,02H
      INT 21H
      RET 
CRT ENDP

BAOCUN PROC NEAR
       MOV AL,NUM1
       MOV TABLE_CUN[SI],AL
       INC SI
       MOV AX,NUM2
       MOV TABLE_CUN[SI],AH
       INC SI
       MOV TABLE_CUN[SI],AL
       INC SI
       RET
BAOCUN ENDP

COSEG ENDS
      END START