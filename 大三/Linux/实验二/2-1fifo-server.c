/*ʹ�������ܵ�FIFO����ʵ�ֿͻ���������֮�䴫�����ݵĲ�������ͻ�-��һ������ģʽ*/
/*�����ܵ��ļ��贴����Linux�ļ�ϵͳ��*/
/*��һ���ն˴���������fifo-server����Ȼ��������һ���ն˴�������fifo-client����*/

/*fifo-server.c */

#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>
#include <linux/stat.h>

#define FIFO_FILE "/tmp/MYFIFO" /*�����ܵ���·�����ļ���*/

int main()
{
	FILE *fp;
	char readbuf[80];

	if((fp=fopen(FIFO_FILE,"r"))==NULL)/*��������ܵ��ļ������ڣ�Ҫ�ȴ���һ��*/
	{
		umask(0);//����ļ�����ʱȨ��λ����������
		mknod(FIFO_FILE,S_IFIFO|0666,0);//����FIFO�ļ�
		printf("create new fifo successed. \n");
	}
	else
 		fclose(fp);

	while(1)
	{
		if((fp=fopen(FIFO_FILE,"r"))==NULL)/*�������ܵ��ļ�*/	
 		{
			printf("open fifo failed. \n");
			exit(1);
		}

		if(fgets(readbuf,80,fp)!=NULL)/*�������ܵ��ļ��ж�����*/
		{
			printf("Received string :%s \n", readbuf);
			fclose(fp);
		}
		else
		{
			if(ferror(fp))
			{
				printf("read fifo failed.\n");
				exit(1);
			}
		}
	}
	return 0;
}
