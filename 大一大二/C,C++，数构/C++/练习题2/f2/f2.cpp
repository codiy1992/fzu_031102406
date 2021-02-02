#include <iostream>
#include <iomanip>
#define PI 3.1415926
using namespace std;

class circle 
{
private:
	double r;
public:
	void display();
};

void circle::display()
{
	int i;
	double s;
	for(i=0;;i++)
	{
		cin>>r;
		if(r==0) break;
		s=PI*r*r;
		cout<<setiosflags(ios::fixed)<<setprecision(4)<<s<<endl;
	}
}
int main()
{
	circle circle1;
	circle1.display();
}