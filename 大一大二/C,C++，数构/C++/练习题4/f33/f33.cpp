#include <iostream>
using namespace std;

class polygon
{  protected: 
int number;//��������಻����100����
private:
	int sum;//�߳�����
public:	
	polygon(int num){number=num;}
	polygon(int num,int su):number(num),sum(su){}
//���캯��������Ҫ����
 int perimeter()//�������α߳�
 {}
void display()//�������α������ܳ�
	{
cout<<number<<" "<<sum<<endl;
	}
};

class rectangle:public polygon
{
public:
	rectangle(int num,int h,int w):polygon(num),height(h),width(w){}
	int perimeter1()//������α߳�
	{return (width+height)*2;}
		void display1()//�������α������ܳ�
		{cout<<4<<" "<<perimeter1()<<endl;}
private:
	int height,width;
};


class equal_polygon: public polygon
{
public:
	equal_polygon(int num,int len):polygon(num),side_len(len){}
	int perimeter2()//����ȱ߶���α߳�
	{return number*side_len;}
     void display2()//�������α������ܳ�
	 {cout<<number<<" "<<perimeter2()<<endl;}
private:
	int side_len;
};

void main()
{
int i,n;
cin>>n;
for(i=0;i<n;i++)
{
int q;
cin>>q;
if(q==0)
{
int i,sum=0,len;
cin>>len;
for(i=0;len!=-1;i++)
{sum=sum+len;cin>>len;}
polygon p(i,sum);
p.display();
}
if(q==1)
{int h,w;
cin>>h>>w;
rectangle r(4,h,w);
r.display1();
}
if(q==2)
{
	int n,len;
cin>>n>>len;
equal_polygon eq(n,len);
eq.display2();
}
}
}