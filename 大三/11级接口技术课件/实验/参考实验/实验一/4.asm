;�ó������1S����������LED����ʾ��
;���ǵ�CLK0��2MHZ;������ʵ�֣���ΪN=2*10(6)>65536
;N=2000*1000
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
     MOV  AL,20H
     OUT  DX,AL
;���õڶ���
     MOV DX,CTL
     MOV AL,01100111B  ;ѡ��ͨ��1��д����ֽڣ���ʽ3����BCD��
     OUT  DX,AL
     MOV  DX,T1
     MOV  AL,10H
     OUT  DX,AL
     
     MOV  AH,4CH
     INT 21H
CSEG  ENDS
      END   START