DATA	SEGMENT
	ARRAY   DB      12,34,56,-12,-34,-9,0,3,0,-5,3,5
		DB      0AH,0FFH,4,0,77H,88H,0F0H,0BBH
	COUNT	EQU	$-ARRAY
	SUM1	DW	0	;存正数累加和
	SUM2	DW	0	;存负数绝对值累加和
	CUNT1	DB	0	;存正数数据个数
	CUNT2	DB	0	;存负数数据个数   
DATA	ENDS

STACK1	SEGMENT	PARA	STACK
	STA	DW	20H	DUP(0)
STACK1	ENDS

COSEG	SEGMENT
	ASSUME	CS:COSEG,DS:DATA,SS:STACK1
START:	MOV	AX,DATA
	MOV	DS,AX
	XOR	AX,AX
	XOR	BX,BX
	XOR	CX,CX
	XOR	DX,DX
	LEA	SI,ARRAY
	MOV	CL,COUNT
LOP:	TEST	BYTE PTR [SI],80H
	JE	PLUS
       	MOV     CH,[SI]        ; 求负数绝对值
	NEG	CH
    	ADD     BL,CH          ; 负数绝对值累加
       	ADC     BH,0
       	INC     DL             ; 个数计数
	JMP	NEXT
PLUS: 	ADD     AL,[SI]        ; 正数累加
	ADC	AH,0
        INC     DH             ; 个数计数
NEXT:	INC	SI
	DEC	CL
	JNE	LOP
	MOV     SUM1,AX        ; 存结果
	MOV	SUM2,BX
	MOV	CUNT1,DH
	MOV	CUNT2,DL
	MOV	AH,4CH
	INT	21H
COSEG	ENDS
	END	START
