/*
	semshm-A.c
	在有些Linux机子上gcc编译的时候可能需要指定 -lpthread
	既可接收消息，也可发送消息
	主线程用于接收消息
	另外的一个线程用于发送消息
*/
//=====头文件=====
#include "2-4semshm-.h"
//====全局变量====
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
    if((argWrite.shmid = creatshm(".", 58, SHM_SIZE)) == -1) //创建或者获取共享内存
        return -1;
/*建立进程和共享内存连接*/
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
    if((argWrite.semid = creatsem("./", 40, 1, 1)) == -1)//创建信号量以当前目录作为文件名
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
    sem_delete(argWrite.semid); //把semid指定的信号集从系统中删?    sem_delete(argRead.semid);
    deleteshm(argWrite.shmid);   //从系统中删除shmid标识的共享内存
    deleteshm(argRead.shmid);
    return 0;
}

//===========线程函数===============

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
        wait_sem(semid, 0);//等待信号量可以被获取
        sem_p(semid, 0);  //获取信号量
/***************写共享内存***************************************************/
	printf("write : ");
        ret = fgets(g_write_str, 1024, stdin);
	if(g_write_str[0] == '#') // '#'结束读写进程
            break;
        int len = strlen(g_write_str);
        g_write_str[len] = '\0';
        strcpy(shmaddr, g_write_str);
/****************************************************************************/
        sem_v(semid, 0); //释放信号?        
		usleep(1000);  //本进程睡眠.
    }
} 
