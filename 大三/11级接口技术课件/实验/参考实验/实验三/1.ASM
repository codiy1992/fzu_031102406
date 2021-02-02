;用反转法实现键盘操作
DSEG   SEGMENT
PA  EQU  288H   
PB  EQU  289H
PC  EQU  28AH
CTL EQU  28BH
TABLE DW 0FEFEH,0FEFDH,0FEFBH,0FEF7H,0FEEFH,0FEDFH
      DW  0FDFEH,0FDFDH,0FDFBH,0FDF7H,0FDEFH,0FDDFH
       DW   0FBFEH,0FBFDH,0FBFBH,0FBF7H,0FBEFH,0FBDFH
CHAR  DB '0','1','2','3','4','5'
      DB '6','7','8','9','A','B'
      DB 'C','D','E','F','G','P'
ROW   DB  ?
COLU  DB  ?
DSEG   ENDS

CSEG  SEGMENT
      ASSUME  CS:CSEG,DS:DSEG
START:
     MOV  AX,DSEG
     MOV  DS,AX
S:   MOV  DX,CTL 
     MOV  AL,10000010B
     OUT  DX,AL
L1:  MOV  DX,PA
     MOV  AL,00H
     OUT  DX,AL
     MOV  DX,PB
     IN   AL,DX
     OR  AL,11111000B
     CMP AL,0FFH
     JZ  L1
     CALL DELAY
     IN  AL,DX
     OR  AL,11111000B
     CMP  AL,0FFH
     JZ  L1
     MOV  COLU,AL
     MOV  DX,CTL
     MOV  AL,10010000B
     OUT  DX,AL
     
      MOV AL,COLU
     MOV  DX,PB
     OUT  DX,AL
     MOV  DX,PA
     IN   AL,DX
     OR   AL,0C0H
     MOV  AH,COLU
     MOV CX,18
     
     MOV  BX,OFFSET  TABLE
     MOV  SI,OFFSET  CHAR
L2:  CMP  AX,[BX]
     JZ   L3 
     ADD  BX,2
     INC SI
     LOOP L2
     JMP  S
L3: MOV  DL,[SI]
     CMP  DL,'P'
     JZ  EXIT
     MOV  AH,02H
     INT 21H
     MOV DX,CTL
     MOV  AL,10000010B
     OUT  DX,AL
     MOV  DX,PA
     MOV  AL,00H
     OUT  DX,AL
     MOV  DX,PB
L4:  IN   AL,DX
     OR AL,11111000B
     CMP AL,0FFH
     JNZ  L4
     JMP S
EXIT:MOV  AH,4CH
     INT 21H
DELAY  PROC
      PUSH  CX
      MOV CX,0FFFFH
 NEXT1:  NOP
        NOP
        NOP 
     LOOP NEXT1
      MOV CX,0FFFFH
 NEXT2:  NOP 
     LOOP NEXT2
      POP  CX
      RET 
DELAY ENDP
CSEG  ENDS
      END   START
      
      