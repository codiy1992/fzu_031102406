#include<iostream>
using namespace std;
typedef struct leaf *link;
typedef struct leaf
{
int number;
int ability;
link next;
link left;
link right;
bool bo;
}Leaf;
///////////////////////////////
link creat_leaf_line(int n)
{
link q1,q2,head;   
int t=0;   
head=q2=q1=(link)malloc(sizeof(Leaf));
q1->number=-1; 
q1->ability=-1;   
q1->next=q1->left=q1->right=NULL;   
q1->bo=false;
while(t<n)   
{   
t++;   
if(t!=1)q2->next=q1;   
q2=q1;   
q1=(link)malloc(sizeof(Leaf));
q1->number=t-1;   
cin>>q1->ability;   
q1->next=q1->left=q1->right=NULL;   
q1->bo=false;
if(t==n){q2->next=q1;}   
}   
return (head);   
}
///////////×ó¶ù×ÓÓÒÐÖµÜ/////////////
void creat_tree(link head,int a,int b)
{
link h,l=NULL,r=NULL,t;
h=head->next;
while(h!=NULL)
{
	if(h->number==a){l=h;}
	if(h->number==b){r=h;}
	if(r!=NULL&&l!=NULL&&b==0){t=l;l=r;r=t;}
	if(l!=NULL&&r!=NULL){break;}
	h=h->next;
}
if(r->bo==true){t=l;l=r;r=t;}
r->bo=true;
if(l->left==NULL){l->left=r;return;}
l=l->left;
while(l!=NULL)
{
	if(l->right==NULL){l->right=r;break;}
	l=l->right;
}
}
/////////////////////////////////////////
int MIN,MAX;
void find_min(link l)
{
	if(l!=NULL)
	{
		if(l->ability<=MIN){MIN=l->ability;}
		  find_min(l->right);
          find_min(l->left);
	}
}
void find_max(link l)
{
	if(l!=NULL)
	{
		if(l->ability>=MAX){MAX=l->ability;}
		find_max(l->right);
		find_max(l->left);
	}
}

/////////Êä³öÊ÷/////////
void print(link head,int i)
{
link h,k,l,r;
h=head->next;
cout<<i<<":";
while(h!=NULL)
{
	if(h->number==i){MIN=MAX=h->ability;break;}
	h=h->next;
}
l=h->left;
if(l==NULL){cout<<h->ability<<" "<<h->ability<<endl;return;}
else{find_min(l);find_max(l);cout<<MIN<<" "<<MAX<<endl;}
}
////////////////////////
void main()
{
int i,n,a,b;
cin>>n;
link p1,p2;
p1=creat_leaf_line(n);
for(i=0;i<n-1;i++)
{
cin>>a>>b;
creat_tree(p1,a,b);
}
for(i=0;i<n;i++)
{
print(p1,i);
}
p2=p1->next;
while(p2!=NULL)  
{  
    if(p2->left!=NULL){cout<<p2->left->number<<" ";}  
    else cout<<"  ";  
    cout<<p2->number<<" ";  
    if(p2->right!=NULL){cout<<p2->right->number<<endl;}  
    else cout<<endl;  
p2=p2->next;
}
}

/*
10
16 20 11 17 19 12 14 13 21 28
0 3
2 0
6 0
1 3
3 9
7 9
2 4
6 5
6 8

//////////////////////////////////////////

10
16 20 11 17 19 12 14 13 21 28
7 9
9 3
3 1
2 4
5 6
8 5
2 0
0 6
3 0
*/