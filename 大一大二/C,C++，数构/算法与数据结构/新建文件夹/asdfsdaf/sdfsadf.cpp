#include<stdio.h>
void main()
{
	int i,a[2]={0,0};
	for(i=0;i<5;i++)
	{
	a[0]++;
	a[1]--;
	}
printf("%d%d",a[0],a[1]);

}