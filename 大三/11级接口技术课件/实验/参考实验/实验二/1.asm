;该程序是8255A口工作于方式0，输入。接8个开关,B口输出，方式0，接8个LED，PC7接单脉冲发生器，输入负脉冲时，读一次A口，存在TABLE单元中，同时在B口显示
;十次结束
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
     MOV AL,10011000B  ;A口工作于方式0，输入。B口输出，方式0，C上为输入
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
      
      