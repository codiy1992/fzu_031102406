                //NԪ���Է�����
//ѧ�ţ�031102406        ������֣����         �༶��4��
#include<stdio.h>
#include<cstdlib>
#include<math.h>
FILE *fp;
void in(int *p)//����N(N+1)�����Nֵ����
{
	fscanf(fp,"%d",p);
}
void read(float *p, int n)//�������ĺ���
{
	for(int i=0;i<n;i++)
	   fscanf(fp,"%f",p+i);	
}
void save(float *p, int n)//���浽�ļ��ĺ���
{
	if((fp=fopen("F:\\C\\In.txt","a+"))==NULL)
	{
		puts("�򿪴���");
		exit(0);
	}
	fprintf(fp,"\n���������λС��\n");
	for(int i=0;i<n;i++)
	   fprintf(fp,"X%d=%.2f\n",i+1,*(p+i));
	fclose(fp);
}
void main()
{	
    int i,N,max,k;
	float **a,*x,temp;
	if((fp=fopen("F:\\C\\In.txt","r"))==NULL)
	{
		puts("�򿪴���");
		exit(0);
	}
    in(&N);
	a=new float *[N];//����ռ�
	if(a==NULL) exit(0);
	x=new float [N];
	if(x==NULL) exit(0);
	for(i=0;i<N;i ++)
	{
		a[i]=new float[N+1];
		if(a[i]==NULL) exit(0);
		read(a[i],N+1);//��ȡ����
	}
	fclose(fp);
	for(i=0;i<N;i++)
	{
		for(max=k=i;k<N;k++)//�ҳ�����Ԫ
			if(fabs(a[max][i])<fabs(a[k][i])) max=k;
		if(fabs(a[max][i])<1e-5) //�ж��Ƿ��н�
		{
			puts("�޽���ж����"); 
			exit(0);
		}
		if(i==N-1) break;
		if(i!=max)//����i�к�max��
		{
			for(int k=i;k<=N;k++)
			{
				temp=a[i][k];
				a[i][k]=a[max][k];
				a[max][k]=temp;
			}
		}

		for(int j=i+1;j<N;j++)//��Ԫ
		{
			temp=a[j][i]/a[i][i]; 
			for(int k=i+1; k<N+1; k++)
				a[j][k]-=a[i][k]*temp;
		}
	}
    x[N-1]=a[N-1][N]/a[N-1][N-1];
	for(i=N-2;i>=0;i--)//�ش�
	{
		for (int j=i+1;j<N;j++)
			a[i][N]-=a[i][j]*x[j];
		x[i]=a[i][N]/a[i][i];
	}
	save(x, N);//������ļ�
}
