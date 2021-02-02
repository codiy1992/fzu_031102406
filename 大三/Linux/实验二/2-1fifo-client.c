/*ʹ�������ܵ�FIFO����ʵ�ֿͻ���������֮�䴫�����ݵĲ�������ͻ�-��һ������ģʽ*/
/*�����ܵ��ļ��贴����Linux�ļ�ϵͳ��*/
/*��һ���ն˴���������fifo-server����Ȼ��������һ���ն˴�������fifo-client����*/

/*fifo-client.c */

#include <stdio.h>
#include <stdlib.h>

#define FIFO_FILE "/tmp/MYFIFO"/*�����ܵ���·�����ļ���*/

int main(int argc, char *argv[])
{
	FILE *fp;
	int i;
	if(argc<=1)
	{
		printf("usage: %s <message>\n",argv[0]);
		exit(1);
	}
 
	if((fp=fopen(FIFO_FILE,"w"))==NULL)/*�������ܵ��ļ�*/	
	{
		printf("open fifo failed. \n");
		exit(1);
	}

	for(i=1;i<argc;i++)
	{
		if(fputs(argv[i],fp)==EOF)
		{
			printf("write fifo error. \n");
			exit(1);
		}
		if(fputs(" ",fp)==EOF)
		{
			printf("write fifo error. \n");
			exit(1);
		}
	}
	fclose(fp);
	return 0;
	 
}

