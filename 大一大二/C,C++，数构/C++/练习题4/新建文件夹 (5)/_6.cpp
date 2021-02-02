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
		virtual  operator long (){return 0;}
		virtual void display(){}
};

class Time_12hours:public Time
{
private:
	int type;
public:
	Time_12hours(int h,int min,int sec,int t):Time(h,min,sec),type(t){}
   operator long   ()
	{ if(type==122)
		 return((12+hour)*3600+minute*60+second);
else if(type==121)
return (hour*3600+minute*60+second);
	}
	void display()
	{if(type==122)
		cout<<"PM"<<" ";
	if(type==121)
		cout<<"AM"<<" "; 
	cout<<setfill('0')<<setw(2)<<hour<<":"
		<<setfill('0')<<setw(2)<<minute<<":"<<setfill('0')<<setw(2)<<second<<" ";
	
	}
};

class Time_24hours:public Time
{
public:
	     Time_24hours(int h,int min,int sec):Time(h,min,sec){}
		 operator long ()
		  {
			  return(hour*3600+minute*60+second);
		  }
		 void display()
		 {
			 cout<<setfill('0')<<setw(2)<<hour<<":"<<setfill('0')<<setw(2)<<minute<<":"<<setfill('0')<<setw(2)<<second<<" ";
		 }
         
};

void main()
{
	int repeat,n,h,min,sec,i;
	cin>>repeat;
	Time *time1,*time2;
	for(i=0;i<repeat;i++)
	{
		cin>>n>>h>>min>>sec;
		if(n==24)
		{
			Time_24hours t24(h,min,sec);
		   time1=&t24;
			
		}
		
		else if(n==121)
		{
			Time_12hours t121(h,min,sec,n);
		    time1=&t121;
		}
     	else if(n==122)
		{
			Time_12hours t122(h,min,sec,n);
			time1=&t122;
		}
		cin>>n>>h>>min>>sec;
		if(n==24)
		{
			Time_24hours t24(h,min,sec);
			time2=&t24;
			
		}
		
		else if(n==121)
		{
			Time_12hours t121(h,min,sec,n);
			time2=&t121;
		}
     	else if(n==122)
		{
			Time_12hours t122(h,min,sec,n);
			time2=&t122;
		}
       if(*time1>*time2) 
	   {
		   cout<<"time1"<<" ";
		   time1->display();
		   cout<<">"<<" "<<"time2"<<" ";
		   time2->display();
		   cout<<endl;
	   }
	  if(*time1<*time2)
	   {
		   cout<<"time1"<<" ";
		   time1->display();
		   cout<<"<"<<" "<<"time2"<<" ";
		   time2->display();
		   cout<<endl;
	   }
	  if(*time1==*time2)
	   {
		   cout<<"time1"<<" ";
		   time1->display();
		   cout<<"=="<<" "<<"time2"<<" ";
		   time2->display();
		   cout<<endl;
	   }
	}
}
