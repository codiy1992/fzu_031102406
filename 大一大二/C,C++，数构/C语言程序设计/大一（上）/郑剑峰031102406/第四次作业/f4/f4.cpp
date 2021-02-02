#include<stdio.h>
void main()
{
float a,b,d;
	char c;
	scanf("%f%c%f",&a,&c,&b);
	switch(c)
	{
	case'+':d=a+b;printf("%f\n",d);break;
	case'-':d=a-b;printf("%f\n",d);break;
	case'*':d=a*b;printf("%f\n",d);break;
	case'/':d=a/b;printf("%f\n",d);break;
	}
}