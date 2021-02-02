/*��������I/O����--�򿪹ر��ļ����Ĳ���*/
/*��������I/O�����Ȼ����ļ���������I/O�������򵥷���һЩ*/
/*���ġ�LinuxC���һվʽѧϰ����25��C��׼���2�ڱ�׼IO�⺯��������*/

#include <stdio.h>
#include <fcntl.h>

int main(void)
{
    FILE *fp;
    int fd;
    
    if( (fp = fopen("hello.txt", "w")) == NULL)
    {   /*��ֻд��ʽ���ļ���������ļ�����û�д��ļ����򴴽�����·��Ϊ��ǰĿ¼�£�Ҳ��ʹ�þ���·�����򿪳ɹ������ļ�ָ�롣--�������ķ�ʽ*/
        printf ("fail to open 1!\n");
        exit(1);          /*�����˳�*/
    }
    fprintf(fp, "Hello! I like Linux C program!\n"); 
        /*��������һ����Ϣ�������Ϣ�ᱣ�浽�򿪵��ļ��ϣ��γ��ļ��ļ�*/
    fclose(fp);               /*������ϣ��ر���*/
    
    if( (fd = open("hello.txt", O_RDWR)) == -1)
      {  /*�Զ�д�ķ�ʽ���ļ�--�����ļ��������ķ�ʽ*/
         printf ("fail to open!\n");
         exit(1);         /*�����˳�*/
      }
    
    if((fp = fdopen(fd, "a+")) == NULL)
      {  /*�ڴ򿪵��ļ��ϴ�һ�����������Ѵ��ڵ��ļ������������������ļ�β��ʼ��д��*/
        /*����w����write��r����read��a����append��+�������*/
         printf ("fail to open stream!\n");
         exit(1);         /*�����˳�*/
      }
    fprintf(fp, "I am doing Linux C programs!\n");
         /*��������һ����Ϣ�������Ϣ�ᱣ�浽�򿪵��ļ���*/
    fclose(fp);             /*�ر������ļ�Ҳ���ر�*/
    system("cat hello.txt");//ʹ��cat������ʾ�ļ�����
    return 0;
}
