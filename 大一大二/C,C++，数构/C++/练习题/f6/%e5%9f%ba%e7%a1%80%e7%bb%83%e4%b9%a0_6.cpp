/*#include <stdio.h>
void main()
{
   int ri, repeat;
   int i, n;
   long int a, sn, tn;

   scanf("%d", &repeat);
   for(ri=1; ri<=repeat; ri++){
      scanf("%ld%d", &a, &n);
/*---------
      printf("%ld\n",sn);
   }
}*/
#include<iostream>
#include<math.h>
using namespace std;
void main()
{
int ri,repeat;
int i,n;
long int a,sn,tn;
cin>>repeat;
for(ri=1;ri<=repeat;ri++)
{
cin>>a>>n;
sn=0;tn=0;
for(i=0;i<=n-1;i++)
{
	tn=tn+a*pow(10,i);
sn=sn+tn;
}
cout<<sn<<"\n";
}
}
