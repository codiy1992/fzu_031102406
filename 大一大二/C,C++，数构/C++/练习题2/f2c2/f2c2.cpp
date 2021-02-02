#include<iostream>
#include<iomanip>
using namespace std;
class circle
{
public:
	static double pi;
	static int q;
	void display();
private:
	double r,s,p[10];
	int i;
};
void circle::display()
{
for(i=0;;i++)
{cin>>r;
p[i]=r;
q++;
if(r==0)
for(i=0;i<q-1;i++)
{
s=pi*p[i]*p[i];
cout<<setiosflags(ios::fixed)<<setprecision(4)<<s<<endl;
}
}
}
double circle::pi=3.1415926;
int circle::q=0;
void main()
{
circle y;
y.display();
}