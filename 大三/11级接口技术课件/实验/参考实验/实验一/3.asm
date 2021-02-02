;该程序接收按键开关产生的信号进行计数，10次后结束，并使LED亮。
;我们的CLK接按键开关。
DSEG   SEGMENT
T0  EQU  280H    ;T0---CTL  为计数器0----控制寄存器的地址
T1  EQU  281H
T2  EQU  282H
CTL EQU  283H
DSEG   ENDS

CSEG  SEGMENT
      ASSUME  CS:CSEG,DS:DSEG
START:
     MOV  AX,DSEG
     MOV  DS,AX
     MOV DX,CTL
     MOV AL,00010001B  ;选择通道0，写入低字节，方式0，用BCD码

     OUT  DX,AL
     MOV  DX,T0
     MOV  AL,09H
     OUT  DX,AL

     MOV  AH,4CH
     INT 21H
CSEG  ENDS
      END   START