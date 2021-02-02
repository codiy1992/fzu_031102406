#include<iostream>
using namespace std;
typedef struct set *link;
typedef struct set
{
int x;
bool gg;
bool tt;
int num;
link next;
}Set;

struct set *creat(int n)
{
link head,q1,q2;
int t=0;
q1=q2=(struct set *)malloc(sizeof(struct set));
cin>>q1->x;
q1->gg=false;
q1->tt=false;
q1->num=1;
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
cin>>q1->x;
q1->gg=false;
q1->tt=false;
q1->num=1;
if(t==n-1)
{
q2->next=q1;
q1->next=NULL;
}
}
q1->next=NULL;
return(head);
}
///////////////////Ö÷º¯Êý//////////////////////
void main()
{
int n,m,t=0;
cin>>n;
link p1,p2,p3;
p1=p2=p3=creat(n);
cin>>m;
link h1,h2,h3;
h1=h2=h3=creat(m);
/*
while(p1!=NULL)
{
cout<<p1->x;
p1=p1->next;
}
while(h1!=NULL)
{
cout<<h1->x;
h1=h1->next;
}
p1=p2=p3;
h1=h2=h3;*/
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
	if(p1->x==p2->x)
	{
	p2->gg=true;
	(p1->num)++;
	}
	p2=p2->next;
}
	p1=p1->next;
}
/////////////////////////
while(h1!=NULL)
{
	if(h1->gg==true)
	{
	h1=h1->next;
	continue;
	}
	h2=h1->next;
	while(h2!=NULL)
	{
	if(h1->x==h2->x)
	{
	h2->gg=true;
	(h1->num)++;
	}
	h2=h2->next;
}
	h1=h1->next;
}
//////////////
////////////////////////////////////////////
/*p1=p2=p3;
h1=h2=h3;
while(p1!=NULL)
{
if(p1->gg==true)
{
p1=p1->next;
continue;
}
cout<<p1->x<<" "<<p1->num<<endl;
p1=p1->next;
}
///////////
while(h1!=NULL)
{
if(h1->gg==true)
{
h1=h1->next;
continue;
}
cout<<h1->x<<" "<<h1->num<<endl;
h1=h1->next;
}*/
////////////////////////////////////////////
p1=p2=p3;
h1=h2=h3;
while(p1!=NULL)
{
if(p1->gg==true)
{
p1=p1->next;
continue;
}
h1=h3;
while(h1!=NULL)
{
if(h1->gg==true)
{
if(h1->next==NULL&&p1->x!=h1->x){t=t+p1->num;}
h1=h1->next;
continue;
}
if(p1->x==h1->x)
{
	h1->tt=true;
if(p1->num>=h1->num){t=t+p1->num;}
if(p1->num<h1->num){t=t+h1->num;}
break;
}
if(h1->next==NULL&&p1->x!=h1->x){t=t+p1->num;}
h1=h1->next;
}
p1=p1->next;
////////
}
/////////////////
h1=h3;
while(h1!=NULL)
{
if(h1->gg==false&&h1->tt==false){t=t+h1->num;}
h1=h1->next;
}
cout<<t<<endl;
////////////
}