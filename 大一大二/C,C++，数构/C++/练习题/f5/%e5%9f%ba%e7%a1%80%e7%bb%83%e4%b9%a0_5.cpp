/* #include <stdio.h>
int main( )
{
   int ri, repeat;
   int i, n, flag;
   float sum;

   scanf("%d", &repeat);
   for(ri=1; ri<=repeat; ri++){
      scanf("%d", &n);
/*---------
      printf("%.3f\n", sum);
   }
}*/
#include<iostream>
#include<iomanip>
using namespace std;
int main()
{
int ri,repeat;
int i,n,flag;
float sum;
cin>>repeat;
for(ri=1;ri<=repeat;ri++)
{
cin>>n;
sum=0;
for(i=1;i<=n;i++)
{if(i%2==0)
flag=-1;
else flag=1;
sum=sum+flag*(float)(1/(float)i);
}
cout<<setprecision(3)<<sum<<"\n";
}
}