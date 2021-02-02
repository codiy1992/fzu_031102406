#include<iostream>
#include<iomanip>
using namespace std;
class student
{
public:
int j,k,t[10];
float sum,a[20],average,c[10];
	void display();
friend void display1(student &);
private:
	float score;
	int i,n,b;
		
};
void student::display()
{
for(i=0;;i++)
{
cin>>n;
if(n==0)break;
for(j=0;j<10;j++)
{
	b=0;sum=0;
for(k=0;k<20;k++)
{
cin>>score;
b++;
t[j]=b;
a[k]=score;
sum=sum+a[k];
c[j]=sum;
}
}
}
}
void display1(student&l)
{
int j;
	for(j=0;j<10;j++)
{
		l.average=(float)(l.c[j]/l.t[j]);
			cout<<setiosflags(ios::fixed)<<setprecision(4)<<l.average<<endl;
}
}
void main()
{
student studentn;
studentn.display;
display1(studentn);
}