#include <stdio.h>
void main()
{
int i,n,sum;
sum=0;
i=1;
n=1;
while (i<=20)
{
	sum=sum+n;
	n=n+2;
	i=i+1;
}
printf("sum=%d\n",sum);
}