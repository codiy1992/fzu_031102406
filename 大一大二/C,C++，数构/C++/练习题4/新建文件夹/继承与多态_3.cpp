#include<iostream>
using namespace std;
class polygon
{  
protected: 
 int number;
private:
 int sum;
public:
	polygon();
	polygon(int num):number(num){}
	polygon(int num,int su):number(num),sum(su){}
	int perimeter()
	{
	   return sum;
	}
 void display(){cout<<number<<" "<<perimeter()<<endl;}
};

class rectangle:public polygon
{
private:
 int height;
 int width;
public:
 rectangle(int h,int w):height(h),width(w){}
 int perimeter1(){return 2*(height+width);}
 void display1(){cout<<4<<" "<<perimeter1()<<endl;}
};


class equal_polygon:public polygon
{
private:
 int side_len;
public:
 equal_polygon(int num,int side):polygon(num),side_len(side){}
 int perimeter2(){return side_len*number;}
 void display2(){cout<<number<<" "<<perimeter2()<<endl;}
};
void main()
{
	int n;
	cin>>n;
	int flag,i;
	for(i=0;i<n;i++)
	{
		cin>>flag;
		if(flag==0)
		{
			int i,sidelen,sum=0;
		    cin>>sidelen;
		    for(i=0;sidelen!=-1;i++)
			{ 
			   sum=sum+sidelen;
				cin>>sidelen;
			}
			polygon po(i,sum);
			po.display();
		}
		 if(flag==1)
		{
			int h,w;
			cin>>h>>w;
            rectangle re(h,w);
			re.display1();
		}
		if(flag==2)
		{
			int num1,side1;
			cin>>num1>>side1;
			equal_polygon eq(num1,side1);
			eq.display2();
		}

	}
}







 