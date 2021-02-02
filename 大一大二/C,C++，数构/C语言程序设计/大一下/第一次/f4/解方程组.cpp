                //N元线性方程组
//学号：031102406        姓名：郑剑峰         班级：4班
#include<stdio.h>
#include<cstdlib>
#include<math.h>
FILE *fp;
void in(int *p)//输入N(N+1)矩阵的N值函数
{
	fscanf(fp,"%d",p);
}
void read(float *p, int n)//输入矩阵的函数
{
	for(int i=0;i<n;i++)
	   fscanf(fp,"%f",p+i);	
}
void save(float *p, int n)//保存到文件的函数
{
	if((fp=fopen("F:\\C\\In.txt","a+"))==NULL)
	{
		puts("打开错误");
		exit(0);
	}
	fprintf(fp,"\n结果保留两位小数\n");
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
		puts("打开错误");
		exit(0);
	}
    in(&N);
	a=new float *[N];//分配空间
	if(a==NULL) exit(0);
	x=new float [N];
	if(x==NULL) exit(0);
	for(i=0;i<N;i ++)
	{
		a[i]=new float[N+1];
		if(a[i]==NULL) exit(0);
		read(a[i],N+1);//读取数据
	}
	fclose(fp);
	for(i=0;i<N;i++)
	{
		for(max=k=i;k<N;k++)//找出列主元
			if(fabs(a[max][i])<fabs(a[k][i])) max=k;
		if(fabs(a[max][i])<1e-5) //判断是否有解
		{
			puts("无解或有多个解"); 
			exit(0);
		}
		if(i==N-1) break;
		if(i!=max)//交换i行和max行
		{
			for(int k=i;k<=N;k++)
			{
				temp=a[i][k];
				a[i][k]=a[max][k];
				a[max][k]=temp;
			}
		}

		for(int j=i+1;j<N;j++)//消元
		{
			temp=a[j][i]/a[i][i]; 
			for(int k=i+1; k<N+1; k++)
				a[j][k]-=a[i][k]*temp;
		}
	}
    x[N-1]=a[N-1][N]/a[N-1][N-1];
	for(i=N-2;i>=0;i--)//回代
	{
		for (int j=i+1;j<N;j++)
			a[i][N]-=a[i][j]*x[j];
		x[i]=a[i][N]/a[i][i];
	}
	save(x, N);//输出到文件
}
