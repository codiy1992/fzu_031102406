
/*����ʱ��Ļ�Ͻ�������ӽ����븸���̸���ӡ����һǧ����Ϣ*/
/*ע��۲���ֵĽ������ÿ�ο��ܻ᲻һ��*/

int main()
{ 
	int i; 
	if ( fork() == 0 ) /*�����µ��ӽ���,���ж��Ƿ����ӽ���*/
	{ 
		/* �ӽ��̳��� */ 
		for ( i = 0; i < 1000; i ++ ) 
		printf("This is child process \n"); 
	} 
	else 
	{ 
		/* �����̳���*/ 
		for ( i = 0; i < 1000; i ++ ) 
		printf("This is parent process  !\n"); 
	} 
} 
