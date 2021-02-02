#include<stdio.h>
#include<math.h>
void main()
{
	float a,b,c,x1,x2,q,m,n;
	scanf("%f%f%f",&a,&b,&c);
	q=pow(b,2)-4*a*c;
	if (a==0)
		printf("不是二次方程");
	else if (q==0)
	{
	x1=x2=(-b+sqrt(q))/(2*a);
     printf("x1=%.2f   x2=%.2f",x1,x2);
	}
   else if (q>0)
   {
	   x1=(-b+sqrt(q))/(2*a);
	   x2=(-b-sqrt(q))/(2*a);
	   printf("x1=%.2f   x2=%.2f",x1,x2);
   }
   else if (q<0)
   {
   m=-b/(2*a);
   n=sqrt(-q)/(2*a);
	  printf("x1=%.2f+%.2fi  x2=%.2f-%.2fi\n",m,n,m,n); 
   }
}
