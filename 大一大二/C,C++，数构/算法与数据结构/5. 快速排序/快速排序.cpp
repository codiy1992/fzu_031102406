#include <iostream>
#include <string>
using namespace std;
/////////////////////比较大小///////////////////////////////////////////
int less (int p,int q)
{
if(p<q)
return 1;
else
return 0;
}
/////////////////////////////位置交换///////////////////////////////////
void swap (int a[100000],int i,int j)
{
int g;
g=a[i];
a[i]=a[j];
a[j]=g;
}
////////////////////////////////////单轮快排过程//////////////////////////////
int partition1(int a[100000],int l ,int r)
{
int i=l;int j=r+1;int v=a[l];
for(;;)
{
while(less(v,a[--j]));
while(less(a[++i],v))if(i==r)break;
if(j<=i)break;
swap(a,i,j);
}
swap(a,j,l);
return j;
}
////////////////////////////////////////////////
int partition(int a[100000],int l ,int r)
{
int i=l-1;int j=r;int v=a[r];
for(;;)
{
	while(less(a[++i],v));
	while(less(v,a[--j]))if(j==l)break;
	if(i>=j)break;
swap(a,i,j);
}
swap(a,i,r);
return i;
}
/////////////////////////////////////////////////////////////////
void quicksort1(int a[100000],int l,int r,int *q2)
{
(*q2)++;
int j;
j=partition1(a,l,r);
quicksort1(a,l,j-1,q2);
quicksort1(a,j+1,r,q2);
}
void quicksort(int a[100000],int l,int r,int *q1)
{
(*q1)++;////////////////////////////
int i;
if (r<=l)return;
i=partition(a,l,r);
quicksort(a,l,i-1,q1);
quicksort(a,i+1,r,q1);
}
//////////////////////////////主函数////////////////////////////////////

void main()
{
	int t,c[100];
cin>>t;
int i,j;
for(i=0;i<t;i++)
{
int p=0,*q;
q=&p;
int a[100000];
int n;
cin>>n;
for(j=0;j<n;j++)
cin>>a[j];
string s;
cin>>s;
if(s=="head")
{
int l=0,r=n-1;
quicksort1(a,l,r,&p);
}
if(s=="rear"||s=="mid")
{
	int l=0,r=n-1;
quicksort(a,l,r,&p);
}
c[i]=p;
}
for(i=0;i<t;i++)
cout<<c[i]<<endl;
}
