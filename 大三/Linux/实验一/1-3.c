/*ʵ�ֽ��̵����ж�ͨ��*/
/*��Ctrl+c��,�ɷ���SIGINT�źŸ���ǰ����*/
/*ʹ��ϵͳ����fork�������������ӳ�������ϵͳ����signal����ע�Ḹ���̺��ӽ��̷ֱ�Դ��Ӽ����������ж��źţ�SIGINT�źţ�����Ϊ�������ж��źź󣬸�������ϵͳ����Kill�����������ӽ��̷����źţ��ӽ����յ��źź�ֱ����
Child Processll is Killed by Parent!
Child Processl2 is Killed by Parent!
�����̵ȴ������ӽ�����ֹ��������µ���Ϣ����ֹ��
Parent process is Killed!
*/


#include<stdio.h>
#include<signal.h>

int wait_mark;

void waiting()
{
	while(wait_mark==1);
}
void  stop()
{
	wait_mark=0;
}
          
int main()
{
	int p1,p2;
	while((p1=fork())==-1);//�����ӽ���1���������ѭ��
	if(p1==0)
	{
                   wait_mark=1;
                   signal(SIGINT,SIG_IGN);//ע��SIGINT�źŷ��������Ϊ�����ԣ�
                   signal(16,stop);//ע��17���źŷ�����Ĵ�����
                   waiting();
                   printf("Child Process 1 is Killed by Parent!\n");
                   exit(0);
	}
	else
	{
                   while((p2=fork())==-1);//�����ӽ���2���������ѭ��
                   if(p2==0)
                   {
                      wait_mark=1;
                      signal(SIGINT,SIG_IGN);//ע��SIGINT�źŷ��������Ϊ�����ԣ�      
                      signal(17,stop);//ע��17���źŷ�����Ĵ�����
                      waiting();

                      printf("Child Process 2 is Killed by Parent!\n");

                      exit(0);
                    }
                   else
                   {
                      wait_mark=1;
                      signal(SIGINT,stop);//ע��SIGINT�źŷ�����Ĵ�����
                      waiting();
                      kill(p1,16);
                      kill(p2,17);
                      wait(0);
                      wait(0);
                      printf("Parent Process is Killed!\n");
                      exit(0);
                   }
           }
}
           

