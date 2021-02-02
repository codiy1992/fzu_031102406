#include<stdio.h>
#include<stdlib.h> 
#include<string.h>
#define NN 51 // 学生人数上限 
#define SCMAX 50 // 课程数上限 
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



int display(int n,int m,int SC)      //综合显示函数。 
{ 
int i,j,temp,flag=0;
temp=n;
n>m?n=m,m=temp:1 ;
printf(" 序号 | 学 号 | 姓 名 |性别|年龄|");
for(j=1;j<=SC;j++) 
printf("课程%2d|",j);
printf(" 总 分 | 平均分 \n");

if((n==0&&m==0) || (!n&&!m))n=1,m=1;
if((n==0&&m!=0) || (n!=0&&m==0))
    { n=0?n=m:m=n;flag=stu[n].total==0?1:0;}
if(stu[1].total==0 || flag){printf("没有学生信息！");return 0;}


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
printf("输入要删除的学号：");
scanf("%s",arr);
for(i=1;i<=k;i++)
   if(strcmp(arr,stu[i].no)==0){
                                stu[i]=stu[k];
                                flag=1;
                                printf("删除成功！\n") ;
                                return k-1;
                                }
   printf("该学生不存在！\n请重新输入！\n");
}
while(!flag);
}



double avgsi(int n,int scorenum)     //求 单科平均分 
{ int i;
double s=0;
     for(i=1;i<=n;i++)s+=stu[i].score[scorenum-1];
return s/n;
       }

int input(int i,int SC)    //信息录入 
{    int j;
flag1: printf("输入第%d个学生学号：",i);
    scanf("%s",stu[i].no);
     printf("输入第%d个学生姓名：",i);
    fflush(stdin);
    gets(stu[i].name);
	printf("输入第%d个学生性别：",i);
    scanf("%s",stu[i].sex);
	printf("输入第%d个学生年龄：",i);
    scanf("%d",stu[i].age);
    printf("输入第%d个学生成绩依次为(1 2 3....)空格隔开\n ",i);
    stu[i].total=0;
    stu[i].avg=0;
    for(j=0;j<SC;j++){
                     scanf("%lf",&stu[i].score[j]);
                     
                     stu[i].total+=stu[i].score[j];
                     } 
    stu[i].avg=stu[i].total/SC;
    printf("Done!");
    if(stu[i].no&&stu[i].name&&stu[i].total&&stu[i].avg)return i;
    else {printf("输入信息不完整，请重新输入！");goto flag1;}
    return i;
    }



void dispsavg(int n,int SC) //显示各科的平均分 
{   int i;
    double k; 
    for(i=1;i<=SC;i++){
                          k=avgsi(n,i);
                          if(k==0)return; 
                          printf("<课程%2d > 平均分：%.2lf\n",i,k);
                          }
}


void help()
{
    printf("   +++++++++欢迎使用本帮助！++++++++   \n");
    printf("   功能菜单\n");
    printf("   在提示符\">\"下有以下命令可用！\n\n\n");
    printf("   1 显示所有信息；\n2 插入一个信息；\n3 删除一个信息；\n");
    printf("   4 修改一个学生的信息；\n5 显示各科平均分；6 将信息保存到文件；7 结束程序！\nO 打开数据文件；\n");
    printf("  H 显示本帮助；\n   "); 
    printf("\n>>");}

int save(int n)   //将信息保存在一个文件中。
{
     FILE *fp;
     int i;
     char stu_msg[20];
     printf("输入要保存的文件名：");
     scanf("%s",stu_msg);
     if((fp=fopen(stu_msg,"wb"))==NULL)
     {
       printf("无法打开文件！\n");
       return 0;
       }
       for(i=1;i<=n;i++)
         if(fwrite(&stu[i],sizeof(student),1,fp)!=1)
               printf("文件写入错误！");
        fclose(fp);
     printf("保存成功!");
        }        

int openf()   //文件放在程序同目录下。 
{
      FILE *fp;
      int i;
      char stu_msg[20]; 
     printf("输入要打开的文件名：");
     scanf("%s",stu_msg);
      if((fp=fopen(stu_msg,"r"))==NULL)
      {printf("无法打开文件！\n");return 0;}
      for(i=1;i<=NN;i++)
      if(fread(&stu[i],sizeof(student),1,fp)!=1 )
          { SCLoad=0;
            while(stu[1].score[SCLoad++]!=0);
            printf("读入结束！\n");
            return i;}
      fclose(fp);
      }

int revise(int SC)
{
	char n;
	printf("请输入要修改的学生学号：");
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
               printf("删除成功！\n请录入新信息：\n") ;
               return k-1;
        }
    printf("该学生不存在！\n请重新输入！\n");
	}
    while(!flag);
    input(1+getnum(),SC);
}


int main()
{ 
    int i,j,n,a,b;
    int SC ;
    char cc,runfirst;

    printf("\n\n\n\n是否从已有文件中获得学生信息？Y/N:"); 
    runfirst=getchar();
    if(runfirst=='Y'||runfirst=='y'){n=openf();SC=SCLoad-1;}
    else {
flag: printf("输入学生人数( <=%d )：",NN);
    scanf("%d",&n);
    printf("输入课程数( <=%d )：",SCMAX);
    scanf("%d",&SC);
    while(n>NN){
                printf("超出允许范围(<=%d),请重新输入：",NN);
                scanf("%d",&n);} 
    for(i=1;i<=n;i++)input(i,SC);
    printf("输入完毕！\n");
    }    
    system("pause");
    system("cls");    
    printf("\n\n\n");
    help(); 
    printf("你想进行什么操作？\n");
    printf(">");
    while(cc=getchar())
     {   
         switch(cc)
            {
              
               case '1':case 'a':{                   
                    printf("输入岂止序号 1~%d：\n",n);                   
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
               case '7':printf("谢谢！\n");return 0;                
               }
               printf("\n>");
               fflush(stdin);
               }
   return 0; 
} 