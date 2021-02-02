#include<iostream>
using namespace std;
int d[500000];
typedef struct dog *link;
typedef struct dog
{
int num;
int type;
link next;
}Dog;

link creat(int n)
{
int t=0;
link q1,q2,head;
q2=q1=(link)malloc(sizeof(Dog));
q1->next=NULL;
q1->num=t+1;
cin>>q1->type;
if(n==1){head=q1;}
while(t<n-1)
{
t++;
if(t==1){head=q1;}
else q2->next=q1;
q2=q1;
q1=(link)malloc(sizeof(Dog));
q1->next=NULL;
q1->num=t+1;
cin>>q1->type;
if(t==n-1){q2->next=q1;}
}
return (head);
}
/////////////////
void print(link head,int a,int b,int c)
{
	int i=0;
link h;
h=head;

while(h!=NULL)
{
	if(h->num>=a&&h->num<=b)
	{
			d[i]=h->type;
			i++;
	}
		h=h->next;
}
/*for(i=0;i<=b-a;i++)
{cout<<d[i]<<" ";}*/
int j,t,p;
for(i=1;i<=b-a;i++)
for(j=i;j>0;j--)
{
	if(d[j-1]>d[j]){t=d[j-1];d[j-1]=d[j];d[j]=t;}
	else continue;
}
/*for(i=0;i<=b-a;i++)
{cout<<d[i]<<" ";}*/
p=d[c-1];
cout<<p<<endl;
/*h=head;
while(h!=NULL)
{
	if(h->type==p){cout<<h->num;break;}
	h=h->next;
}*/
}
//////////////////
void main()
{
int i,n,m,a,b,c;
cin>>n>>m;
link p1,p2;
p2=p1=creat(n);
for(i=0;i<m;i++)
{
cin>>a>>b>>c;
print(p1,a,b,c);
}
/*
while(p2!=NULL)
{
cout<<p2->num<<" "<<p2->type<<endl;
p2=p2->next;
}*/

}