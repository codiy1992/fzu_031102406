/*ʹ����Ϣ���л���ʵ�ַ��ͽ�����Ϣ�Ĳ�����*/
/*��һ���ն˴���������msg-send����Ȼ��������һ���ն˴�������msg-recieve����*/

/*msg-recieve.c */

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
	long int msg_to_receive=0;
	msgid=msgget((key_t)1234,0666 |IPC_CREAT);//��keyֵΪ1234����Ϣ���У��粻�����򴴽�֮
	if(msgid==-1)
	{
		printf("msgget failed!\n");
		exit(1);
	}
	while(running)
	{
		if(msgrcv(msgid,(void *)&msgbuf, BUFSIZ,msg_to_receive, 0)==-1)//������Ϣ
		{
			printf("msgrcv failed!\n");
			exit(1);
		}
		printf("You wrote : %s", msgbuf.text);
		if(strncmp(msgbuf.text,"end",3)==0)//�յ�end��ʾ�������
			running=0;
	}
	if(msgctl(msgid, IPC_RMID, 0)==-1)//ɾ����Ϣ����
	{
		printf("msgct(IPC_RMID)  failed!\n");
		exit(1);
	}
	return 0;
}

