//8255 A口，工作在方式0，输入，接8个开关，B口方式0，输出，接8个LED,PC0接

由8253产生的1S脉冲，输入负脉冲时，读一次A口，存入TABLE内存单元中，并在B口显示。


DATA    SEGMENT
T0    EQU   280H
T1    EQU   281H
T2    EQU   282H
CTL53 EQU   283H
PA      EQU  288H
PB      EQU  289H
PC      EQU  28AH
CTL55     EQU  28BH
TABLE   DB 100  DUP(?)
DATA    ENDS

STACK1  SEGMENT PARA STACK
	DW 20H DUP(0)
STACK1  ENDS

COSEG   SEGMENT
        ASSUME CS:COSEG,DS:DATA
START:  MOV AX,DATA
	MOV DS,AX
        MOV CX,100
        MOV SI,0

       MOV DX,CTL53
       MOV AL,00100101B
       OUT DX,AL
       
       MOV DX,T0
       MOV AL,10H
       OUT DX,AL

       MOV DX,CTL
       MOV AL,01100111B
       OUT DX,AL
      
       MOV DX,T1
       MOV AL,10H
       OUT DX,AL

        MOV DX,CTL55
        MOV AL,10010001B
        OUT DX,AL
	
WAT:    MOV DX,PC  ;读C口
	IN AL,DX
	AND AL,01H   ;检测PC0
	JNZ WAT     ;



DONE1:  MOV DX,PA  ;PC0=1，读A口
	IN AL,DX
	MOV DX,PB  ;送B口
	OUT DX,AL
	MOV TABLE[SI],AL ;将读取的开关值存放到内存单元LABLE中
        INC SI

WAT1:  MOV DX,PC  ;读C口
        IN AL,DX
	AND AL,01H   ;检测PC0
	JZ WAT1   ;

        LOOP WAT  
        MOV AH,4CH
	INT 21H


COSEG   ENDS
	END START


