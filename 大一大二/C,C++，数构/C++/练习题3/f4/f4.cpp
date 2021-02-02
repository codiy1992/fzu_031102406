#include<iostream>
#include<string>
using namespace std;
class student
{
public:
	student(int b,string a,float c):num(b),name(a),score(c){}
friend float search(student &);
private:
int num;
float score;
string name;
};

float search(student &s)
{
return s.score;
}

void main()
{int i,n;
cin>>n;
while(n!=0)
{
int b;
float c;
string a;
int max=0;
for(i=1;i<=n;i++)
{
	cin>>b>>a>>c;
student s(b,a,c);
if(max<search(s))
max=search(s);
}
cout<<max<<endl;
cin>>n;
}
}