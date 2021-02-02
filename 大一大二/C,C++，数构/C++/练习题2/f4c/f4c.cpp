#include<iostream>
#include<iomanip>
using namespace std;
class Student;
class teacher
{public:
	double display(Student &);	
};

class Student
{
public:
	Student(float t)
	{
	score=t;
	}
 friend double teacher::display(Student &);
private:
float score;
};
double teacher::display(Student &t)
{
return t.score;
}

void main()
{
int n,j;
for(j=0;;j++)
{
	cin>>n;
	if(n==0)break;
	int i;
	double s;
double sum=0,average;
for(i=0;i<n;i++)
{
cin>>s;
Student s1(s);
teacher t1;
sum=sum+t1.display(s1);
}
average=sum/n;
cout<<setiosflags(ios::fixed)<<setprecision(4)<<average<<endl;
}
}