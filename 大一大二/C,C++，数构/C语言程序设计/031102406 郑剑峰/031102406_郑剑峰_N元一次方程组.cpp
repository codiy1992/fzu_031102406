                //��NԪһ�����Է�����
//ѧ�ţ�031102406        ������֣����         �༶��4��
#include<stdio.h>
#define N 3
void main()
{
 FILE *fp ;
 float a[N][N],b[N],x[N],m,sum;
 int i,j,k;
 if((fp=fopen("matrix.txt","r"))==NULL)printf("error");//�ж��Ƿ��ܴ��ļ�
 else
	for(i=0;i<N;i++)
  {for(j=0;j<N;j++)
   {fscanf(fp,"%f",&a[i][j]);}//���ļ��е����ݴ�������
   fscanf(fp,"%f",&b[i]);
  }


 for(i=0;i<N;i++)//������任Ϊ������
	for(j=0;j<i;j++)
  {m=a[i][j]/a[j][j];
   for(k=j;k<N;k++)a[i][k]=a[i][k]-m*a[j][k];
   b[i]=b[i]-b[j]*m;
  }
 
 
	x[N-1]=b[N-1]/a[N-1][N-1];//�ش����
 for(i=N-2;i>=0;i--)
 {
  for(j=N-1;j>i;j--)
  {
   sum=b[i]-x[j]*a[i][j];
  }
	x[i]=sum/a[i][i];
 }


 for(i=0;i<N;i++)
 printf("	|X[%d]=%f|\n",i+1,x[i]);
 fclose(fp);
 if((fp=fopen("matrix1.txt","w"))==NULL)//�����������ļ���
  printf("error\n");
 else
 {
  for(i=0;i<N;i++)
   fprintf(fp,"|X[%d]=%f|\n",i+1,x[i]);
  fclose (fp);
 }


}
