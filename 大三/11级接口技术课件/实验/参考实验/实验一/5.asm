;�ó����������Ϊ10ms ,��������Ϊ100us���������塣
;���ǵ�CLK0��2MHZ;
;T=2*10(6),T1=10(4),T/T1=200,������ʵ��,�Ȳ���һ��100us���壬Ȼ��
;�÷�ʽ2��������Ϊ10MS����������Ϊ100us���������塣
DSEG   SEGMENT
T0  EQU  280H    ;T0---CTL  Ϊ������0----���ƼĴ����ĵ�ַ
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
     MOV AL,00100101B  ;ѡ��ͨ��0��д����ֽڣ���ʽ2����BCD��
     OUT  DX,AL
     MOV  DX,T0
     MOV  AL,02H
     OUT  DX,AL
;���õڶ���
     MOV DX,CTL
     MOV AL,01100101B  ;ѡ��ͨ��1��д����ֽڣ���ʽ2����BCD��
     OUT  DX,AL
     MOV  DX,T1
     MOV  AL,01H
     OUT  DX,AL
     
     MOV  AH,4CH
     INT 21H
CSEG  ENDS
      END   START
