#include <stdio.h>
void main()
{int n,a,b,c,d,m,o,x,y,w;
n>=1000&&n<=9999;
scanf("%d",&n);
a=n%10;
b=(n%100-a)/10;
c=(n%1000-(n%100-a)-a)/100;
d=(n-(n%1000-(n%100-a)-a)-(n%100-a)-a)/1000;
a=(a+9)%10;
b=(b+9)%10;
c=(c+9)%10;
d=(d+9)%10;
m=b;
o=a;
x=d;
y=c;
w=m*1000+o*100+x*10+y;
printf("The encrypted number is %d\n",w);
}
