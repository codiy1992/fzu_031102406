#include<iostream>
using namespace std;
void f (int x,int p[])
{
	int i,d=0,t;
	for(i=1;i<=x;i++)
	{  int j=0;
		while(j<158){
            p[j]=p[j]*i;
			if(t==1){p[j]=p[j]+d;}
			if(p[j]>=10)
			{d=p[j]/10;
			p[j]=p[j]%10;
			t=1;}
			else t=0;
			j++;
		}
	}
}

int main()
{
int m,n;
cin>>m>>n;
if(m==n){cout<<"0"<<endl;return 0;}
int a[158]={1};
int b[158]={1};
int c[158]={0};
f(m,a);
f(n,b);
int i;
if(m==1&&n==0){cout<<"0"<<endl;return 0;}
	int l,d=0;
for(i=0;i<158;i++)
{	
	if(a[i]<b[i]){a[i]=a[i]+10;a[i+1]=a[i+1]-1;}/*这个代码好啊，精辟啊*/
	c[i]=a[i]-b[i];
}
int g;
for(i=0;i<158;i++){if(c[i]!=0)g=i;}
for(i=g;i>=0;i--)
cout<<c[i];
cout<<endl;
}
