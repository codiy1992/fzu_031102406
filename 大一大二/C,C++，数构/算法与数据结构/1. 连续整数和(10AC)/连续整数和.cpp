#include<iostream>
using namespace std;
void main()
{
int n,i,j,t,sum=0;
cin>>n;
for(i=1;i<n;i++){
t=i;
for(j=i+1;;j++){
if(t==n){
sum++;
}
if(t<n){
t=t+j;
}
else
break;
}
}
cout<<sum<<endl;
}