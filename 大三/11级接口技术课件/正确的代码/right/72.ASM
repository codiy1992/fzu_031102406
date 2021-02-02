;2、    利用0809采集一路模拟信号，按一次单脉冲，开始采集，并判断转化后数据，若值大于90，输出三角波，否则输出锯齿波。

DATA SEGMENT
       PA  EQU  288H   
       PB  EQU  289H
       PC  EQU  28AH
       CTL EQU  28BH
       DAT      DB         ?
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:  MOV AX,DATA
        MOV DS,AX

        
        MOV DX,CTL  ;8255方式字控制   ;10011000
    MOV AL,98H
    OUT DX,AL


LOP:        MOV DX,PC   ;8255 C口 读入
        IN AL,DX
        TEST AL,80H   
        JNZ LOP
         
T1:        MOV DX,298H   ;0809分配的地址，当为负脉冲时,驱动0809进行转换
        MOV AL,00H
        OUT DX,AL

L1:     MOV DX,PC  ;转换延时
        IN AL,DX
        TEST  AL,80H
        JZ  L1
        
        MOV DX,298H   ;转换结束,读数取结果
        IN AL,DX
        MOV DX,PB
        OUT DX,AL
        CMP AL,5AH
        JA    S1;   大于输出三角波，小于输出锯齿波
 NEXT1:  MOV AL,00H;  锯齿波
NEXT4:   MOV DX,290H   ;0832分配的地址
         OUT DX,AL
        CALL DELAY
        CMP AL,0F0H
        JZ NEXT3
        ADD AL,10H
        JMP NEXT4
NEXT3:  MOV DX,PC   ;8255 C口 读入
        IN AL,DX
        TEST AL,80H   
        JNZ NEXT1
        JMP T1
      MOV AH,4CH  
      INT 21H

S1 :  MOV AL,00H;三角波
NEXT6:MOV DX,290H
      OUT DX,AL
      CALL DELAY
      CMP AL,0F0H
      JZ NEXT5
      ADD AL,10H
      JMP NEXT6
NEXT5:SUB AL,10H
      OUT DX,AL
      CALL DELAY
      CMP AL,00H
      JNZ NEXT5

        MOV DX,PC   ;8255 C口 读入
        IN AL,DX
        TEST AL,80H   
        JZ T1
        MOV AL,00H
        JMP NEXT6
      MOV AH,4CH  
      INT 21H
DELAY PROC NEAR
      PUSH CX
      MOV CX,200H
NEXT7:LOOP NEXT7
      POP CX
      RET
DELAY ENDP

CODE ENDS
END START
        
