/*ʹ�ù����ڴ����ʵ��ͨ��*/
/*��һ���ն˴�����������shm-write����Ȼ��������һ���ն˴�������shm-read����*/

/*shm-write.c */

#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <stdio.h>
#include <string.h>

int main()
{
	int 	shmid;
	char 	c;
	char 	*shmptr, *s;
	if((shmid=shmget(1234,256,IPC_CREAT | 0666))<0)//��keyֵΪ1234�Ĺ����ڴ棬�粻�����򴴽�֮
	{
		printf("shmget failed.\n");
		exit(1);
	}
	if((shmptr=shmat(shmid,0,0))==-1)//���Ӵ˹����ڴ����Լ��ĵ�ַ�ռ䣬�����ڴ������ָ��
	{
		shmctl(shmid, IPC_RMID, shmptr);		
		printf("shmat failed.\n");
		exit(2);
	}
	s=shmptr;// д�����ڴ�ͨ��ָ��s����
	for(c='a';c<='z';c++)//д��26����ĸ
		*s++=c;
	*s=NULL;
	while(*shmptr!='*')//�ȴ�ֱ����������д�롰*����ʾ��������
		sleep(1);
	shmctl(shmid, IPC_RMID, shmptr);//ɾ�������ڴ�		
	return 0;
}
