;�ó�����8255A�ڹ����ڷ�ʽ0�����롣��8������,B���������ʽ0����8��LED��PC7�ӵ����巢���������븺����ʱ����һ��A�ڣ�����TABLE��Ԫ�У�ͬʱ��B����ʾ
;ʮ�ν���
DSEG   SEGMENT
PA  EQU  288H   
PB  EQU  289H
PC  EQU  28AH
CTL EQU  28BH
TABLE  db  10 dup(?)
DSEG   ENDS

CSEG  SEGMENT
      ASSUME  CS:CSEG,DS:DSEG
START:
     MOV  AX,DSEG
     MOV  DS,AX
     MOV  CX,10
     MOV  SI,0
     MOV DX,CTL
     MOV AL,10011000B  ;A�ڹ����ڷ�ʽ0�����롣B���������ʽ0��C��Ϊ����
     OUT  DX,AL
WAT: MOV  DX,PC
     IN  AL,DX
     TEST AL,80H
     JNZ  WAT 
     
     MOV  DX,PA
     IN  AL,DX
     MOV  DX,PB
     OUT  DX,AL
   
     MOV  TABLE[SI],AL
     INC  SI
    
 WAT1:MOV DX,PC
     IN  AL,DX
     TEST AL,80H
     JZ  WAT1  
     LOOP  WAT
     
     MOV  AH,4CH
     INT 21H
CSEG  ENDS
      END   START
      
      