;A口工作在方式0，输入，接8个开关，B口工作在方式0，输出，接八段显示器;
;由8253产生1S的脉冲，PC7接该脉冲，来个脉冲将读取A口，显示在屏幕上，同时;显示在八段显示器上，PC0,PC1作为位码信号。
DATA SEGMENT
       T0  EQU  280H    ;T0---CTL  为计数器0----控制寄存器的地址
       T1  EQU  281H
       T2  EQU  282H
       CTL1 EQU  283H
       PA  EQU  288H   
       PB  EQU  289H
       PC  EQU  28AH
       CTL EQU  28BH
       TABLE    DB        40H,79H,24H,30H,19H,12H,02H,78H
                DB        00H,10H,08H,03H,46H,21H,06H,0EH
       DAT      DB         ?
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:  MOV AX,DATA
        MOV DS,AX
        LEA DI,TABLE

        MOV DX,CTL1
 	MOV AL,	00010001B
	OUT DX,AL
		
	MOV DX,T0
	MOV AL,16H
	OUT DX,AL   ;把OUT0接到PC端

        MOV DX,CTL  ;8255方式字控制   ;10011000
	MOV AL,98H
	OUT DX,AL


        MOV CX,10
LOP:	MOV  BH,0
        MOV  BL,DAT

        CALL LED

        MOV DX,PC   ;8255 C口 读入
	IN AL,DX
	TEST AL,80H   ;判断脉冲来了没有
	JNZ LOP
         
        MOV DX,PA
        IN  AL,DX
        MOV DAT,AL

        SHR AL,1
        SHR AL,1
        SHR AL,1
        SHR AL,1
        CMP AL,0AH
        JC  S1
        ADD AL,7H
  S1:   ADD AL,30H
        MOV  DL,AL  ;高四位显示在屏幕上
        MOV AH,02H
        INT 21H
        
        MOV AL,DAT
        AND AL,0FH
        CMP AL,0AH
        JC  S2
        ADD AL,7H
  S2:   ADD AL,30H
        MOV  DL,AL  ;低四位显示在屏幕上
        MOV AH,02H  
        INT 21H
        MOV DL,' '  ;显示空格
        MOV AH,02H
        INT 21H
     
L2:     MOV  DX,PC 
        IN   AL,DX
        TEST AL,80H
        JZ  L2

        INC  CX
        LOOP LOP 
        MOV AH,4CH
        INT 21H

LED1          PROC    ;显示字符程序
              LEA       SI,TABLE
              ADD       SI,BX
              MOV       AL,[SI]
              OR        AL,80H    ;最高位为1，不显示小数点
              MOV       DX,PB
              OUT       DX,AL
              RET
LED1          ENDP

LED           PROC
              PUSH      CX
              PUSH      BX

              MOV       BH,0
              AND       BL,0FH   ;低四位
   
              MOV       DX,PC  ;选择低四位,即PC0置为0
              MOV       AL,0FEH
              OUT       DX,AL
              CALL      LED1

              MOV       DX,PC  ;息位码
              MOV       AL,0FFH
              OUT       DX,AL
              MOV       DX,PB  ;息段码
              MOV       AL,0FFH
              OUT       DX,AL

              POP       BX
              PUSH      BX
              MOV       BH,0
              MOV       CL,4
              SHR       BL,CL
              AND       BL,0FH   ;高四位

              MOV       DX,PC   ;选择高四位，即PC1置为0
              MOV       AL,0FDH
              OUT       DX,AL 
              CALL      LED1 

              MOV       DX,PC  ;息位码
              MOV       AL,0FFH
              OUT       DX,AL
              MOV       DX,PB   ;息段码
              MOV       AL,0FFH
              OUT       DX,AL

              POP       BX
              POP       CX
              RET
LED           ENDP

CODE ENDS
     END  START
