#include <stdio.h>
#include <math.h>
void main()
{
	int k;
	float x,i,j,coxx;
	scanf("%f",&x);
	coxx=0;
	i=1;
	k=0;
	j=1;
	while (fabs(j)>=1e-6)
	{
		coxx=coxx+j;
		i=-i;
		k=k+1;
		j=(i*j*x*x)/(k*(k+1));
	}
	printf("coxx=%f",coxx);
}
