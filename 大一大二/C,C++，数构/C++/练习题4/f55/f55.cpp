#include<iostream>
using namespace std;
class Time
{   protected:
   int second,minute,hour;
public:
   virtual void operator++() = 0;  

virtual void operator--() = 0;
}
class Time_12hours:public Time
{
public:void operator++();
     
    void operator--();

private:
string type;
 string interval;
};
class Time_24hours:public Time
{
public:void operator++();
   void operator--();
private:
string type;
};