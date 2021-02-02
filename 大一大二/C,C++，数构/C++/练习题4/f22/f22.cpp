#include <iostream>
#include <string>
#include <iomanip>
using namespace std;
class  Person 
{     protected:
string p_name;
int p_age;
public:
	Person(){p_name="0";p_age=0;}
	Person (string name, int age):p_name(name),p_age(age){}
	void display () {cout<<p_name<<":"<<p_age<<endl;} 
};
class student:virtual public Person
{
public:
	student(){ID=0;cpp_score=0;cpp_count=0;}
	student(string name, int age,int Id,float _score,float _count ):Person(name,age),ID(Id),cpp_score(_score),cpp_count(_count){}
	void display(){cout<<p_name;}
	void print()
	{
		cpp_grade=cpp_score*0.9+cpp_count*2;
		cout<<ID<<" ";display();cout<<" "<<setiosflags(ios::fixed)<<setprecision(1)<<cpp_grade<<endl;
		
	}
private:
	int ID;//学号
    float cpp_score;//cpp上机成绩
    float cpp_count;//cpp上机考勤
    float cpp_grade;//cpp总评成绩
};
class teacher:public person
{
public:
	teacher(string name, int age,string name, int age,int Id,float _score,float _count,int Id,int count,flaot _average):Person(name,age),student(name,age,Id,_score,_count)
	{
	ID=Id;
	cpp_count=count;
	cpp_average=_average;
	}
	void Add (Student & stu1)
	{

	}
void average();
void print()
{

}
private:
	int ID;//教师工号
	student stu[100];//学生数组
	int count;//学生数目，最多不超过100
      float cpp_average;//班级cpp平均分
};
void main()
{
	string name;
	int age,Id;
	cin>>name;
	while(name!="0")
	{
		float _score,_count;
		cin>>Id>>age>>_score>>_count;
		student stu1(name,age,Id,_score,_count);
		stu1.print();
		cin>>name;
	}
}