;用8255生成10MS，16次产生梯形波,最高点-2.5伏
DATA SEGMENT
T0  EQU  280H    ;T0---CTL  为计数器0----控制寄存器的地址
       T1  EQU  281H
       T2  EQU  282H
       CTL1 EQU  283H
       PA  EQU  288H   
       PB  EQU  289H
       PC  EQU  28AH
       CTL EQU  28BH
       DA  EQU  290H
DATA ENDS
STACK1 SEGMENT PARA STACK
       DW 20H DUP(0)
STACK1 ENDS
COSEG SEGMENT
      ASSUME CS:COSEG,DS:DATA,SS:STACK1
START:MOV AX,DATA
      MOV DS,AX
      MOV AL,00H
;/*8253产生10ms的脉冲

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


     
     MOV DX,CTL  ;8255方式字控制   ;10011000
     MOV AL,98H
     OUT DX,AL

DELAY11:MOV DX,PC   ;8255 C口 读入
     IN AL,DX
     TEST AL,80H   ;判断10mS脉冲
     JNZ  DELAY11
DELAY12:IN AL,DX
     TEST AL,80H
     JZ   DELAY12
     
      MOV AL,00H
      MOV BL,00H
NEXT2:MOV DX,DA
      MOV AL,BL
      OUT DX,AL
      
      
DELAY21:MOV DX,PC   ;8255 C口 读入
     IN AL,DX
     TEST AL,80H   ;判断10mS脉冲
     JNZ  DELAY21
DELAY22:IN AL,DX
     TEST AL,80H
     JZ   DELAY22
     
     MOV AL,BL
     CMP AL,80H
     JZ NEXT3
     ADD BL,08H
     JMP NEXT2       ;产生上坡波形
NEXT3:
      PUSH CX
      MOV CX,10H
NEXT4: MOV  AL,BL
      OUT DX,AL
      
      
      
DELAY31:MOV DX,PC   ;8255 C口 读入
     IN AL,DX
     TEST AL,80H   ;判断10mS脉冲
     JNZ  DELAY31
DELAY32:IN AL,DX
     TEST AL,80H
     JZ   DELAY32
     
     
     LOOP NEXT4    ;产生上边
     POP CX
     
     MOV DX,DA
NEXT5:SUB BL,08H
      OUT DX,AL
 DELAY41:MOV DX,PC   ;8255 C口 读入
     IN AL,DX
     TEST AL,80H   ;判断10mS脉冲
     JNZ  DELAY41
DELAY42:IN AL,DX
     TEST AL,80H
     JZ   DELAY42
     MOV AL,BL
     CMP AL,00H
     JZ  NEXT2
     JMP NEXT5    ;产生下坡波形

      MOV AH,4CH
      INT 21H


COSEG ENDS
      END START