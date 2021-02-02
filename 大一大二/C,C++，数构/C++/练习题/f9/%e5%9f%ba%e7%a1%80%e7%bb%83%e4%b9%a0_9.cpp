/*#include <stdio.h> 
int main(void)
{
    int i, j, m, n, sum;
    int a[6][6];
	
    scanf("%d%d",&m,&n);
    for(i = 0; i < m; i++)    
        for(j = 0; j < n; j++)
            scanf("%d", &a[i][j]);
/*---------*/
#include<iostream>
using namespace std;
int main(void)
{
int i,j,m,n,sum;
int a[6][6];
cin>>m>>n;
for(i=0;i<m;i++)
for(j=0;j<n;j++)
cin>>a[i][j];
for(i=0;i<m;i++)
{
	sum=0;
for(j=0;j<n;j++)
sum=sum+a[i][j];
cout<<"sum of row "<<i<<" is "<<sum<<"\n";
}
}
