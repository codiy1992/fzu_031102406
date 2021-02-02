#include<stdio.h>
#include<malloc.h>
typedef struct set *link; //定义指向某一集合的元素（set）结构体的指针
typedef struct set  //定义某一集合的元素（set）结构体
{
int x;
bool gg;  //当gg为真时候，表示该元素已经被算过一次了
link next;
}set1;
struct set *creat(int n)
{
link head,q1,q2;
int t=0;
q1=q2=(struct set *)malloc(sizeof(struct set));
scanf("%d",&q1->x);
q1->gg=false;
head=NULL;
if(n==1)
head=q1;
while(t<n-1)
{
t++;
if(t==1)head=q1;
else q2->next=q1;
q2=q1;
q1=(struct set *)malloc(sizeof(struct set));
scanf("%d",&q1->x);
q1->gg=false;
if(t==n-1)
{
	q2->next=q1;
	q1->next=NULL;
}
}
q1->next=NULL;
return(head);
}
///////////////////主函数////////////////////
void main()
{
	int n,t=1,m;
scanf("%d",&n);
	m=n;
    link p1,p2;
	p1=p2=creat(n);

while(p1!=NULL)
{

	if(p1->gg==true)
	{
	p1=p1->next;
	continue;
	}

p2=p1->next;
while(p2!=NULL)
{
if(p2->x==p1->x)
{
t++;
p2->gg=true;
}
if(p2->next==NULL)m=m-t+1;
p2=p2->next;
}
t=1;
p1=p1->next;
}
printf("%d\n",m);
}