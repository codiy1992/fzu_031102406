#include<iostream>
#include<string>
#include<iomanip>
using namespace std;
class Time
{   protected:
        int second;
        int minute;
        int hour;
    public:
		Time(int h,int min,int sec):hour(h),minute(min),second(sec){}
         virtual void operator++() = 0;
         virtual void operator--() = 0;
};
class Time_12hours:public Time
{
protected:
	string type;
	int m;
public:
	Time_12hours(int h,int min,int sec,string t,int m1):Time(h,min,sec),type(t),m(m1){}
         void operator++();
         void operator--();
};
void Time_12hours::operator ++()
{
	string str;
	if(type=="121") str="AM";
	else if(type=="122") str="PM";
	int i;
	for(i=0;i<m;i++)
	{
		second++;
	    if(second>59)
		{
			second=second-60;
		    minute=minute+1;
		}
	    if(minute>59)
		{
			minute=minute-60;
		    hour=hour+1;
		}
	    if(hour>11)
		{
			hour=hour-12;
			if(type=="121")
				str="PM";
			else if(type=="122")
				str="AM";
		}


	}
	cout<<str<<" "<<setfill('0')<<setw(2)<<hour<<":"<<setfill('0')<<setw(2)<<minute<<":"<<setfill('0')<<setw(2)<<second<<endl;
		 
}
void Time_12hours::operator --()
{
	string str;
	if(type=="121") str="AM";
	else if(type=="122") str="PM";
    int i;
   for(i=0;i<m;i++)
   {
	   second--;
	   if(second<0)
	   {
		   second=60+second;
		   minute=minute-1;
	   }
	   if(minute<0)
	   {
		   minute=minute+60;
		   hour=hour-1;
	   }
	   if(hour<0)
	   {
		  hour=hour+12;
	      if(type=="121")
			str="PM ";
		    else str="AM ";
	   }
   }
   cout<<str<<" "<<setfill('0')<<setw(2)<<hour<<":"<<setfill('0')<<setw(2)<<minute<<":"<<setfill('0')<<setw(2)<<second<<endl;
		 
}

class Time_24hours:public Time
{private:
         string type;
		 int m;
public:
	     Time_24hours(int h,int min,int sec,string ty,int m1):Time(h,min,sec),type(ty),m(m1){}
         void operator++();
         void operator--();
};
void Time_24hours::operator++()
{
	int i;
	for(i=0;i<m;i++)
	{
		second++;
	    if(second>59) 
		{
			second=second-60;
		    minute=minute+1;
		}
	    if(minute>59)
		{ 
			minute=minute-60;
	        hour=hour+1;
		}
		if(hour>23)
			hour=hour-24;
	}
	cout<<setfill('0')<<setw(2)<<hour<<":"<<setfill('0')<<setw(2)<<minute<<":"<<setfill('0')<<setw(2)<<second<<endl;
}
void Time_24hours::operator--()
{
	int i;
	for(i=0;i<m;i++)
	{
		second--;
	    if(second<0)
		{
			second=second+60;
		    minute=minute-1;
		}
	    if(minute<0)
		{  
			minute=minute+60;
	        hour=hour-1;
		}
	    if(hour<0) 
		   hour=hour+24;
	  }
	cout<<setfill('0')<<setw(2)<<hour<<":"<<setfill('0')<<setw(2)<<minute<<":"<<setfill('0')<<setw(2)<<second<<endl;

}
void main()
{
	int n,h,min,sec,m;
	string str;
	Time *p;
    cin>>n>>h>>min>>sec>>str>>m;
	while(n!=0)
	{
		if(n==24)
		{
			Time_24hours t24(h,min,sec,"24",m);
			p=&t24;
			if(str=="+")
				p->operator ++();
			if(str=="-")
				p->operator -- ();
		}
		
		else if(n==121)
		{
			Time_12hours t121(h,min,sec,"121",m);
			p=&t121;
			if(str=="+")
				p->operator ++ ();
		    if(str=="-")
				p->operator --();
		}
     	else if(n==122)
		{
			Time_12hours t122(h,min,sec,"122",m);
			p=&t122;
			if(str=="+")
				p->operator ++ ();
		    if(str=="-")
				p->operator --();
		}
		cin>>n;
		if(n!=0)
			cin>>h>>min>>sec>>str>>m;
	}
}

