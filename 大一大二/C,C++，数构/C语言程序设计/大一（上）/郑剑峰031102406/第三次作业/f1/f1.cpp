#include <stdio.h>
void main()
{
    int n,digit1,digit2,digit3; 
		n>=100&&n<=999;
	scanf("%d",&n);
	digit1=n%10;
		digit2=(n%100-digit1)/10;
		digit3=(n-(n%100-digit1)-digit1)/100;
		printf("����%d�ĸ�λ��%dʮλ��%d��λ��%d\n",n,digit1,digit2,digit3);
}