#include<iostream>
using namespace std;

typedef struct people *link;
	link p1=NULL,head;
typedef struct people
{
long ID;
long P;
link next;
link last;
}peo;
struct people *creat(long IDs,long Ps)
{
link q1;
q1=(struct people *)malloc(sizeof(struct people));
q1->ID=IDs;
q1->P=Ps;
q1->next=NULL;
q1->last=NULL;
if(p1==NULL)
head=q1;
if(p1!=NULL)
{
p1->next=q1;
q1->last=p1;
}
return q1;
}
/////////////删除最高优先级p并返回身份ID的函数///////////////
long delete1 (link h)
{
	long max;
link q2,q3;
q2=h;
max=q2->P;
q3=q2;
q2=q2->next;
if(q2==NULL)
{
	head=NULL;
return q3->ID;
}
while(q2!=NULL)
{
if(max<q2->P)
{max=q2->P;
q3=q2;}
q2=q2->next;
}
if(q3->next!=NULL&&q3->last!=NULL){q3->last->next=q3->next;q3->next->last=q3->last;}//**********//
if(q3->next==NULL&&q3->last!=NULL){q3->last->next=NULL;}
if(q3->next!=NULL&&q3->last==NULL){head=q3->next;q3->next->last=NULL;}
return q3->ID;//如果return后面还有语句，将不在执行，因为return意味着函数结束，所以前面的三个if语句不能放到return语句的后面
}
///////////返回优先级最低的ID并删除该结点的函数//////////
long delete2 (link h)
{
	long min;
link h2,h3;
h2=h;
min=h2->P;
h3=h2;
h2=h2->next;
if(h2==NULL)
{
	head=NULL;
return h3->ID;
}
while(h2!=NULL)
{
if(min>h2->P)
{min=h2->P;
h3=h2;}
h2=h2->next;
}
if(h3->next!=NULL&&h3->last!=NULL){h3->last->next=h3->next;h3->next->last=h3->last;}
if(h3->next==NULL&&h3->last!=NULL){h3->last->next=NULL;}
if(h3->next!=NULL&&h3->last==NULL){head=h3->next;h3->next->last=NULL;}
return h3->ID;
}
////////////////////////主函数///////////////////////////
void main()
{
link p2,p3;
int x,i;
long IDs,Ps;
cin>>x;
for(i=0;;i++)
{
	if(head==NULL){p1=NULL;}
if(x==1)
{
	cin>>IDs>>Ps;
p1=creat(IDs,Ps);
}
if(x==2)
{
	if(head==NULL){cout<<"0"<<endl;}
else 
{
cout<<delete1(head)<<endl;
}
}
if(x==3)
{
	if(head==NULL){cout<<"0"<<endl;}
else 
{
cout<<delete2(head)<<endl;
}
}
if(x==0)break;
cin>>x;
}
/*
p2=head;
while(p2!=NULL)
{
cout<<p2->ID<<" "<<p2->P<<endl;
p2=p2->next;
}
p2=head;
while(p2!=NULL)
{
if(p2->next==NULL){p3=p2;}
p2=p2->next;
}
while(p3!=NULL)
{
cout<<p3->ID<<" "<<p3->P<<endl;
p3=p3->last;
}*/
}