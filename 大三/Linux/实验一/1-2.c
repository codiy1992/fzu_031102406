
/*ʹ��execϵ�к���ʹ�ӽ���ִ���µ�Ŀ�����*/

#include <stdio.h> /*ͷ�ļ�*/
#include <unistd.h>
#include <sys/types.h>

int main() 
{	
	pid_t pid; /*���̱�ʶ����*/
	char *para[]={"ls","-a",NULL}; /*��������飬Ϊexecv��ʹ��*/

	if((pid=fork())<0) /*�����µ��ӽ���*/
	{
		perror("fork"); /*������*/
	 	exit(0);
	}
	if(pid==0) /*�ӽ���*/
	{
		if(execl("/bin/ls","ls","-l",(char *)0)==-1) /*תȥִ��ls -l����ж��Ƿ����*/
		{
			perror("execl");
			exit(0);
		}
	}
	if((pid=fork())<0) /*�����µ��ӽ���*/
	{
		perror("fork");
	 	exit(0);
	}
	if(pid==0)
	{
		if(execv("/bin/ls",para)==-1) /*תȥִ��ls -a����ж��Ƿ����*/
		{
		perror("execv");
		exit(0);
		}
	}
	return;

}


