#include<stdio.h>
#include<stdlib.h> 
#include<string.h>
#define NN 51 // ѧ���������� 
#define SCMAX 50 // �γ������� 
int SCLoad;


typedef struct student{
        char no[10];
        char name[11];
        double score[SCMAX];
        double total;
        double avg;
		char sex[2];
		char age[10];
};
student stu[NN+1];	



int display(int n,int m,int SC)      //�ۺ���ʾ������ 
{ 
int i,j,temp,flag=0;
temp=n;
n>m?n=m,m=temp:1 ;
printf(" ��� | ѧ �� | �� �� |�Ա�|����|");
for(j=1;j<=SC;j++) 
printf("�γ�%2d|",j);
printf(" �� �� | ƽ���� \n");

if((n==0&&m==0) || (!n&&!m))n=1,m=1;
if((n==0&&m!=0) || (n!=0&&m==0))
    { n=0?n=m:m=n;flag=stu[n].total==0?1:0;}
if(stu[1].total==0 || flag){printf("û��ѧ����Ϣ��");return 0;}


for(i=n;i<=m;i++)
if(stu[i].total>0)
{        printf(" %4d | %6s | %6s |%6s |%d |",i,stu[i].no,stu[i].name,stu[i].sex,stu[i].age);
          for(j=0;j<SC;j++)
          printf("%3.1lf ",stu[i].score[j]);
          printf("| %3.2lf | %3.2lf \n",stu[i].total,stu[i].avg);
          } 
}

int getnum()
{ int i;
for(i=1;;i++)if(stu[i].total<=0)return i-1;   
}

int delone(int k)
{char arr[11];
int i,flag=0;
do
{
printf("����Ҫɾ����ѧ�ţ�");
scanf("%s",arr);
for(i=1;i<=k;i++)
   if(strcmp(arr,stu[i].no)==0){
                                stu[i]=stu[k];
                                flag=1;
                                printf("ɾ���ɹ���\n") ;
                                return k-1;
                                }
   printf("��ѧ�������ڣ�\n���������룡\n");
}
while(!flag);
}



double avgsi(int n,int scorenum)     //�� ����ƽ���� 
{ int i;
double s=0;
     for(i=1;i<=n;i++)s+=stu[i].score[scorenum-1];
return s/n;
       }

int input(int i,int SC)    //��Ϣ¼�� 
{    int j;
flag1: printf("�����%d��ѧ��ѧ�ţ�",i);
    scanf("%s",stu[i].no);
     printf("�����%d��ѧ��������",i);
    fflush(stdin);
    gets(stu[i].name);
	printf("�����%d��ѧ���Ա�",i);
    scanf("%s",stu[i].sex);
	printf("�����%d��ѧ�����䣺",i);
    scanf("%d",stu[i].age);
    printf("�����%d��ѧ���ɼ�����Ϊ(1 2 3....)�ո����\n ",i);
    stu[i].total=0;
    stu[i].avg=0;
    for(j=0;j<SC;j++){
                     scanf("%lf",&stu[i].score[j]);
                     
                     stu[i].total+=stu[i].score[j];
                     } 
    stu[i].avg=stu[i].total/SC;
    printf("Done!");
    if(stu[i].no&&stu[i].name&&stu[i].total&&stu[i].avg)return i;
    else {printf("������Ϣ�����������������룡");goto flag1;}
    return i;
    }



void dispsavg(int n,int SC) //��ʾ���Ƶ�ƽ���� 
{   int i;
    double k; 
    for(i=1;i<=SC;i++){
                          k=avgsi(n,i);
                          if(k==0)return; 
                          printf("<�γ�%2d > ƽ���֣�%.2lf\n",i,k);
                          }
}


