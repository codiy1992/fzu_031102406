;用扫描法实现键盘操作
DSEG   SEGMENT
PA  EQU  288H   
PB  EQU  289H
PC  EQU  28AH
CTL EQU  28BH
TABLE DW 0FEFEH,0FEFDH,0FEFBH,0FEF7H,0FEEFH,0FEDFH
      DW  0FDFEH,0FDFDH,0FDFBH,0FDF7H,0FDEFH,0FDDFH
      DW  0FBFEH,0FBFDH,0FBFBH,0FBF7H,0FBEFH,0FBDFH
CHAR  DB '0','1','2','3','4','5'
      DB '6','7','8','9','A','B'
      DB 'C','D','E','F','G','P'
CROW  DB  0FEH,0FDH,0FBH,0F7H,0EFH,0DFH
COLU  DB  ?++
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
     MOV  CX,06H
     MOV  BX,OFFSET CROW
L2:  MOV  DX,PA
     INC  BX
     MOV  AL,[BX-1]
     OUT  DX,AL
     MOV  DX,PB
     IN   AL,DX
     OR  AL,11111000B
     CMP  AL,0FFH
     JNZ  KEY
     LOOP L2
     JMP  L1
KEY: MOV COLU,AL
     MOV AH,COLU
     MOV AL,[BX]
     MOV  BX,OFFSET  TABLE
     MOV  SI,OFFSET  CHAR
L3:  CMP  AX,[BX]
     JZ   L4
     ADD  BX,2
     INC SI
     JMP  L3
L4:  MOV  DL,[SI]
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
L5:  IN   AL,DX
     OR AL,11111000B
     CMP AL,0FFH
     JNZ  L5
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
      
      