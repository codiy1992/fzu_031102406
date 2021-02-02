#include<iostream>
using namespace std;
class polygon
{  protected: 
       int number;
   private:
       int side_length[100];
   public:
	   polygon(){number=0;side_length[100]={0};}
       polygon(int n,string s[]):number(n),side_length(s[]){}
       int perimeter();
       void display();
};
class rectangle:public polygon
{
public:
	rectangle(int n,string side_length,int h,int w):polygon(n,s)
	{
		height=h;weight=w;
	}
	int perimeter();//¼ÆËã¾ØÐÎ±ß³¤
    void display();
private:
	int height;
	int weight;
};
class equal_polygon:public polygon
{public:
equal_polygon();
equal_polygon(int n,string s,int l):polygon(n,s)
{side_len=l;}
int perimeter();
void display();
private:
	      int side_len;
};


int polygon::perimeter()
{   int h,t,sum=0;
	for(h=0;;h++)
	   {
		cin>>number;
		if(number!=-1)
		side_length[h]=number;
		for(t=0;t<=h;t++)
		{sum=sum+side_length(t);}
		cout<<h-1<<" ";
		return sum;
        else break;
	}
}
void polygon::display()
{
  cout<<sum<<endl;
}


int rectangle::perimeter()
{ 
	int sum;
	cin>>weight>>height;
	sum=weight+height;
    return(sum=2*sum);
}
void rectangle::display()
{cout<<"4"<<sum<<endl;
}

int equal_polygon::perimeter()
{
  int m,n,sum;
  cin>>m>>n;
  sum=m*n;
  cout<<m<<" ";
  return(sum);
}
void equal_polygon::display()
{
  cout<<sum<<endl;
}

int main()
{int i,m,n;
cin>>i;
for (m=0;m<i;m++)
{
  cin>>n;
  if(n==0)
  {
	  polygon p;
      p.perimeter();
      p.display()
  }
  if(n==1)
  {
      rectangle p1();
	  p1.perimeter();
	  p1.display();
  }
  if(n==2)
  {
	  equal_polygon p2;
	  p2.perimeter();
	  p2.display();
  }
}
return 0;
}

