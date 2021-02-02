#include <stdio.h>
#include<malloc.h>
typedef struct node *link;
typedef struct node 
{int x,k;link next;}
Node;
struct node *creat(int n)
{
  int t=0;
 link q1,q2,head;
 q1=q2=(link)malloc(sizeof(Node));
 scanf("%d",&q1->x);
 q1->k=t;
 q1->next=NULL;  
head=NULL;
 if(n==1)
	 head=q1;
 while(t<n-1)
 { t++;
if(t==1)head=q1;
else q2->next=q1;
q2=q1;  
q1=(link)malloc(sizeof(Node));
 scanf("%d",&q1->x); 
 q1->next=NULL;  
 q1->k=t;
  if(t==n-1){q2->next=q1;} 
 }
 return(head);
}

void main()
{
int n;
scanf("%d",&n);
link p,g,q;
p=g=creat(n);
/*
while(p!=NULL)
{
	printf("%d %d\n",p->x,p->k);
	p=p->next;
}
p=g;*/
while(p!=NULL)
{
q=p->next;
if(q==NULL)
	 printf("-1 ");
while(q!=NULL)
{
 if(q->next==NULL&&q->x<p->x)
	 	 printf("-1 ");
	if(q->x>=p->x)
 {
  printf("%d ",q->k);break;
 }
 q=q->next;
}
p=p->next; 
}
printf("\n");
}
