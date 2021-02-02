/*�����ڴ���ƿ���ֱ�Ӷ�ȡ�ڴ棬������ͨ��Ч�ʸ��ڹܵ�����Ϣ����*/
/*���ڶ�����̶�ͬһ���ڴ�������з��ʵ�Ȩ�ޣ�����֮���ͬ���ͷǳ���Ҫ*/
/*ʹ���ź�������PV������ͬ���Ĺ����ڴ����ͨ��*/
/*��һ���ն˴�����������semshm-server����Ȼ��������һ���ն˴�������semshm-client����*/

/*�ļ��� �� semshm-.h */

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

union semun{//��ʵ����ṹ����linux/sem.h�����ж����
    int val;
    struct semid_ds *buf;
    unsigned short *array;
    struct seminfo *buf_info;
    void *pad;
};

/* �����ź�������*/
int creatsem(const char *pathname, int proj_id, int members, int init_val)
{
    key_t msgkey;
    int index, sid;
    union semun semopts;
    
    if((msgkey = ftok(pathname, proj_id)) == -1){//����ftok�������ɼ�ֵ������ָ���ļ�ֵ���ܻ��ͻ
        perror("ftok error!\n");				//���ļ��������ڵ��ȡ����ǰ���������ţ�proj_id���õ�key_t���͵ĵķ���ֵ��
        return -1;
    }
    if((sid = semget(msgkey, members, IPC_CREAT|0666)) == -1){//�򿪼�ֵΪmsgkey���ź��������粻�����򴴽�֮�������ź�������ʶ����
        perror("semget call failed.\n");						//membersΪ�ź������к��ź�������Ŀ��
        return -1;
    }
    semopts.val = init_val; //Ȼ��ͨ��semctl�����ź�������ÿ���ź����Ĳ���
    for(index = 0; index < members; index++){
        semctl(sid, index, SETVAL, semopts);//����semctlָ��Ϊ���Ϊindex���ź���������һ��semun�ṹ�岢����val��val�����ź�����ֵ��
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

/* p����, ��ȡ�ź���*///----------->���ź���valֵ��1
int sem_p(int semid, int index)
{
    struct sembuf sbuf = {0, -1, IPC_NOWAIT};//ÿ��sembuf�ṹ�����˸��ź��������ź������ı�ţ���һ�����ź����Ĳ���
    if(index < 0){							//IPC_NOWAITָ��������������ʱsemop������������
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

/* V����, �ͷ��ź���*/
int sem_v(int semid, int index)//----------->���ź���valֵ��1
{
    struct sembuf sbuf = {0, 1, IPC_NOWAIT};//ÿ��sembuf�ṹ������һ�����ź����Ĳ���
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

/* ɾ���ź���*/
int sem_delete(int semid)
{
    return (semctl(semid, 0, IPC_RMID));//semctl�ź�����������
}

/* �ȴ��ź���*/
int wait_sem(int semid, int index)
{
    while(semctl(semid, index, GETVAL, 0) == 0)//ָ��GETVALʱ��semctl��������semid�ź������б��Ϊindex���ź�����ֵ
    {
        usleep(500);//�������һ��ʱ��
    } 
    return 1;

}

/* ���������ڴ�*/
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

/* ɾ�������ڴ�*/
int deleteshm(int sid)
{
    void *p = NULL;
    return (shmctl(sid, IPC_RMID, p));
}
