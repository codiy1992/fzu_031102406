#include<iostream>
#include<string>
using namespace std;
typedef struct area_army *link;//����ָ��ṹ���ָ��
typedef struct area_army//������ṹ��
{
int num;
link next;
}Area_army;
/////////����������//////////
link creat(int n)
{
link q1,q2,head;
int t=0;
q1=q2=(link)malloc(sizeof(Area_army));
cin>>q1->num;
q1->next=NULL;
head=NULL;
if(n==1){head=q1;}
while(t<n-1)
{
	t++;
if(t==1)
{
head=q1;
}
else q2->next=q1;
q2=q1;
q1=(link)malloc(sizeof(Area_army));
cin>>q1->num;
q1->next=NULL;
if(t==n-1) {q2->next=q1;q1->next=NULL;}   
}
q1->next=NULL;   
return(head);  
}
//////////"U"��������////////////////
link U(link p1,link p2)
{
	link h=p1;
	if(p1==NULL){p1=p2;return p1;}
while(p1!=NULL)
{
if(p1->next==NULL){p1->next=p2;return h;}
p1=p1->next;
}
}
//////////"I"��������////////////////
link I(link p1,int p2)
{
link t;
t=(link)malloc(sizeof(Area_army));
t->num=p2;
t->next=p1;
return t;
}
//////////"D"��������////////////////
link D(link p1,int p2)
{
link t,	g;// t ʼ��ָ���ͷ
t=p1;
while(t!=NULL&&t->num==p2)
{
t=t->next;
}
p1=t;
while(p1!=NULL)
{
g=p1;
p1=p1->next;
if(p1!=NULL&&p1->num==p2){g->next=p1->next;p1=g;}
}
return t;
}
//////////"Q"��������////////////////
void Q(link p1)
{
	if(p1->next==NULL){cout<<p1->num;}
	else
while(p1!=NULL)
{
cout<<p1->num;
if(p1->next->next==NULL){cout<<" "<<p1->next->num;break;}
cout<<" ";
p1=p1->next;
}
}
//////////������/////////////////
void main()
{
	int i,n,m,x;
cin>>n>>m;

string str;
link p[999];
p[0]=NULL;
for(i=1;i<=n;i++)
{
cin>>x;
p[i]=creat(x);
}
int a,b;
for(i=0;i<m;i++)
{
cin>>str;
if(str=="U")
{
cin>>a>>b;
p[a]=U(p[a],p[b]);
p[b]=NULL;
}
if(str=="I")
{
cin>>a>>b;
p[a]=I(p[a],b);
}
if(str=="D")
{
cin>>a>>b;
p[a]=D(p[a],b);
}
if(str=="Q")
{
cin>>a;
if(p[a]==NULL)cout<<"-1";
else Q(p[a]);
cout<<endl;
}
}
/*
for(i=1;i<=n;i++)
{
while(p[i]!=NULL)
{
cout<<p[i]->num;
p[i]=p[i]->next;
}
}*/
}

/*�������ݣ�
3 9
2 1 2
3 1 2 3
4 3 2 1 3
U 1 2
Q 1
Q 2
U 3 1
Q 3
I 1 1
Q 1
D 3 1
Q 3
*/