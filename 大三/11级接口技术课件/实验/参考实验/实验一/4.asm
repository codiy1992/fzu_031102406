;该程序产生1S方波，并在LED上显示。
;我们的CLK0接2MHZ;用两级实现，因为N=2*10(6)>65536
;N=2000*1000
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
     MOV AL,00100101B  ;选择通道0，写入高字节，方式2，用BCD码
     OUT  DX,AL
     MOV  DX,T0
     MOV  AL,20H
     OUT  DX,AL
;设置第二级
     MOV DX,CTL
     MOV AL,01100111B  ;选择通道1，写入高字节，方式3，用BCD码
     OUT  DX,AL
     MOV  DX,T1
     MOV  AL,10H
     OUT  DX,AL
     
     MOV  AH,4CH
     INT 21H
CSEG  ENDS
      END   START