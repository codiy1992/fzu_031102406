;�ó�����հ������ز������źŽ��м�����10�κ��������ʹLED����
;���ǵ�CLK�Ӱ������ء�
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
     MOV AL,00010001B  ;ѡ��ͨ��0��д����ֽڣ���ʽ0����BCD��

     OUT  DX,AL
     MOV  DX,T0
     MOV  AL,09H
     OUT  DX,AL

     MOV  AH,4CH
     INT 21H
CSEG  ENDS
      END   START