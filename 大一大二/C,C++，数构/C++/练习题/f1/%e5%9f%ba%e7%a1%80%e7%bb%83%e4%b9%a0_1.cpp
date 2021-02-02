/*#include <stdio.h>
#include <math.h>
int search(int n);
int main(void)
{
	int number,ri,repeat;

	scanf("%d",&repeat);
	for(ri=1;ri<=repeat;ri++){
		do{
			scanf("%d",&number);
		}while(number<101||number>999);
		printf("count=%d\n",search(number));
	}
}
/*---------*/
#include<iostream>
#include<math.h>
using namespace std;
int search(int n);
int main(void)
{
int number,ri,repeat;
cin>>repeat;
for(ri=1;ri<=repeat;ri++)
{do
{cin>>number;
}
while(number<101||number>999);
cout<<"count="<<search(number)<<"\n";
}
}
int search (int number)
{
int i,t,q=0,a,b,c;
for(i=10;i<35;i++)
{
if(i*i>=101&&i*i<=number)
{
t=i*i;
a=t%10;
b=(t%100)/10;
c=t/100;
if(a==b||a==c||b==c)
q++;
}
}
return(q);
}