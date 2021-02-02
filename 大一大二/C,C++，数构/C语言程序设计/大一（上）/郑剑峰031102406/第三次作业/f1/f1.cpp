#include <stdio.h>
void main()
{
    int n,digit1,digit2,digit3; 
		n>=100&&n<=999;
	scanf("%d",&n);
	digit1=n%10;
		digit2=(n%100-digit1)/10;
		digit3=(n-(n%100-digit1)-digit1)/100;
		printf("整数%d的个位是%d十位是%d百位是%d\n",n,digit1,digit2,digit3);
}