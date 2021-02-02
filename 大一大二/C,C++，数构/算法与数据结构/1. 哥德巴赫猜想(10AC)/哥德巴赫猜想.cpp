#include<stdio.h>
#include<math.h>
////////////////////////
bool p(int x)
{
int i,b;
b=sqrt(x);
for(i=2;i<=b;i++)
{
if(x%i==0)
return false;
if(i>b)
return true;
}
}
/////////////////////
void main()
{
int i,d=0,n,m,a;
scanf("%d",&n);
a=n/2;///////////****************///////////
for(i=2;i<=a;i++)
{
if(p(i))
m=n-i;
else continue;
if(p(m))
d++;
}
printf("%d\n",d);
}