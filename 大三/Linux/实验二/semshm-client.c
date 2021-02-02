/*
	semshm-A.c
	����ЩLinux������gcc�����ʱ�������Ҫָ�� -lpthread
	�ȿɽ�����Ϣ��Ҳ�ɷ�����Ϣ
	���߳����ڽ�����Ϣ
	�����һ���߳����ڷ�����Ϣ
*/
//=====ͷ�ļ�=====
#include "2-4semshm-.h"
//====ȫ�ֱ���====
char g_write_str[SHM_SIZE];


typedef struct _arg 
{
int semid,shmid;
char *shmaddr;
}ARG ,*PARG;

void* WriteThreadFunc(void* arg);


int main(int argc, char** argv)
{
    ARG argWrite,argRead;
    pthread_t tid;
    if((argRead.shmid = creatshm(".",57,SHM_SIZE)) == -1)
	return -1;
    if((argWrite.shmid = creatshm(".", 58, SHM_SIZE)) == -1) //�������߻�ȡ�����ڴ�
        return -1;
/*�������̺͹����ڴ�����*/
    if((argRead.shmaddr = shmat(argRead.shmid, (char*)0, 0)) == (char *)-1)
    {
        perror("attch shared memory error!\n");
        exit(1);
    }
    
    if((argWrite.shmaddr = shmat(argWrite.shmid, (char*)0, 0)) == (char *)-1)
    {
        perror("attch shared memory error!\n");
        exit(1);
    }   
    if((argWrite.semid = creatsem("./", 40, 1, 1)) == -1)//�����ź����Ե�ǰĿ¼��Ϊ�ļ���
        return -1;
    if((argRead.semid = opensem("./",39))==-1)
	return -1;
    if(pthread_create(&tid,NULL,WriteThreadFunc,&argWrite)!=0)
	{
	printf("Create Thread Error !\n");
	exit(1);
	}	
    while(1)
	{
	wait_sem(argRead.semid,0);

	if(sem_p(argRead.semid,0) == -1)
		break;
	printf("\nReceive Message: %s",argRead.shmaddr);
	sem_v(argRead.semid,0);
	usleep(1000);
	}
    sem_delete(argWrite.semid); //��semidָ�����źż���ϵͳ��ɾ?    sem_delete(argRead.semid);
    deleteshm(argWrite.shmid);   //��ϵͳ��ɾ��shmid��ʶ�Ĺ����ڴ�
    deleteshm(argRead.shmid);
    return 0;
}

//===========�̺߳���===============

void* WriteThreadFunc(void* arg)
{
    PARG pArg = (PARG)arg; 
    int semid, shmid;
    char* shmaddr;
    char *ret;
    shmid = pArg->shmid;
    semid = pArg->semid;
    shmaddr = pArg->shmaddr;
   while(1)
    {
        wait_sem(semid, 0);//�ȴ��ź������Ա���ȡ
        sem_p(semid, 0);  //��ȡ�ź���
/***************д�����ڴ�***************************************************/
	printf("write : ");
        ret = fgets(g_write_str, 1024, stdin);
	if(g_write_str[0] == '#') // '#'������д����
            break;
        int len = strlen(g_write_str);
        g_write_str[len] = '\0';
        strcpy(shmaddr, g_write_str);
/****************************************************************************/
        sem_v(semid, 0); //�ͷ��ź�?        
		usleep(1000);  //������˯��.
    }
} 
