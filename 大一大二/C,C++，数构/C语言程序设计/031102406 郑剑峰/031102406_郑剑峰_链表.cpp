//ѧ�ţ�031102406  ֣���� ��������
#include <stdio.h>
#include <stdlib.h>
#define LEN sizeof(struct node)
typedef struct node
{
	int num;
	struct node *next;
}list;     //������ṹ��
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
list *create()     //��������ĺ���
{
	list *p,*q,*head;
	int n=0;
	printf("������һ���ǽ����У���0����\n");
	p=(list *)malloc(LEN);//ǿ������ת��
    scanf("%d",&p->num);
    n++;
    while(p->num!=0)     //��ֹ����Ϊ����0
	{
		if(1==n) head=p;
		else q->next=p;
		q=p;
		p=(list *)malloc(LEN);
		scanf("%d",&p->num);n++;
	}
	free(p);
	q->next=NULL;
	return head;      //����ͷָ��
}


list *turn(list *head)   //��������
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
list *reform(list *head1,list *head2)     //�ϲ�����
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