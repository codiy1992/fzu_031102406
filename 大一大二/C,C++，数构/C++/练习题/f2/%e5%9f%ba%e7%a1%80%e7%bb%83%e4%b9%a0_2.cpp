/*#include "stdio.h"
int main(void)
{
  int ri,repeat;
  int i,n;
  void dectobin(int n);

  scanf("%d",&repeat);
  for(ri=1;ri<=repeat;ri++){
    scanf("%d",&n);
    dectobin(n);
    printf("\n");
  }
}
/*---------*/
#include<iostream>
using namespace std;
int main (void)
{int ri, repeat;
int n;
void dectobin(int n);
cin>>repeat;
for(ri=1;ri<=repeat;ri++){
	cin>>n;
	dectobin(n);
	cout<<"\n";
}
}
void dectobin (int n)
{int a[1000],i,t;
for(i=0;i<=1000;i++)
{
a[i]=n%2;
n=n/2;
if(n==0)
{
	t=i;
for(t=i;t>=0;t--)
cout<<a[t];
break;
}
}
}
