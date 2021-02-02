
/*运行时屏幕上交替出现子进程与父进程各打印出的一千条信息*/
/*注意观察出现的交替情况每次可能会不一样*/

int main()
{ 
	int i; 
	if ( fork() == 0 ) /*创建新的子进程,并判断是否是子进程*/
	{ 
		/* 子进程程序 */ 
		for ( i = 0; i < 1000; i ++ ) 
		printf("This is child process \n"); 
	} 
	else 
	{ 
		/* 父进程程序*/ 
		for ( i = 0; i < 1000; i ++ ) 
		printf("This is parent process  !\n"); 
	} 
} 
