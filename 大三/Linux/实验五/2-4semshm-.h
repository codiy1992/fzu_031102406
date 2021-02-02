/*共享内存机制可以直接读取内存，所以其通信效率高于管道和消息队列*/
/*由于多个进程对同一块内存区域具有访问的权限，进程之间的同步就非常重要*/
/*使用信号量机制PV操作来同步的共享内存机制通信*/
/*在一个终端窗口中先运行semshm-server程序，然后在另外一个终端窗口运行semshm-client程序*/

/*文件名 ： semshm-.h */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/sem.h>
#include <sys/shm.h>
#include <error.h>

#include <pthread.h>

#define SHM_SIZE     1024

union semun{//其实这个结构体在linux/sem.h中是有定义的
    int val;
    struct semid_ds *buf;
    unsigned short *array;
    struct seminfo *buf_info;
    void *pad;
};

/* 创建信号量函数*/
int creatsem(const char *pathname, int proj_id, int members, int init_val)
{
    key_t msgkey;
    int index, sid;
    union semun semopts;
    
    if((msgkey = ftok(pathname, proj_id)) == -1){//利用ftok函数生成键值，自行指定的键值可能会冲突
        perror("ftok error!\n");				//将文件的索引节点号取出，前面加上子序号（proj_id）得到key_t类型的的返回值。
        return -1;
    }
    if((sid = semget(msgkey, members, IPC_CREAT|0666)) == -1){//打开键值为msgkey的信号量集，如不存在则创建之，返回信号量集标识符。
        perror("semget call failed.\n");						//members为信号量集中含信号量的数目。
        return -1;
    }
    semopts.val = init_val; //然后通过semctl设置信号量集中每个信号量的参数
    for(index = 0; index < members; index++){
        semctl(sid, index, SETVAL, semopts);//调用semctl指定为编号为index的信号量关联了一个semun结构体并设置val（val就是信号量的值）
    }
    
    return sid;
}

int opensem(const char *pathname, int proj_id)
{
    key_t msgkey;
    int sid;
    
    if((msgkey = ftok(pathname, proj_id)) == -1){
        perror("ftok error!\n");
        return -1;
    }
    
    if((sid = semget(msgkey, 0, 0666)) == -1){
        perror("open semget call failed.\n");
        return -1;
    }
    return sid;
}

/* p操作, 获取信号量*///----------->将信号量val值减1
int sem_p(int semid, int index)
{
    struct sembuf sbuf = {0, -1, IPC_NOWAIT};//每个sembuf结构描述了该信号量所在信号量集的编号，和一个对信号量的操作
    if(index < 0){							//IPC_NOWAIT指定当操作不满足时semop函数立即返回
        perror("index of array cannot equals a minus value!\n");
        return -1;
    }
    sbuf.sem_num = index;
    if(semop(semid, &sbuf, 1) == -1){
        perror("A wrong operation to semaphore occurred!\n");
        return -1;
    }
    return 0;
}

/* V操作, 释放信号量*/
int sem_v(int semid, int index)//----------->将信号量val值加1
{
    struct sembuf sbuf = {0, 1, IPC_NOWAIT};//每个sembuf结构描述了一个对信号量的操作
    if(index < 0){
        perror("index of array cannot equals a minus value!\n");
        return -1;
    }
    sbuf.sem_num = index;
    if(semop(semid, &sbuf, 1) == -1){
        perror("A wrong operation to semaphore occurred!\n");
        return -1;
    }
    return 0;
}

/* 删除信号量*/
int sem_delete(int semid)
{
    return (semctl(semid, 0, IPC_RMID));//semctl信号量操作函数
}

/* 等待信号量*/
int wait_sem(int semid, int index)
{
    while(semctl(semid, index, GETVAL, 0) == 0)//指定GETVAL时，semctl函数返回semid信号量集中编号为index的信号量的值
    {
        usleep(500);//挂起进程一段时间
    } 
    return 1;

}

/* 创建共享内存*/
int creatshm(char *pathname, int proj_id, size_t size)
{
    key_t shmkey;
    int sid;
    
    if((shmkey = ftok(pathname, proj_id)) == -1){
        perror("ftok error!\n");
        return -1;
    }
    if((sid = shmget(shmkey, size, IPC_CREAT|0666)) == -1){
        perror("shm call failed!\n");
        return -1;
    }
    return sid;
}

/* 删除共享内存*/
int deleteshm(int sid)
{
    void *p = NULL;
    return (shmctl(sid, IPC_RMID, p));
}