void help()
{
    printf("   +++++++++��ӭʹ�ñ�������++++++++   \n");
    printf("   ���ܲ˵�\n");
    printf("   ����ʾ��\">\"��������������ã�\n\n\n");
    printf("   1 ��ʾ������Ϣ��\n2 ����һ����Ϣ��\n3 ɾ��һ����Ϣ��\n");
    printf("   4 �޸�һ��ѧ������Ϣ��\n5 ��ʾ����ƽ���֣�6 ����Ϣ���浽�ļ���7 ��������\nO �������ļ���\n");
    printf("  H ��ʾ��������\n   "); 
    printf("\n>>");}

int save(int n)   //����Ϣ������һ���ļ��С�
{
     FILE *fp;
     int i;
     char stu_msg[20];
     printf("����Ҫ������ļ�����");
     scanf("%s",stu_msg);
     if((fp=fopen(stu_msg,"wb"))==NULL)
     {
       printf("�޷����ļ���\n");
       return 0;
       }
       for(i=1;i<=n;i++)
         if(fwrite(&stu[i],sizeof(student),1,fp)!=1)
               printf("�ļ�д�����");
        fclose(fp);
     printf("����ɹ�!");
        }        

int openf()   //�ļ����ڳ���ͬĿ¼�¡� 
{
      FILE *fp;
      int i;
      char stu_msg[20]; 
     printf("����Ҫ�򿪵��ļ�����");
     scanf("%s",stu_msg);
      if((fp=fopen(stu_msg,"r"))==NULL)
      {printf("�޷����ļ���\n");return 0;}
      for(i=1;i<=NN;i++)
      if(fread(&stu[i],sizeof(student),1,fp)!=1 )
          { SCLoad=0;
            while(stu[1].score[SCLoad++]!=0);
            printf("���������\n");
            return i;}
      fclose(fp);
      }

int revise(int SC)
{
	char n;
	printf("������Ҫ�޸ĵ�ѧ��ѧ�ţ�");
	char arr[11];
    int i,k,flag=0;
    do
	{
        scanf("%s",arr);
        for(i=1;i<=k;i++)
        if(strcmp(arr,stu[i].no)==0)
		{
               stu[i]=stu[k];
               flag=1;
               printf("ɾ���ɹ���\n��¼������Ϣ��\n") ;
               return k-1;
        }
    printf("��ѧ�������ڣ�\n���������룡\n");
	}
    while(!flag);
    input(1+getnum(),SC);
}


int main()
{ 
    int i,j,n,a,b;
    int SC ;
    char cc,runfirst;

    printf("\n\n\n\n�Ƿ�������ļ��л��ѧ����Ϣ��Y/N:"); 
    runfirst=getchar();
    if(runfirst=='Y'||runfirst=='y'){n=openf();SC=SCLoad-1;}
    else {
flag: printf("����ѧ������( <=%d )��",NN);
    scanf("%d",&n);
    printf("����γ���( <=%d )��",SCMAX);
    scanf("%d",&SC);
    while(n>NN){
                printf("��������Χ(<=%d),���������룺",NN);
                scanf("%d",&n);} 
    for(i=1;i<=n;i++)input(i,SC);
    printf("������ϣ�\n");
    }    
    system("pause");
    system("cls");    
    printf("\n\n\n");
    help(); 
    printf("�������ʲô������\n");
    printf(">");
    while(cc=getchar())
     {   
         switch(cc)
            {
              
               case '1':case 'a':{                   
                    printf("������ֹ��� 1~%d��\n",n);                   
                    scanf("%d%d",&a,&b);
                    if(a<1 || a>n || b>n || b<1)a=1,b=n;
                    display(a,b,SC);
                    fflush(stdin);
                    break;
                    }
               case '4':revise(SC);break;             
               case '3':n=delone(n);break;
               case '2':n=input(1+getnum(),SC);break;
               case '5':dispsavg(n,SC);break;
               case 'H':help();break;
               case '6':save(n);break;
               case 'O':n=openf();SC=SCLoad-1;break;
               case '7':printf("лл��\n");return 0;                
               }
               printf("\n>");
               fflush(stdin);
               }
   return 0; 
} 