;该程序是8255A口工作于方式0，输入。接8个开关,B口输出，方式0，接LED，PC0由8253产生1s脉冲，每来一个脉冲读一次A口，存在TABLE单元中，同时在B口显示
;十次结束
DSEG   SEGMENT
T0  EQU  280H    ;T0---CTL  为计数器0----控制寄存器的地址
T1  EQU  281H
T2  EQU  282H
CTL1 EQU  283H
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
     MOV  CX,100
     MOV  SI,0

;/*8253产生1S的连续方波
     MOV DX,CTL1
     MOV AL,00100101B  ;选择通道0，写入高字节，方式2，用BCD码
     OUT  DX,AL
     MOV  DX,T0
     MOV  AL,20H
     OUT  DX,AL
;设置第二级
     MOV DX,CTL1
     MOV AL,01100111B  ;选择通道1，写入高字节，方式3，用BCD码
     OUT  DX,AL
     MOV  DX,T1
     MOV  AL,10H
     OUT  DX,AL
;8253产生1S的连续方波*/

;以下是8255开始工作
     MOV DX,CTL
     MOV AL,10010001B  ;A口工作于方式0，输入。B口输出，方式0，C下为输入
     OUT  DX,AL
WAT: MOV  DX,PC
     IN  AL,DX
     TEST AL,01H
     JNZ  WAT 
     
     MOV  DX,PA
     IN  AL,DX
     MOV  DX,PB
     OUT  DX,AL
   
     MOV  TABLE[SI],AL
     INC  SI
    
 WAT1:MOV DX,PC
     IN  AL,DX
     TEST AL,01H
     JZ  WAT1  
     LOOP  WAT
     
     MOV  AH,4CH
     INT 21H
CSEG  ENDS
      END   START
      
      