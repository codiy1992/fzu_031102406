                //N�ʺ�����
//ѧ�ţ�031102406        ������֣����         �༶��4��
//�˳������ڽ��16�ʺ����ڵ�N�ʺ������ĸ�������ⷨ
# include <stdio.h>
# include <math.h>
int n=0,q[16],sum=0;
void Queens(int,int);//��ÿ�е�ÿ�н���ɨ�裬�����ûʺ�
int Place(int,int);//�жϵ�ǰ�ܷ�Żʺ�ĺ���
void print(int);//���N�ʺ�����нⷨ

int main() 
{
	int n; 
	printf("������ʺ�������\n");
	scanf("%d",&n); 
	Queens(1,n); 
	printf("%d\n",sum);//���N�ʺ��ĸ���
	return 0; 
}
void Queens(int k,int n) 
{
	int i; 
	if(n<k) 
		print(n); 
	else
	{
		for(i=1;i<=n;i++) //ÿ�дӵ�һ�п�ʼɨ��
			if(Place(i,k)==1)//��Place�����жϵ�ǰλ���ܷŻʺ�
			{
				q[k]=i; //�ѵ�ǰλ�ñ��Ϊ�ѷ��ûʺ�
				Queens(k+1,n); //���Ž�����һ�еĻʺ����
			} 
	} 
} 
int Place(int i,int k) 
{
	int j=1; 
	while(j<k)
	{
		if((q[j]==i)||abs(q[j]-i)==abs(j-k)) //�ж�λ���Ƿ��ѱ�ռ��
			return 0; //���ܷŻʺ��򷵻�ֵΪ0
		j++; 
	} 
	return 1; //�ܷŻʺ��򷵻�ֵΪ1
} 
void print(int n) 
{
	int i; 
	for(i=1;i<=n;i++)
		printf("<%d,%d>\t",i,q[i]); //����ⷨ
	sum++;//ÿ���һ�ν⣬��ĸ�����һ
	printf("\n"); 
}