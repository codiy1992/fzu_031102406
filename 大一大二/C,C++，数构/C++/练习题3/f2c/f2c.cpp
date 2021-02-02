#include<iostream>
using namespace std;
class Time
{
public:
	Time(int h,int m,int s):hour(h),minute(m),second(s){}
	void display()
	{
		if(hour<=9)  	
		    	cout<<"0"<<hour;
		  else         
			  cout<<hour;
		  cout<<":";
		 if(minute<9)
			  cout<<"0"<<minute;
		  else 
			  cout<<minute;
		  cout<<":";
		  if(second<9)
			  cout<<"0"<<second;
		  else 
			  cout<<second;
	}
	Time operator--();
	Time operator--(int);
private:
	int hour,minute,second;
};
Time Time::operator--(int)
{
if(--second<0)
{
	second+=60;
	minute--;  
	if(minute<0)
	{
		minute+=60;
		hour--;  
	}
}
return(*this);
}
int main()
{
int hour,minute,second;
cin>>hour>>minute>>second;
while(hour+minute+second!=0)
{
	Time a(hour,minute,second);
	cout<<"predecrement=";
a.display();
cout<<",";
	Time b=a--;
	cout<<"postdecrement=";
 b.display();
 cout<<endl;
cin>>hour>>minute>>second;
}
}