/*һ���򵥵�Ա����������ϵͳ������ʵ�ּ򵥵�Ա���������ӡ�ɾ������ѯ*/

#include <stdio.h>
#include <stdlib.h>
#define ARFILE "./usr.ar"//ָ�������ļ���·������

struct arstruct//Ա�����Ͻṹ
{
    char name[10];
    int age;
    char tele[21];
};


/*ɾ��Ա������==================================*/
void removeuser()
{
    char name[10];
    struct arstruct ar;
    FILE *fp;
    FILE *fpn;
    if((fpn = fopen("./tmpfile","w")) == NULL)
    {
        return;
    }
    if((fp = fopen(ARFILE,"r")) == NULL)
    {
        return;
    }
    memset(&ar,0x00,sizeof(ar));//��սṹ
    printf("������Ա������:");
    memset(name,0x00,sizeof(name));
    scanf("%s",name);
    while(fread(&ar,sizeof(ar),1,fp) == 1)//ѭ�����ƣ�������������ƥ��Ĳ�����
    {
        if(strcmp(name,ar.name) != 0)
        {
            fwrite(&ar,sizeof(ar),1,fpn);//����ͬ������
        }
        memset(&ar,0x00,sizeof(ar));
    }
    fclose(fp);
    fclose(fpn);
    remove(ARFILE);//ɾ��ԭ�����ļ�
    rename("./tmpfile",ARFILE);//���ƺõ����ļ�������Ϊ�����ļ�
    printf("ɾ��Ա�����ϳɹ�,�����������...\n");

    getchar();//���������������\n
    getchar();//�ȴ��س�
}

/*��ѯԱ������==================================*/
void queryuser()
{
    int found;
    char name[10];
    struct arstruct ar;
    FILE *fp;
    if((fp = fopen(ARFILE,"r")) == NULL)
    {
        return;
    }
    memset(&ar,0x00,sizeof(ar));
    printf("������Ա������:");
    memset(name,0x00,sizeof(name));
    scanf("%s",name);
    found=0;
    while(fread(&ar,sizeof(ar),1,fp) == 1)
    {
        if(strcmp(name,ar.name) == 0)
        {
            found=1;
            break;
        }
        memset(&ar,0x00,sizeof(ar));
    }
    fclose(fp);
    if(found)
    {
        printf("����=%s\n",ar.name);
        printf("����=%d\n",ar.age);
        printf("�ֻ�=%s\n",ar.tele);
    }
    else
    {
        printf("û��Ա��%s������\n",name);
    }

    getchar();//���������������\n
    getchar();//�ȴ��س�
}

/*����Ա������==================================*/
void insertuser()
{
    struct arstruct ar;
    FILE *fp;
    if((fp = fopen(ARFILE,"a")) == NULL)
    {
        return;
    }
    memset(&ar,0x00,sizeof(ar));
    printf("������Ա������:");
    scanf("%s",ar.name);
    printf("������Ա������:");
    scanf("%d",&(ar.age));
    printf("������Ա���ֻ�����:");
    scanf("%s",ar.tele);
    if(fwrite(&ar,sizeof(ar),1,fp) < 0)
    {
        perror("fwrite");
        fclose(fp);
        return;
    }
    fclose(fp);
    printf("������Ա���ɹ�,�����������...\n");

    getchar();//���������������\n
    getchar();//�ȴ��س�
}

/*������������==================================*/
main()
{
    char c;
    while(1)
    {
        printf("\033[2J");//������Ҳ��ʹ��system("clear")  
        printf("     *Ա����������ϵͳ*\n");
        printf("---------------------------\n");
        printf("     1.¼����Ա������      \n");
        printf("     2.�鿴������          \n");
        printf("     3.ɾ��������          \n");
        printf("     0.�˳�ϵͳ            \n");
        printf("---------------------------\n");
        switch((c=getchar()))
        {
            case '1':
                insertuser();
                break;
            case '2':
                queryuser();
                break;
            case '3':
                removeuser();
                break;
            case '0':
                return 0;
            default:
                break;
        }
    }
}

