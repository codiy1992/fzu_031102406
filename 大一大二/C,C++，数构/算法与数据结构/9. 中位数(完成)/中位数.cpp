#include <iostream>
#include <string>
using namespace std;
typedef struct node *link;
typedef struct node
{
	long x;
	int num;
	link next;
}Node;
/////////////////////
int number=0;      //head��ʼ��ָ���ͷ���ڱ�Ԫ��
link p1=NULL,head; //����Ҫ��p1�����ⲿʼ��ָ�����һ��Ԫ�أ���������Ԫ����Ҫ���������ʱ���������������ҵ����һ���ڵ���
link creat(long x)
{
link q1,q2;
if(p1==NULL)
{	
q2=(link)malloc(sizeof(Node));
head=q2;
number=0;
q2->num=number;
q2->next=NULL;
}
	q1=(link)malloc(sizeof(Node));
	q1->x=x;
	q1->next=NULL;
	if(number==0){q2->next=q1;}
	q1->num=++number;
	if(p1!=NULL){p1->next=q1;}
return q1;
}
/////////////////////////////////
int E(link head,int k)
{
	link l,r,gg;
	l=head;
	r=l->next;
if(r->next==NULL&&r->num==k){l->next=NULL;gg=r;free(gg);p1=NULL;free(head);number=0; return 0;}//�����ǰ����ֻ�б�ͷ��һ��Ԫ��,ɾ����Ԫ��ʱӦ�������������״̬
while(r!=NULL)
{
if(r->num==k)
{
l->next=r->next;
gg=r;
r=l->next;
free(gg);
number--; 
while(r!=NULL)
{
(r->num)--;
l=l->next;
r=l->next;
}
break;
}
l=l->next;
r=l->next;
}
return 0;
/////////////////////
}
void Q(link head)
{
	link l;
	l=head->next;
	while(l!=NULL)
	{
    if(l->num==((number+head->next->num)/2))
		cout<<l->x<<endl;	
	//cout<<l->x<<" "<<l->num<<" "<<number<<endl;
        l=l->next;
	}
}
/////////////////////
void main()
{
	long x;
	int n,i,k;
	string stype;
	cin>>n;
	link p2;
	for(i=0;i<n;i++)
	{
		cin>>stype;
		if(stype=="W")
		{
			cin>>x;
			p1=creat(x);
		}
		if(stype=="E")
		{
			cin>>k;
			E(head,k);
		}
		if(stype=="Q")
		{
			Q(head);
		}
	}
}