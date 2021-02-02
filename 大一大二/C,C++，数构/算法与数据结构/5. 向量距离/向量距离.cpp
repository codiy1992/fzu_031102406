#include<iostream>
#include<math.h>
using namespace std;
typedef struct vector_A *link1;
typedef struct vector_A {int x;link1 next;} vectora;

struct vector_A *creatA(int m)
{
link1 head,q1,q2;
int t=0;
q1=q2=(struct vector_A *)malloc(sizeof(struct vector_A));
cin>>q1->x;
head=NULL;
if(m==1)
head=q1;
while(t<m-1)
{
t++;
if(t==1)head=q1;
else q2->next=q1;
q2=q1;
q1=(struct vector_A *)malloc(sizeof(struct vector_A));
cin>>q1->x;
}
q2->next=NULL;
return(head);
}
///////////////////////////////////////////////////////////
typedef struct vector_B *link2;
typedef struct vector_B {int x;link2 next;} vectorb;
struct vector_B *creatB(int n)
{
link2 first,h1,h2;
int t=0;
h1=h2=(struct vector_B *)malloc(sizeof(struct vector_B));
cin>>h1->x;
first=NULL;
if(n==1)
first=h1;
while(t<n-1)
{
t++;
if(t==1)first=h1;
else h2->next=h1;
h2=h1;
h1=(struct vector_B *)malloc(sizeof(struct vector_B));
cin>>h1->x;
}
h2->next=NULL;
return(first);
}
void main()
{
int m,n,min;
link1 p1;
link2 p2;
cin>>m>>n;
p1=creatA(m);
p2=creatB(n);	
min=abs(p1->x-p2->x);
p2=p2->next;	
while(p1!=NULL)
{

while(p2!=NULL)
{
if(min>=abs(p1->x-p2->x))
min=abs(p1->x-p2->x);
p2=p2->next;
}
p1=p1->next;
}
cout<<min<<endl;
}