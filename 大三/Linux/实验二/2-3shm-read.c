/*ʹ�ù����ڴ����ʵ��ͨ��*/
/*��һ���ն˴�����������shm-write����Ȼ��������һ���ն˴�������shm-read����*/

/*shm-read.c */

#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <stdio.h>
#include <string.h>


int main()
{
	
	int 	shmid;
	char 	c;
	char	*shmptr, *s;
	if((shmid=shmget(1234,256, 0666))<0)//��keyֵΪ1234�Ĺ����ڴ�
	{
		printf("shmget failed.\n");
		exit(1);
	}
	if((shmptr=shmat(shmid,0,0))==-1)//���Ӵ˹����ڴ����Լ��ĵ�ַ�ռ�
	{
		shmctl(shmid,IPC_RMID,shmptr);	
		printf("shmat failed.\n");
		exit(2);
	}
	for(s=shmptr;*s!=NULL;s++)//����26����ĸ
		putchar(*s);
	printf("\n");
	*shmptr='*';//д�롰*���������ڴ��ʾ��������
	return 0;
}
