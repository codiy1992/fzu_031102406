/*�����ļ��������Ĳ���*/
/*�����д��������ļ�����ʹ�á�od -td1 -tc -Ad �ļ�������ʽ�鿴�����ݽṹ */
/*-td1ѡ���ʾ���ļ��е��ֽ���ʮ���Ƶ���ʽ�г�����ÿ��һ���ֽڡ�
-tcѡ���ʾ���ļ��е�ASCII�����ַ���ʽ�г�����
����������ߵ�һ�����ļ��еĵ�ַ��-Adѡ��Ҫ����ʮ������ʾ�ļ��еĵ�ַ��*/

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

#define FILENAME "test"    /*Ҫ���в������ļ�*/
#define FLAGS O_WRONLY | O_CREAT | O_TRUNC
/*�������FLAGS���Զ�д��ʽ���ļ������ļ��������ʱ���ļ�β��ʼд*/
#define MODE 0600

int main(void)
{
    char buf1[ ] = {"abcdefghij"};    /*������1������Ϊ10*/
    char buf2[ ] = {"1234567890"};  /*������2������Ϊ10*/
    int fd;                       /*�ļ�������*/
    int count;
    const char *pathname = FILENAME;    /*ָ����Ҫ���в������ļ���·����*/
    if((fd=open(pathname,FLAGS,MODE))==-1)   /*����open�������ļ�*/
     {
        printf("error,open file failed!\n");
        exit(1);   /*�����˳�*/
     }
    count = strlen(buf1);                /*������1�ĳ���*/
    if(write(fd,buf1,count)!=count)       /*����write������������1������д���ļ�*/
    {
       printf("error,write file failed!\n");
       exit(1);   /*д�����˳�*/
    }
    system("cat test");//ʹ��cat������ʾ�ļ�����
    printf("\n");

    if(lseek(fd,5,SEEK_SET)==-1) 
    /*����lseek������λ�ļ���ƫ����Ϊ5�����ļ���ͷ����ƫ��ֵ*/
    {
       printf("error,lseek failed!\n");
       exit(1);   /*�����˳�*/
    }
    count = strlen(buf2);                /*������2�ĳ���*/
    if(write(fd,buf2,count)!=count)       /*����write������������2������д���ļ�*/
    {
       printf("error,write file failed!\n");
       exit(1);   /*д�����˳�*/
    }
    system("cat test");//ʹ��cat������ʾ�ļ�����
    printf("\n");
    return 0;
}

