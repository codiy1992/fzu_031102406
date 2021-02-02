#include<iostream>
using namespace std;
class Date
{
public:
	Date(int y,int m,int d):year(y),mon(m),dat(d){}
	void display();
private:
int year,mon,dat;
};
inline void Date::display()
{int num=0,i,leap;
for(i=0;i<year;i++)
{
if(year%4==0)
{
if(year%100==0)
{
if(year%400==0)
{num=num+366; leap=1;}
else {num=num+365;leap=0;}
}
else
{num=num+366;leap=1;}
}
else 
{num=num+365;leap=0;}
}
if(mon<3)
num=num+dat+(mon-1)*31;
if(mon>=3&&mon<=4)
num=num+60+dat+(num-3)*31;
if(mon>=5&&mon<=6)
num=num+121+dat+(num-5)*31;
if(mon>=7&&mon<=8)
num=num+182+dat+(num-7)*31;
if(mon>=9&&mon<=10)
num=num+244+dat+(num-9)*31;
if(mon>=11&&mon<=12)
num=num+305+dat+(num-11)*31;
if(leap)
num=num;
else
num=num-1;
if(num%7==0)cout<<"Sunday"<<endl;
if(num%7==1)cout<<"Monday"<<endl;
if(num%7==2)cout<<"Tuesday"<<endl;
if(num%7==3)cout<<"Wednesday"<<endl;
if(num%7==4)cout<<"Thursday"<<endl;
if(num%7==5)cout<<"Friday"<<endl;
if(num%7==6)cout<<"Saturday"<<endl;
} 

void main()
{
int y,m,d;
cin>>y>>m>>d;
while(y+m+d!=0)
{
Date dat(y,m,d);
dat.display();
	cin>>y>>m>>d;
};
}