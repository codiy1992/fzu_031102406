/*�����ڴ���ƿ���ֱ�Ӷ�ȡ�ڴ棬������ͨ��Ч�ʸ��ڹܵ�����Ϣ����*/
/*���ڶ�����̶�ͬһ���ڴ�������з��ʵ�Ȩ�ޣ�����֮���ͬ���ͷǳ���Ҫ*/
/*ʹ���ź�������PV������ͬ���Ĺ����ڴ����ͨ��*/
/*��һ���ն˴�����������semshm-server����Ȼ��������һ���ն˴�������semshm-client����*/

/*semshm-server.c */

#include "2-4semshm-.h"

int main(int argc, char** argv)
{
    int semid, shmid;
    char *shmaddr;
    char write_str[SHM_SIZE];
    char *ret;
    if((shmid = creatshm(".", 57, SHM_SIZE)) == -1) //�������߻�ȡ�����ڴ�
        return -1;
/*�������̺͹����ڴ�����*/
    if((shmaddr = shmat(shmid, (char*)0, 0)) == (char *)-1){
        perror("attch shared memory error!\n");
        exit(1);
    }    
    if((semid = creatsem("./", 39, 1, 1)) == -1)//�����ź����Ե�ǰĿ¼��Ϊ�ļ���
        return -1;
    while(1){
        wait_sem(semid, 0);//�ȴ��ź������Ա���ȡ
        sem_p(semid, 0);  //��ȡ�ź���
/***************д�����ڴ�***************************************************/
        printf("write : ");
        ret = fgets(write_str, 1024, stdin);
        if(write_str[0] == '#') // '#'������д����
            break;
        int len = strlen(write_str);
        write_str[len] = '\0';
        strcpy(shmaddr, write_str);
/****************************************************************************/
        sem_v(semid, 0); //�ͷ��ź���
        usleep(1000);  //������˯��.
    }
    sem_delete(semid); //��semidָ�����źż���ϵͳ��ɾ��
    deleteshm(shmid);   //��ϵͳ��ɾ��shmid��ʶ�Ĺ����ڴ�
    return 0;
}
