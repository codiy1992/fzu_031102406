#include <stdio.h>
#include <math.h>
void main()
{
float x,y;
scanf("%f",&x);
if (x>=0)
{
y=sqrt(x);
printf ("y(%.2f)=%.2f",x,y);
}
else
y=pow(x+1,2)+2*x+1/x;
printf("y(%.2f)=%.2f",x,y);
}
