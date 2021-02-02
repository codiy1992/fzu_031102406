
DATA SEGMENT
       T0  EQU  280H    ;T0---CTL  为计数器0----控制寄存器的地址
       T1  EQU  281H
       T2  EQU  282H
       CTL1 EQU  283H
       PA  EQU  288H   
       PB  EQU  289H
       PC  EQU  28AH
       CTL EQU  28BH
       TABLe    DB        40H,79H,24H,30H,19H,12H,02H,78H
                DB        00H,10H,08H,03H,46H,21H,06H,0EH
       DAT      DB         ?
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:  MOV AX,DATA
        MOV DS,AX
        LEA DI,TABLe

       ;/*8253产生1S的连续方波
     MOV DX,CTL1
     MOV AL,00100101B  ;选择通道0，写入高字节，方式2，用BCD码
     OUT  DX,AL
     MOV  DX,T0
     MOV  AL,10H
     OUT  DX,AL
;设置第二级
     MOV DX,CTL1
     MOV AL,01100111B  ;选择通道1，写入高字节，方式3，用BCD码
     OUT  DX,AL
     MOV  DX,T1
     MOV  AL,10H
     OUT  DX,AL
;8253产生1S的连续方波*/

        MOV DX,CTL  ;8255方式字控制   ;10011000
    MOV AL,98H
    OUT DX,AL

        MOV CX,100
        MOV DX,290H
        PUSH DX
LOP:    MOV  BH,0
        MOV  BL,DAT

        CALL LED

        MOV DX,PC   ;8255 C口 读入
    IN AL,DX
    TEST AL,80H   ;判断1S脉冲
    JNZ LOP
    POP DX
    PUSH DX
        ;MOV DX,290h  ;当为负脉冲时,驱动0809进行转换    
    MOV AL,00H
        OUT DX,AL
L1:     MOV DX,282H  ;转换延时
        IN AL,DX
        TEST  AL,80H
        JZ  L1
        POP DX
        PUSH DX 
        ;MOV DX,290H   ;转换结束,读数取结果
        IN AL,DX
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
    POP DX
    INC DX
    CMP DX,298H
       JNZ N
      MOV DX,290H
N:    PUSH DX
        INC  CX
        LOOP LOP 
        MOV AH,4CH
        INT 21H



LED           PROC
              PUSH      CX
              PUSH      BX
              mov al,dat
              
              MOV       BH,0
              AND       al,0FH   ;低四位
              mov bx,offset table
              xlat 
              xor al,0ffh
              mov dx,pb
              out dx,al
              MOV       DX,PC  ;选择低四位,即PC0置为0
              MOV       AL,01H
              OUT       DX,AL

              MOV       DX,PC  ;息位码
              MOV       AL,00H
              OUT       DX,AL
              MOV       DX,PB  ;息段码
              MOV       AL,00H
              OUT       DX,AL

              POP       BX
              PUSH      BX
              mov al,dat
              and al,0f0h
               mov bx,offset table
              MOV       CL,4
              SHR       aL,CL
              AND       aL,0FH   ;高四位
              xlat
              xor al,0ffh
              mov dx,pb
              out dx,al
              
              MOV       DX,PC   ;选择高四位，即PC1置为0
              MOV       AL,02H
              OUT       DX,AL 
          

              MOV       DX,PC  ;息位码
              MOV       AL,00H
              OUT       DX,AL
              MOV       DX,PB   ;息段码
              MOV       AL,00H
              OUT       DX,AL

              POP       BX
              POP       CX
              RET
LED           ENDP

CODE ENDS
     END  START
