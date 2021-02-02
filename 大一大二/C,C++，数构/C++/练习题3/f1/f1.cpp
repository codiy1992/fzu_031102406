#include <iostream>
using namespace std;
class complex
{
public:
	complex()
	{
		real=0;imag=0;
	}
	complex(double r ,double i)
	{
		real=r;
		imag=i;
	}
	int operator==(complex &t2);
	void display();
private:
	double real;
	double imag;
};
 int complex::operator==(complex &t2)
{
if(real==t2.real&&imag==t2.imag)
return 1;
else
return 0;
}
void complex::display()
{
	if(real==0&&imag!=0)
	cout<<imag<<"i";
if(imag==0&&real!=0)
cout<<real;
if(real!=0&&imag>0)
cout<<real<<"+"<<imag<<"i";
if(real!=0&&imag<0)
cout<<real<<imag<<"i";
}
int main()
{
	int i;
	double a,b,c,d;
	for(i=0;;i++)
	{
		cin>>a>>b>>c>>d;
complex t1(a,b),t2(c,d);
	if(a!=0||b!=0||c!=0||d!=0)
	{
		if(t1==t2)
{
cout<<"a=";t1.display();cout<<","<<"b=";t2.display();cout<<","<<"a等于b"<<"\n";
}
else
{
cout<<"a=";t1.display();cout<<","<<"b=";t2.display();cout<<","<<"a不等于b"<<"\n";
}
	}
	else return 0;
	}
}
