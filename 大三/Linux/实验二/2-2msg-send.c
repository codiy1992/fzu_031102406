/*ʹ����Ϣ���л���ʵ�ַ��ͽ�����Ϣ�Ĳ�����*/
/*��һ���ն˴���������msg-send����Ȼ��������һ���ն˴�������msg-recieve����*/

/*msg-send.c */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>

struct my_msg//��Ϣ�����
{
	long int my_msg_type;//��Ϣ��������
	char text[BUFSIZ];//��Ϣ���ݵ�������
} msgbuf;

int main()
{
	int running =1;
	int msgid;
	msgid=msgget((key_t)1234,0666 |IPC_CREAT);//��keyֵΪ1234����Ϣ���У��粻�����򴴽�֮
	if(msgid==-1)
	{
		printf("msgget failed!\n");
		exit(1);
	}
	while(running)
	{
		printf("Enter some text: ");
		fgets(msgbuf.text,BUFSIZ,stdin);//��������������Ϣ
		msgbuf.my_msg_type=1;	
		if(msgsnd(msgid,(void *)&msgbuf, BUFSIZ, 0)==-1)//������Ϣ
		{
			printf("msgsnd failed!\n");
			exit(1);
		}
		if(strncmp(msgbuf.text,"end",3)==0)//����end��ʾ�������
			running=0;
	}
       
	return 0;
}

