#include <stdio.h>
#include <math.h>
void main()
{
	 float interest,money,year,rate;
	scanf("%f%f%f",&money,&year,&rate);
interest=money*pow(1+rate,year)-money;
printf("interest=%.2f",interest);

}