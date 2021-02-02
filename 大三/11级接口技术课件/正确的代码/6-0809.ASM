DATA SEGMENT
        TABLE    DB        40H,79H,24H,30H,19H,12H,02H,78H
                 DB        00H,10H,08H,03H,46H,21H,06H,0EH
        DAT      DB         ?
DATA ENDS
CODE SEGMENT
	ASSUME CS:CODE,DS:DATA
START:  MOV AX,DATA
	MOV DS,AX
	LEA DI,TABLE
	MOV AL,27H  ;8253方式字控制,产生1mS方波
	MOV DX,28BH
	OUT DX,AL
	MOV AL,10H
	MOV DX,288H 
	OUT DX,AL

	MOV AL,67H  ;8253方式字控制,产生1S方波
	MOV DX,28BH
	OUT DX,AL
	MOV AL,10H
	MOV DX,289H
	OUT DX,AL

	MOV DX,283H  ;8255方式字控制   ;10011000
	MOV AL,98H
	OUT DX,AL

LOP:
	CALL LED
	MOV DX,282H   ;8255 C口 读入
	IN AL,DX
	TEST AL,40H   ;判断1S脉冲
	JNZ LOP
         
        MOV DX,290H   ;当为负脉冲时,驱动0809进行转换
        MOV AL,00H
        OUT DX,AL
L1:     MOV DX,282H  ;转换延时
        IN AL,DX
        TEST AL,40H
        JZ L1
        
        MOV DX,290H   ;转换结束,读数取结果
        IN AL,DX
        MOV DAT,AL
        JMP LOP 
	MOV AH,4CH
	INT 21H


LED1    PROC  
	MOV AL,BL	;调用这个LED1之前，要显示的数据被放在了BL里，但BL是8位的数据，这里只需要用到他的低四位，很显然，调用之前高四位已经被置为0了
	LEA BX,TABLE	;将码表地址给BX
	XLAT		;这条指令将首地址为BX（就是TABLE的地址）偏移量为AL（就是我们要显示的BL）的内存单元的数据送给AL
        MOV DX,281H	;B口地址
        NOT AL		;按位取反，我不知道为什么要这样
        OUT DX,AL	;将数据送到B口（B口也是8位的），这样8段就正确显示了数据（B口8跟线出来，连到了8段的那8个接口）
        RET
LED1    ENDP


LED     PROC
        MOV BH,0	
        MOV BL,DAT	;将数据从DAT内存单元里取出来
        AND BL,0FH	;低四位跟0FH按位与，高四位全部变0，低四位保留原值

        MOV DX,282H	;C口地址
        MOV AL,01H	;PC0，PC1接到S0，S1控制两个8段工作与否，为1时工作
        OUT DX,AL	;置PC0为1，当然PC1到PC7同时被置为0了（其实只要让PC0为1，PC1为0，其他位无所谓）
      
        CALL LED1	;已经选择了S0所控制的8段工作，接下来就去将数据显示到上面

        MOV DX,282H	;息位码
        MOV AL,00H	
        OUT DX,AL	;将PC0,PC1都置为0,这样8段就灭了（PC2-PC7也同时被置0了，但这不是目的）
        MOV DX,281H	;B口地址
        MOV AL,00H
        OUT DX,AL	;将B口数据清零，如果不清零，可能下一次显示的时候会先显示原先的数据，然后才是想要的数据（我猜的）
			;到这边的时候8段没一个是亮着的，但已经显示过了低位的数据，所以下面要显示高位的数据，因为BL是8位的要两个8段来显示
     
	MOV BL,DAT	;继续从DAT读取数据并存到BL里面(DAT里的数据，在上面显示低位数据期间没有被改变过)
        MOV BH,0	
        MOV CL,4	;因为等会查表时候的有用的偏移是AL的低四位，所以这里要把BL的高四位放到BL的低四位上
        SHR BL,CL	;整体右移四位，（低四位变成原来的高四位，高四位不知道是啥，可以百度一下）
        AND BL,0FH	;不知道高四位是啥，保险起见把高四位置0，低四位保持不变

        MOV DX,282H	;C口地址
        MOV AL,02H	;这回置PC1为1，PC0为0（当然同时PC2-PC7也被置0了，但这不是目的）
        OUT DX,AL	;OUT出去就置数了，这回就是选择让高位的8段工作
        CALL LED1	;选择好了哪个8段工作，就该把数据放上去显示了

        MOV DX,282H  ;息位码，同样的，不写了
        MOV AL,00H
        OUT DX,AL
        MOV DX,281H
        MOV AL,00H
        OUT DX,AL
	RET
LED     ENDP
CODE ENDS
     END  START
