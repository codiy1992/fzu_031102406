/*�����ڴ���ƿ���ֱ�Ӷ�ȡ�ڴ棬������ͨ��Ч�ʸ��ڹܵ�����Ϣ����*/
/*���ڶ�����̶�ͬһ���ڴ�������з��ʵ�Ȩ�ޣ�����֮���ͬ���ͷǳ���Ҫ*/
/*ʹ���ź�������PV������ͬ���Ĺ����ڴ����ͨ��*/
/*��һ���ն˴�����������semshm-server����Ȼ��������һ���ն˴�������semshm-client����*/

/*semshm-client.c */

#include "2-4semshm-.h"

int main(int argc, char** argv)
{
    int semid, shmid;
    char *shmaddr;
    if((shmid = creatshm(".", 57, SHM_SIZE)) == -1)
        return -1;
    if((shmaddr = shmat(shmid, (char*)0, 0)) == (char *)-1){
        perror("attch shared memory error!\n");
        exit(1);
    }
    if((semid = opensem("./", 39)) == -1)
        return -1;
    printf("read start....................\n");        
    while(1){
        printf("read : ");
        wait_sem(semid, 0);  //�ȴ��ź������Ի�ȡ
        if(sem_p(semid, 0) == -1) //��ȡ�ź���ʧ���˳�����serverд��'#'ʱ����
            break;
        printf("%s", shmaddr);

        sem_v(semid, 0);
        usleep(1000);
    }    
    return 0;
}
