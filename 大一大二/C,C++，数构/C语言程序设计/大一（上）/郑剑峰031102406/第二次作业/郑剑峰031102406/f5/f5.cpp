#include <stdio.h>
void main()
{
	int n=152,digit1,digit2,digit3;
   digit1=n%10;
   digit2=(n%100-digit1)/10;
   digit3=(n-(n%100-digit1)-digit1)/100;
	printf("����152�ĸ�λ��%dʮλ��%d��λ��%d\n",digit1,digit2,digit3);
}