#include<iostream>
#include<string>
using namespace std;
class student
{public:
friend void display(student&);
private:
	int num;
	int score;
	string name;
};
void display(student&stu)
{
  int max,n,i,j;
	  for(j=0;;j++)
	  {
		  cin>>i;
		  if(i==0) break;
		  else
		  {
			max=0;
			for(n=1;n<=i;n++)
			{cin>>stu.num>>stu.name>>stu.score;
			if(stu.score>max)
				max=stu.score;
		
			}	cout<<max<<endl;
  		  }
	  }
}
int main()
{
    student stu;
	display(stu);
	return 0;
}