#include <iostream>
#include <iomanip>
using namespace std;
class student
{
private:
	float number;
public:
	friend void display();
}stu1;

void display()
{
	int n,i,j;
	float sum;
	for(j=0;;j++)
	{
		cin>>n;
		if(n==0) break;
		sum=0;
		for(i=0;i<n;i++)
		{
			cin>>stu1.number;
			sum=sum+stu1.number;
		}
		float average;
		average=sum/n;
		cout<<setiosflags(ios::fixed)<<setprecision(4)<<average<<endl;
	}
}
int main()
{
	display();
}