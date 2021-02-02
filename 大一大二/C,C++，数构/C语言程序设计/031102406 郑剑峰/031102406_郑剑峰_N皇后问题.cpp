                //N皇后问题
//学号：031102406        姓名：郑剑峰         班级：4班
//此程序用于解决16皇后以内的N皇后问题解的个数及其解法
# include <stdio.h>
# include <math.h>
int n=0,q[16],sum=0;
void Queens(int,int);//对每行的每列进行扫描，并放置皇后
int Place(int,int);//判断当前能否放皇后的函数
void print(int);//输出N皇后的所有解法

int main() 
{
	int n; 
	printf("请输入皇后数量：\n");
	scanf("%d",&n); 
	Queens(1,n); 
	printf("%d\n",sum);//输出N皇后解的个数
	return 0; 
}
void Queens(int k,int n) 
{
	int i; 
	if(n<k) 
		print(n); 
	else
	{
		for(i=1;i<=n;i++) //每行从第一列开始扫描
			if(Place(i,k)==1)//经Place函数判断当前位置能放皇后
			{
				q[k]=i; //把当前位置标记为已放置皇后
				Queens(k+1,n); //接着进行下一行的皇后放置
			} 
	} 
} 
int Place(int i,int k) 
{
	int j=1; 
	while(j<k)
	{
		if((q[j]==i)||abs(q[j]-i)==abs(j-k)) //判断位置是否已被占领
			return 0; //不能放皇后，则返回值为0
		j++; 
	} 
	return 1; //能放皇后，则返回值为1
} 
void print(int n) 
{
	int i; 
	for(i=1;i<=n;i++)
		printf("<%d,%d>\t",i,q[i]); //输出解法
	sum++;//每输出一次解，解的个数加一
	printf("\n"); 
}