#include<iostream>
using namespace std;
struct g {
	int num;
	int count;
	int bo[500001];
	struct g *next;
};
void main()
{
	int N,Q,x,y,k=1,flag=0,sum=0,sum1=0;
	int s[2];
	struct g *head;
	struct g *p;
	struct g *q;
	scanf("%d%d",&N,&Q);
	for(int j=0;j<N;j++)
	{
		if(j==0)
		{
			head=p=q=new g;
			head->num=k++;
            head->count=1;
			for(int i=1;i<=N;i++)
				head->bo[i]=0;
			head->bo[p->num]=1;
			head->next=NULL;
		}
		else 
		{
			q=new g;
			q->num=k++;//cout<<q->num<<endl;
			q->count=1;
			for(int i=1;i<=N;i++)
				q->bo[i]=0;
			q->bo[q->num]=1;
			q->next=NULL;
			p->next=q;
			p=q;
		}
	}
	for(int repeat=0;repeat<Q;repeat++)
	{
		scanf("%d",&s[0]);
		if(s[0]==1)
		{
			scanf("%d%d",&x,&y);
			p=head;
			while(p!=NULL)
			{
				for(int i=1;i<=N;i++)
					if(p->bo[x]==1)
					{
						flag=1;
						break;
					}
				if(flag==1)
					break;
				p=p->next;
			}
			flag=0;
			q=head;
			while(q!=NULL)
			{
				for(int l=1;l<=N;l++)
					if(q->bo[y]==1)
					{
						flag=1;
						break; 
					}
				if(flag==1)
					break;
				q=q->next;
			}
			flag=0;
			if(p==q)
				printf("ERROR\n");
			else
			{	
				for(int m=1;m<=N;m++)
				if(p->bo[m]==1)
				{
					p->bo[m]=0;
					q->bo[m]=1;
					p->count--;
					q->count++;
				}
			}
		}
		if(s[0]==2)
		{
			p=head;
			scanf("%d",&x);
			while(p!=NULL)
			{
				for(int n=1;n<=N;n++)
					if(p->bo[x]==1)
					{
						printf("%d %d\n",p->num,p->count);
						sum1++;
	        			break;
					}
				if(sum1==1)
					break;
				p=p->next;
			}
		
		}
		sum1=0;
		
	}
}
