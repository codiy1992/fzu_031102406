#include<iostream>
using namespace std;
typedef struct leaf *link;
typedef struct leaf
{
int ability;
link left;
link right;
link next;
}Leaf;
///////////先把所有叶子排成一列////////////
link creat_leaf_line (int n)
{
link q1,q2,head;
int t=0;
head=q2=q1=(link)malloc(sizeof(Leaf));
q1->ability=-1;
q1->next=q1->left=q1->right=NULL;
while(t<n)
{
if(t!=1)q2->next=q1;
t++;
q2=q1;
q1=(link)malloc(sizeof(Leaf));if(t==1)head->next=q1;
cin>>q1->ability;
q1->next=q1->left=q1->right=NULL;
if(t==n){q2->next=q1;}
}
return (head);
}
//////////用建好的这列叶子建成一颗树/////////
void build_tree(link head)
{//t始终指向第一个叶子结点,k开始时候指向t的下一个结点，往后每次循环都使k指向它的下一个结点，直到把叶子序列遍历一遍
link t,k,l,r;
t=head->next;
k=t->next;
while(k!=NULL)
{
	l=t->left; r=t->right;
if(k->ability<=t->ability)
{
	if(l==NULL){t->left=k;}
	while(l!=NULL)
	{
		if(k->ability<=l->ability)
		{
			if(l->left==NULL){l->left=k;break;}
			l=l->left;continue;
		}
		if(k->ability>l->ability)
		{
			if(l->right==NULL){l->right=k;break;}
			l=l->right;continue;
		}
	}
}
if(k->ability>t->ability)
{
	if(r==NULL){t->right=k;}
	while(r!=NULL)
	{
	if(k->ability<=r->ability)
	{
		if(r->left==NULL){r->left=k;break;}
		r=r->left;continue;
	}
	if(k->ability>r->ability)
	{
		if(r->right==NULL){r->right=k;break;}
		r=r->right;continue;
	}
	}
}
k=k->next;
}
}
//////////输出树//////////////
void print_tree(link h)
{
	link l;
if(h!=NULL)
{

	if(h->left!=NULL)
	{
		cout<<"<";
	    print_tree(h->left);
		cout<<">";
	}
		cout<<h->ability;
		if(h->right!=NULL)
		{
		cout<<"<";
		print_tree(h->right);
	    cout<<">";
		}
		}
}
//////////主函数//////////////
void main()
{
int n;
cin>>n;
link p1,p2;
p1=creat_leaf_line(n);
build_tree(p1);
print_tree(p1->next);
/*p2=p1->next;
while(p2!=NULL)
{
	if(p2->left!=NULL){cout<<p2->left->ability<<" ";}
	else cout<<"  ";
	cout<<p2->ability<<" ";
	if(p2->right!=NULL){cout<<p2->right->ability<<endl;}
	else cout<<endl;
p2=p2->next;
}*/
}