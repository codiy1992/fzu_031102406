#include<iostream>
using namespace std;
int main()
{
int ri,repeat;
int i,index,n,max;
int a[10];
cin>>repeat;
for(ri=1;ri<=repeat;ri++)
{
cin>>n;
for(i=0;i<n;i++)
cin>>a[i];
max=a[0];
for(i=0;i<n;i++)
{
if(a[i]>=max)
{
max=a[i];
index=i;
}
if(i==n-1)
cout<<"max="<<a[index]<<",index="<<index<<"\n";
}
}
return(0);
}