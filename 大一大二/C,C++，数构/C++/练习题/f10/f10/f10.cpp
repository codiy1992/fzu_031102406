#include<iostream>
#include<iomanip>
using namespace std;
int main(void)
{
int i,n;
double x;
struct emp
{
char name[10];
double jbg;
double fdg;
double zc;
}s[10];
cin>>n;
for(i=0;i<n;i++)
{
cin>>s[i].name>>s[i].jbg>>s[i].fdg>>s[i].zc;
}
for(i=0;i<n;i++)
{
x=s[i].jbg+s[i].fdg-s[i].zc;
cout<<setw(5)<<s[i].name<<' '<<"实发工资："<<' '<<setiosflags(ios::fixed)<<setprecision(2)<<x<<endl;

}
}