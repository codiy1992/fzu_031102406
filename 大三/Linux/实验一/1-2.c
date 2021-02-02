
/*使用exec系列函数使子进程执行新的目标程序*/

#include <stdio.h> /*头文件*/
#include <unistd.h>
#include <sys/types.h>

int main() 
{	
	pid_t pid; /*进程标识变量*/
	char *para[]={"ls","-a",NULL}; /*定义参数组，为execv所使用*/

	if((pid=fork())<0) /*创建新的子进程*/
	{
		perror("fork"); /*错误处理*/
	 	exit(0);
	}
	if(pid==0) /*子进程*/
	{
		if(execl("/bin/ls","ls","-l",(char *)0)==-1) /*转去执行ls -l命令并判断是否出错*/
		{
			perror("execl");
			exit(0);
		}
	}
	if((pid=fork())<0) /*创建新的子进程*/
	{
		perror("fork");
	 	exit(0);
	}
	if(pid==0)
	{
		if(execv("/bin/ls",para)==-1) /*转去执行ls -a命令并判断是否出错*/
		{
		perror("execv");
		exit(0);
		}
	}
	return;

}


