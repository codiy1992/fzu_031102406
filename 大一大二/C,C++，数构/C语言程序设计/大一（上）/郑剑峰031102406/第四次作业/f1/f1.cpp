#include <stdio.h>
#include <math.h>
void main()
{
	float a,b,c,s,area;
	scanf("%f%f%f",&a,&b,&c);
	if(a+b>c&&a+c>b&&b+c>a)
	{
    s=1.0/2*(a+b+c);
	area=sqrt(s*(s-a)*(s-b)*(s-c));
	printf("area=%.2f\n",area);
	}
	else 
    printf("it is not a triangle\n");

}