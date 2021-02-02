 #include<iostream>
using namespace std;
typedef struct element *link;
typedef struct element
{
long x;
long num;
bool gg;
link next;
}elem;
struct element *creat(long n)
{
link q1,q2,head;
int t=0;
q2=q1=(link) malloc(sizeof(struct element));
cin>>q1->x;
q1->gg=false;
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
q1= (link) malloc(sizeof(struct element));
cin>>q1->x;
q1->gg=false;
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
/////////////////////////////////////////////
void main()
{
int n;
cin>>n;
link p1,p2,p3;
p2=p1=p3=creat(n);
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
////////////////////
/*
p1=p2=p3;   
while(p1!=NULL)  
{  
if(p1->gg==true)  
{  
p1=p1->next;  
continue;  
}  
cout<<p1->x<<" "<<p1->num<<endl;  
p1=p1->next;  
} */ 
////////////////////
p1=p3;
while(p1!=NULL)
{
if(p1->gg==true)
{
	if(p1->gg==true&&p1->next==NULL){cout<<"0"<<endl;break;}//出现类似于1 1 1 2 2 2这种数据时候，有这句才有输出
p1=p1->next;
continue;
}
if(p1->num>(n/2)){cout<<p1->x<<endl;break;}
if(p1->next==NULL&&p1->num<=(n/2)){cout<<"0"<<endl;break;}

p1=p1->next;
}
/*
p1=p3;
while(p3!=NULL)
{
	printf("%d",p3->x);
	p3=p3->next;
}*/
}