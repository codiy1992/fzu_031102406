//学号：031102406  郑剑峰 链表排序
#include <stdio.h>
#include <stdlib.h>
#define LEN sizeof(struct node)
typedef struct node
{
	int num;
	struct node *next;
}list;     //链表结点结构体
void main()
{
	list *create();
    list *turn(list *);
    list *reform(list *,list *);
    list *head1,*head2,*head;
    head1=create();
    head2=create();

	head=reform(turn(head1),turn(head2));
	while(head)
	{
		printf("%d ",head->num);
		head=head->next;
	}
}
list *create()     //建立链表的函数
{
	list *p,*q,*head;
	int n=0;
	printf("请输入一个非降序列，以0结束\n");
	p=(list *)malloc(LEN);//强制类型转换
    scanf("%d",&p->num);
    n++;
    while(p->num!=0)     //终止条件为输入0
	{
		if(1==n) head=p;
		else q->next=p;
		q=p;
		p=(list *)malloc(LEN);
		scanf("%d",&p->num);n++;
	}
	free(p);
	q->next=NULL;
	return head;      //返回头指针
}


list *turn(list *head)   //链表逆序
{
	list *p,*q,*t;
	p=head;
	q=p->next;
	if(q)
		t=q->next;
	p->next=NULL;
	while(q)
	{
		q->next=p;
		p=q;
		q=t;
		if(t)
			t=t->next;
	}
	return p;
}
list *reform(list *head1,list *head2)     //合并函数
{
	list *head,*p,*q,*p1,*p2;
	int n=0;
	for(p1=head1,p2=head2;p1!=NULL&&p2!=NULL;)
	{
		p=(list *)malloc(LEN);n++;
		if(1==n) head=p;
		else q->next=p;
		if(p1->num>=p2->num) p->num=p1->num,p1=p1->next;
		else 
			p->num=p2->num,p2=p2->next;
		q=p;
	}
	if(NULL==p1) q->next=p2;
	else q->next=p1;
	return head;
}