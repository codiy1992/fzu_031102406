/*#include <stdio.h>
int main(void)
{
    int i, n;
    double average, sum;
    struct student{
        int num;
        char name[10];
        int score;
    }s[10];

    scanf("%d", &n);
 /*---------
    printf("average: %.2f\n", average);
}*/
#include<iostream>
#include<iomanip>
using namespace std;
int main(void)
{
int i,n;
double average,sum;
struct student
{
int num;
char name[10];
int score;
}s[10];
cin>>n;
for(i=0;i<n;i++)
cin>>s[i].num>>s[i].name>>s[i].score;
sum=0;
for(i=0;i<n;i++)
sum=sum+s[i].score;
average=sum/n;
cout<<"average: "<<setiosflags(ios::fixed)<<setprecision(2)<<average;
}
