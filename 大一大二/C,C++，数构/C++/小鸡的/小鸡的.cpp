#include<iostream>
#include<iomanip>
#include<fstream>
#include<string>
using namespace std;
class zhanghu
{
public:
	zhanghu()
	{number=0;name="null";adress="null";money=0;}
	zhanghu(num,nam,ad,mon):number(num),name(nam),adress(ad),money(mon){}

private:
	long number;
string name;
string adress;
long money;
};

void main()
{
	zhanghu zh[100];
int a,i=0;
cin>>a;
if(a==1)
{
	long num;string nam;string ad;long mon;
cin>>num>>nam>>ad>>mon;
while(num!=0)
{
zhanghu zh[i](num,nam,ad,mon);
i++;
cin>>num>>nam>>ad>>mon;
ifstream fin("d:\\1.exe",ios::nocreate|ios::binary); 
}	
}

if(a==2)
{
long num;
cin>>num;
ofstream f1 ("d:\\me.txt");
if(!f1)return;
}

}