#include<iostream>
using namespace std;
int a[6006]={0};
void main()
{
int t,n,j,i,li=0,ri=0,hi,max,min;
cin>>n;
for(i=0;i<n;i++)
{
cin>>li>>hi>>ri;
li=li+3000;
ri=ri+3000;
if(i==0){min=li;max=ri;}
if(min>li){min=li;}
if(max<ri){max=ri;}
	for(j=li;j<ri;j++)
{
	if(hi>a[j]){a[j]=hi;}
}
}
//cout<<min<<" "<<max<<" ";
i=min;
cout<<i-3000<<" "<<a[i]<<" ";
while(i<=max)
{
	if(a[i]==a[i+1]){i++;continue;}
	else cout<<i-2999<<" "<<a[i+1]<<" ";
	i++;
}
}
/*
8
1 11 5
2 6 7
3 13 9
12 7 16
14 3 25
19 18 22
23 13 29
24 4 28
*/