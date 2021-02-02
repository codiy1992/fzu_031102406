#include <iostream>
#include <string>
using namespace std;
string num[10]={"zero","one","two","three","four","five","six","seven","eight","nine"};
class number
{
private:
	string s;
	int a,b;
public:
	int sum;
	void inter()
	{
		int i;
		a=b=0;
		for(cin>>s;s!="+";cin>>s)
			for (i=0;i<10;i++)
				if(s==num[i]) a=a*10+i;
		for(cin>>s;s!="=";cin>>s)			
			for (i=0;i<10;i++)
				if(s==num[i]) b=b*10+i;
		sum=a+b;
	}
	void print()
	{
		cout<<sum<<endl;
	}
};
int main()
{
	number num;
	while(1) 
	{
		num.inter();
		if (num.sum)
			num.print();
		else break;
	} 
	return 0;
}
