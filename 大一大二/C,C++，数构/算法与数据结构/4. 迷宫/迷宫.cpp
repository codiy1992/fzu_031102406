//说明：此程序只能用于路径是一个直角的情况，如最小步数的路径不是一个直角，则该程序将做出错误判断。
// 此程序能有待完善
///////////////////////////////////////////////////////////////////////////
///////////(x2,y2)←←←←←←←←←→→→→→→→→(x2,y2)////////////////
//////////////↑///////////////////↑//////////////////↑//////////////////
//////////////↑///////////////////↑//////////////////↑//////////////////
////////////// ←←←←←←←←←(x1,y1)→→→→→→→→ //////////////////
//////////////↓///////////////////↓//////////////////↓//////////////////
//////////////↓///////////////////↓//////////////////↓//////////////////
///////////(x2,y2)←←←←←←←←←→→→→→→→→(x2,y2)////////////////
///////////////////////////////////////////////////////////////////////////
#include<stdio.h>
#include<math.h>
void first(int x1[][100] ,int *p1,int *q1,int n,int m) //寻找展播位置的坐标
{
	int i,j;
for(i=0;i<n;i++)
for(j=0;j<m;j++)
{
if(x1[i][j]==0)
{
*p1=i;
*q1=j;
}
}
}

void last (int x2[][100] ,int *p2,int *q2,int n,int m)//寻找晚育位置的坐标
{
	int i,j;
for(i=0;i<n;i++)
for(j=0;j<m;j++)
{
if(x2[i][j]==1)
{
*p2=i;
*q2=j;
}
}
}
int findsushu (int x3[][100] ,int b,int c) //判断素数
{
int k;
if(x3[b][c]==2||x3[b][c]==3)
return 0;
else if(x3[b][c]==1||x3[b][c]==0)
return 1;
else if(x3[b][c]>3)
{
	for(k=2;k<=int(sqrt(x3[b][c]));k++)
	{
		if(x3[b][c]%k==0)
		{
return 1;break;
		}
	if(k==int(sqrt(x3[b][c]))&&x3[b][c]%k!=0)
		return 0;
	}
}
}

void main()
{
int a[100][100];
int i,j,n,m,max,num[8]={0,0,0,0,0,0,0,0};
int x1,y1;
int *p1,*q1;
p1=&x1;
q1=&y1;
int x2,y2,*p2,*q2;
p2=&x2;
q2=&y2;
scanf("%d%d",&n,&m);
for(i=0;i<n;i++)
for(j=0;j<m;j++)
scanf("%d",&a[i][j]);
first(a,p1,q1,n,m);
last(a,p2,q2,n,m);
//printf("%d%d%d%d%d%d%d%d\n",x1,y1,x2,y2,findsushu(a,2,0),findsushu(a,1,1),findsushu(a,0,1),findsushu(a,2,2));
////////////////////////////////////////////////////////////////////////////////////
if(x1>x2)
{
//////////////////////////////////////////////////////////
if(y1>y2)
{
for(i=x2+1;i<=x1;i++)
{
if(findsushu(a,i,y2)!=0)num[0]++;
if(findsushu(a,i,y2)==0)num[0]=0;
}
if(num[0]!=0)
for(j=y2+1;j<=y1;j++)
{
if(findsushu(a,x1,j)!=0)num[0]++;
if(findsushu(a,x1,j)==0)num[0]=0;
}
for(i=x2+1;i<=x1;i++)
{
if(findsushu(a,i,y1)!=0)num[1]++;
if(findsushu(a,i,y1)==0)num[1]=0;
}
if(num[1]!=0)
for(j=y2+1;j<=y1;j++)
{
if(findsushu(a,x2,j)!=0)num[1]++;
if(findsushu(a,x2,j)==0)num[1]=0;
}
}
/////////////////////////////////////////////////////////
if(y1<=y2)
{
for(i=x2+1;i<=x1;i++)
{
if(findsushu(a,i,y2)!=0)num[2]++;
if(findsushu(a,i,y2)==0)num[2]=0;
}
if(num[2]!=0)
for(j=y1+1;j<=y2;j++)
{
if(findsushu(a,x1,j)!=0)num[2]++;
if(findsushu(a,x1,j)==0)num[2]=0;
}

for(i=x2+1;i<=x1;i++)
{
if(findsushu(a,i,y1)!=0)num[3]++;
if(findsushu(a,i,y1)==0)num[3]=0;
}
if(num[3]!=0)
for(j=y1+1;j<=y2;j++)
{
if(findsushu(a,x2,j)!=0)num[3]++;
if(findsushu(a,x2,j)==0)num[3]=0;
}
}

}
////////////////////////////////////////////////////////////////////////////////
if(x1<=x2)
{
///////////////////////////////////////////////////////////
if(y1>y2)
{
for(i=x1+1;i<=x2;i++)
{
if(findsushu(a,i,y2)!=0)num[4]++;
if(findsushu(a,i,y2)==0)num[4]=0;
}
if(num[4]!=0)
for(j=y2+1;j<=y1;j++)
{
if(findsushu(a,x1,j)!=0)num[4]++;
if(findsushu(a,x1,j)==0)num[4]=0;
}

for(i=x1+1;i<=x2;i++)
{
if(findsushu(a,i,y1)!=0)num[5]++;
if(findsushu(a,i,y1)==0)num[5]=0;
}
if(num[5]!=0)
for(j=y2+1;j<=y1;j++)
{
if(findsushu(a,x2,j)!=0)num[5]++;
if(findsushu(a,x2,j)==0)num[5]=0;
}
}
/////////////////////////////////////////////////////////
if(y1<=y2)
{
for(i=x1+1;i<=x2;i++)
{
if(findsushu(a,i,y2)!=0)num[6]++;
if(findsushu(a,i,y2)==0)num[6]=0;
}
if(num[6]!=0)
for(j=y1+1;j<=y2;j++)
{
if(findsushu(a,x1,j)!=0)num[6]++;
if(findsushu(a,x1,j)==0)num[6]=0;
}

for(i=x1+1;i<=x2;i++)
{
if(findsushu(a,i,y1)!=0)num[7]++;
if(findsushu(a,i,y1)==0)num[7]=0;
}
if(num[7]!=0)
for(j=y1+1;j<=y2;j++)
{
if(findsushu(a,x2,j)!=0)num[7]++;
if(findsushu(a,x2,j)==0)num[7]=0;
}
}
}
///////////////////////////////////////////////////////////////////////////////
max=num[0];
//for(i=0;i<8;i++)
//printf("%d\n",num[i]);
for(i=1;i<8;i++)
{
if(num[i]>=max)
max=num[i];
}
if(max!=0)
printf("%d\n",max);
else
printf("What is a pity!\n");
}