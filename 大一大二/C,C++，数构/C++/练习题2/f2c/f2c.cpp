#include<iostream>
#include<iomanip>
using namespace std;
class yuan
{
public:
	 double  r;
	static double pi;
void display()
{
cout<<setiosflags(ios::fixed)<<setprecision(4)<<(double)(pi*r*r)<<endl;
}
private:
   
	double  s;
};
double  yuan::pi=3.1415926;
void main()
{
int i,p=0;
	yuan y[100];
for(i=0;;i++)
{cin>>y[i].r;
p++;
if(y[i].r==0)
for(i=0;i<p-1;i++)
y[i].display();
}
}