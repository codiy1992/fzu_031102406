///////��ͼ�ķ���//////////
#include<iostream>
using namespace std;
typedef struct city *link;//����ָ��ṹ���ָ��
typedef struct city
{//����ṹ��
int NO;
int num;
link right;
link next;
}City;
///////////////////////
link creat_one(int NO)
{//�ؽ�һ��û��ը���ĳ���
link head;
head=(link)malloc(sizeof(City));
head->NO=NO;
head->num=0;
head->next=head->right=NULL;
return head;
}
//////////����һϵ�г��У�ÿ�����ж���һöը��/////////////
link creat (int n)
{
link q1,q2,head;
int t=0;
q2=q1=(link)malloc(sizeof(City));
q1->NO=t;
q1->num=1;
q1->next=q1->right=NULL;
while(t<n)
{
t++;
if(t==1){head=q1;}
else q2->next=q1;
q2=q1;
q1=(link)malloc(sizeof(City));
q1->NO=t;
q1->num=1;
q1->next=q1->right=NULL;
if(t==n){q2->next=q1;}
}
return (head);
}
//////////////�ƶ�ը��λ��////////////////////
int move(link head,int a,int b)
{
link t1=NULL,t2=NULL,g,r,k,k1,k2;//t1,t2�ֱ�ָ�����ƶ���ը���������ը���ĳ��У�k1,k2��k2�Ƕ���ģ���k1ָ�����ƶ���ը����ǰһ������
k=head;                          //k1��������Ϊ�˷����ؽ�û��ը���ĳ���
g=k->next;
while(g!=NULL)
{
r=g;
if(g->num==1&&a==b){cout<<"ERROR"<<endl;return 0;}
if(g->num>1)
{
while(r!=NULL)
{	//���Ҫ�ƶ���ը������������������t1ָ��������У����Ҫ����ը���ĳ��о��Ǳ����еĻ��������ERROR��
	if(r->NO==a){k1=k;t1=g;}
	if(r->NO==b){k2=k;t2=g;}
	if(t1!=NULL&&t2!=NULL&&t1==t2){cout<<"ERROR"<<endl;return 0;}//���ͦ��Ҫ��Ŷ
	r=r->right;
}
}
if(g->num==0){k=k->next;g=k->next;continue;}
if(g->num==1&&g->NO==a){k1=k;t1=g;}
if(g->num==1&&g->NO==b){k2=k;t2=g;}
k=k->next;
g=k->next;
}
link h;
h=creat_one(t1->NO);//���´���һ��û��ը���ĳ��У�
k1->next=h;
h->next=t1->next;  //���½��ĳ����������������
t1->next=NULL;
if(t1!=NULL&&t2!=NULL)
{t2->num=t2->num+t1->num;}
while(t2!=NULL)
{//��ը�����õ�Ŀ�������	
if(t2->right==NULL)
{
t2->right=t1;break; 
}
t2=t2->right;
}
return 0;
}
//////////////�����ѯ����///////////////////
int print(link head,int a)
{//���ը�����ڵĳ��к���������ж���ը��
link a1,a2,r;
a1=head->next;
while(a1!=NULL)
{
	a2=a1;
	if(a1->num==0){a1=a1->next;continue;}
	if(a1->num>1)
	{r=a1;
	while(a2!=NULL)
	{
		if(a2->NO==a){cout<<r->NO<<" "<<r->num<<endl; return 0;}
		a2=a2->right;
	}
	}
	if(a1->num==1&&a1->NO==a){cout<<a1->NO<<" "<<a1->num<<endl; return 0 ;}
	a1=a1->next;
}
return 0;
}
//////////////////////////////////
void main()
{
int n,m;
cin>>n>>m;
link p1,p2;
p1=creat(n);
int i,type,a,b;
for(i=0;i<m;i++)
{
cin>>type;
if(type==1)
{
cin>>a>>b;
move(p1,a,b);
}
if(type==2)
{
cin>>a;
print(p1,a);
}
}
/*link p3;
p2=p1->next;
while(p2!=NULL)
{
	p3=p2;
	if(p2->num>1)
	{
	while(p3!=NULL)
	{
	if(p2==p3)cout<<p3->NO<<"("<<p3->num<<")"<<" ";
	else
	cout<<p3->NO<<" ";
	p3=p3->right;
	}
	cout<<endl;
	}
else
cout<<p2->NO<<" "<<p2->num<<endl;
p2=p2->next;
}*/

}//������Ų��ܶ��ˡ�����

/*
��������
9 55
1 4 2
1 5 4
1 8 5
1 1 6
1 4 6
*/