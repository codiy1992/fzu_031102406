;该程序产生周期为1ms的连续方波，并在示波器上显示。
;我们的CLK0接2MHZ;
DSEG   SEGMENT
T0  EQU  280H    ;T0---CTL  为计数器0----控制寄存器的地址
T1  EQU  281H
T2  EQU  282H
CTL EQU  283H
DSEG   ENDS

CSEG  SEGMENT
      ASSUME  CS:CSEG,  DS:DSEG
START:
     MOV  AX,DSEG
     MOV  DS,AX
     MOV DX,CTL
     MOV AL,00110111B  ;选择通道0，先写入低字节，然后高字节，方式3，用BCD码

     OUT  DX,AL
     MOV  DX,T0
     MOV  AL,00H
     OUT  DX,AL
     MOV  AL,20H
     OUT  DX,AL

     MOV  AH,4CH
     INT 21H
CSEG  ENDS
      END   START
      
      