#include<iostream>
using namespace std;
typedef struct node *link;
typedef struct node
{
int num,color;
link next;
}Node;
//////////////////////
link creat(long n)
{
link q1,q2,head;
long t=0;
q2=q1=(link)malloc(sizeof(Node));
q1->color=-1;
q1->num=t;
q1->next=NULL;
head=q1;
while(t<n)
{
t++;
if(t!=1){q2->next=q1;}
q2=q1;
q1=(link)malloc(sizeof(Node));
q1->color=-1;
q1->num=t;
q1->next=NULL;
if(t==n){q2->next=q1;}
}
return (head);
}
////////将颜色相同的结点链接在一起///////////////
void connect(link head,long a,long b,int i)
{
link h,t1=NULL,t2=NULL,gg;
h=head;
gg=h->next;
while(gg!=NULL)
{
if(gg->num==a){t1=h;}
if(gg->num==b){t2=h;}
if(t1!=NULL&&t2!=NULL)
{
if(t1->next->color!=-1||t2->next->color==-1){t2->next->color=t1->next->color;}
if(t1->next->color==-1||t2->next->color!=-1){t1->next->color=t2->next->color;}
if(t1->next->color==-1&&t2->next->color==-1){t1->next->color=i;t2->next->color=i;}
if(t1->next->color!=-1&&t2->next->color!=-1)
{
if(t1->next->color<=t2->next->color)t2->next->color=t1->next->color;
if(t1->next->color>t2->next->color)t1->next->color=t2->next->color;
}
}
h=h->next;
gg=h->next;
}
}
/////////主函数//////////
void main()
{
long n,m,a,b;
cin>>n>>m;
link p1,p2;
p1=creat(n);
int i,t=0;
for(i=1;i<=m;i++)
{
cin>>a>>b;
connect(p1,a,b,i);
}
p2=p1->next;
while(p2!=NULL)
{
	if(p2->color==-1){p2->color=++m;}
cout<<p2->num<<" "<<p2->color<<endl;
p2=p2->next;
}
link l,r;
l=p1->next;r=l->next;
while(r!=NULL)
{
	if(l->color!=r->color){t++;}
     l=l->next;
	 r=l->next;
}
cout<<t<<endl;
}
/*
9 8
1 2
3 4
5 6
7 8
8 9
2 3
4 6
5 7
*/
