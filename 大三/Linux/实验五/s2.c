//=========预编译部分==========
#include <gtk/gtk.h>
#include <time.h>
#include "2-4semshm-.h"
#define SHM_ID_1 58
#define SHM_ID_2 57
#define SEM_ID_1 39
#define SEM_ID_2 38
#define LOG_FILE_NAME "log2"

//=========全局变量/结构体==========
char g_write_str[SHM_SIZE];

typedef struct _data
{
	int Rsemid;
	int Wsemid;
	int Rshmid;
	int Wshmid;
}DATA,*PDATA;

typedef struct _arg 
{
	int semid,shmid;
	char* shmaddr;
	GtkWidget* text_view;
	GtkTextBuffer* pbuf;
}ARG,*PARG;


typedef struct _look_arg
{
	
	GtkWidget* window;
	GtkTextBuffer* p_log_buf;
	GtkWidget* log_text_view;
}LOOK_ARG,*P_LOOK_ARG;
//=========函数==========
char* GetCurTime(void)
{//获取系统当前时间
	time_t Now;
	struct tm *LocalTime,*gm;
	static char szTime[34];
	Now =  time(NULL);
	LocalTime = localtime(&Now);
	snprintf(szTime,sizeof(szTime),
			"----- %04d-%02d-%02d %02d:%02d:%02d -----\r\n\0",
			LocalTime->tm_year+1900,
			LocalTime->tm_mon+1,
			LocalTime->tm_mday,
			LocalTime->tm_hour,
			LocalTime->tm_min,
			LocalTime->tm_sec);
	return szTime;
}

void WriteLog(void* shmaddr,int len)
{//将聊天记录写入文件
	FILE* fp;
	fp = fopen(LOG_FILE_NAME,"a+");
	if(fp == NULL)
			{
				printf("Can't open file .\n");
				exit(-1);
			}
	fwrite(shmaddr,len,1,fp);
	fclose(fp);
}
char* ReadLog(void)
{//从文件中读取聊天记录
	FILE* fp;
	int size;
	static char* szLog = NULL;
	fp = fopen(LOG_FILE_NAME,"r");
	if(fp == NULL)
			{
				printf("Can't open file .\n");
				exit(-1);
			}
	fseek(fp,0,SEEK_END);
	size = ftell(fp);
	fseek(fp,0,SEEK_SET);
	szLog = malloc(size);
	fread(szLog,size,1,fp);
	fclose(fp);
	return szLog;
}
//============读线程函数==================
void* ReadThreadFunc(void* arg)
{
    PARG pArg = (PARG)arg; 
    int semid, shmid;
    char* shmaddr = NULL;
    char *ret = NULL;
    char szRead[SHM_SIZE];
	shmid = pArg->shmid;
    semid = pArg->semid;
    shmaddr = pArg->shmaddr;
	GtkTextBuffer* pbuf = pArg->pbuf;
	GtkTextIter start,end;
	int len,i;
	while(1)
	{
	wait_sem(semid,0);
	if(sem_p(semid,0) == -1) break;
	len = strlen(shmaddr);
	if(len != 0)
	{
		WriteLog(shmaddr,len);
		gtk_text_buffer_get_bounds(GTK_TEXT_BUFFER(pbuf),&(start),&(end));	
		gtk_text_buffer_insert(GTK_TEXT_BUFFER(pbuf),&(end),shmaddr,len);
	
		for(i = 0;i<=len;i++)
		strcpy(shmaddr+i,"\0");
	}
	sem_v(semid,0);
	}
}
//============写线程函数==================
void* WriteThreadFunc(void* arg)
{
    PARG pArg = (PARG)arg; 
    int semid, shmid;
    char* shmaddr = NULL;
    char *ret = NULL;
    shmid = pArg->shmid;
    semid = pArg->semid;
    shmaddr = pArg->shmaddr;
	int len,i;
	const char* time = NULL;
   while(1)
    {
        wait_sem(semid, 0);
       if( sem_p(semid, 0) == -1);  
		len = strlen(g_write_str);
        if(len != 0)
		{
			time = GetCurTime();	
			g_write_str[len] = '\n';
			strcpy(shmaddr, time);
			strcat(shmaddr,g_write_str);
			for(i = 0;i<=len;i++)
			strcpy(g_write_str+i,"\0");
		}
        sem_v(semid, 0);         
    }
}


void on_send_clicked (GtkButton* button,gpointer send_arg)
{//用户点击发送时候的回调函数
	GtkWidget* write_text = send_arg;
	gchar* szMessage;
	szMessage = gtk_editable_get_chars(GTK_EDITABLE(write_text),0,-1);
	gint count = strlen(szMessage);
	sprintf(g_write_str,"%s",szMessage);
	g_free(szMessage);
	gtk_text_backward_delete(write_text,count);
		
}



void on_look_clicked (GtkButton* button,gpointer look_arg)
{//用户点击查看日志按钮的回调函数
	char* szLog = NULL;
	P_LOOK_ARG p_look_arg = look_arg;	
	GtkTextIter start,end;
	gtk_text_buffer_get_bounds(GTK_TEXT_BUFFER(p_look_arg->p_log_buf),&(start),&(end));
	gtk_text_buffer_delete(GTK_TEXT_BUFFER(p_look_arg->p_log_buf),&start,&end);
	szLog = ReadLog();
	gtk_text_buffer_insert(GTK_TEXT_BUFFER(p_look_arg->p_log_buf),&(end),szLog,strlen(szLog));
	free(szLog);
	gtk_widget_set_size_request(p_look_arg->window,600,400);
	gtk_widget_set_size_request(p_look_arg->log_text_view,300,400);

}


void on_cancel_clicked (GtkButton* button,gpointer look_arg)
{
	P_LOOK_ARG p_look_arg = look_arg;
	GtkTextIter start,end;
	gtk_text_buffer_get_bounds(GTK_TEXT_BUFFER(p_look_arg->p_log_buf),&(start),&(end));
	gtk_text_buffer_delete(GTK_TEXT_BUFFER(p_look_arg->p_log_buf),&start,&end);
	gtk_widget_set_size_request(p_look_arg->log_text_view,0,0);
	gtk_widget_set_size_request(p_look_arg->window,300,400);
}


void on_delete_event (GtkWidget* widget,GdkEvent* event,gpointer data)
{
	PDATA pData = data;
	
	sem_delete(pData->Rsemid);
	sem_delete(pData->Wsemid);
    deleteshm(pData->Rshmid);   
    deleteshm(pData->Wshmid);

	gtk_main_quit();
}


int main (int argc,char* argv[])
{
	
	ARG argWrite,argRead;
    pthread_t tid;
	GtkWidget* window = NULL;
	GtkWidget* vbox = NULL;
	GtkWidget* hbox = NULL;
	GtkWidget* sub_hbox = NULL;
	GtkWidget* button = NULL;
	GtkWidget* entry = NULL;
	GtkWidget* text_view = NULL;
	GtkWidget* write_text = NULL;
	GtkWidget* log_text_view = NULL;
	GtkTextBuffer* p_chat_buf = NULL;
	GtkTextBuffer* p_write_buf = NULL;
	GtkTextBuffer* p_log_buf = NULL;
	GdkColor color;
	gchar* title = "Chat Box";
	GtkTextIter start,end;
	LOOK_ARG look_arg;
	DATA data;
	
	//====================创建/打开共享内存和信号量================
    if((argRead.shmid = creatshm(".",SHM_ID_1,SHM_SIZE)) == -1)
	return -1;
    if((argWrite.shmid = creatshm(".", SHM_ID_2, SHM_SIZE)) == -1) 
        return -1;
    if((argRead.shmaddr = shmat(argRead.shmid, (char*)0, 0)) == (char *)-1)
    {
        perror("attch shared memory error!\n");
        exit(1);
    }
    
    if((argWrite.shmaddr = shmat(argWrite.shmid, (char*)0, 0)) == (char *)-1)
    {
        perror("attch shared memory error!\n");
        exit(1);
    }   
    if((argWrite.semid = creatsem("./", SEM_ID_1, 1, 1)) == -1)
        return -1;
    if((argRead.semid = creatsem("./",SEM_ID_2,1,1))==-1)
	return -1;
    //============================================================

	data.Rshmid = argRead.shmid;
	data.Wshmid = argWrite.shmid;
	data.Rsemid = argRead.semid;
	data.Wsemid = argWrite.semid;

	gtk_init(&argc,&argv);
	window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
	g_signal_connect(G_OBJECT(window),"delete_event",
				G_CALLBACK(on_delete_event),&data);
	gtk_window_set_title(GTK_WINDOW(window),title);
	gdk_color_parse("FFFFFF",&color);
	gtk_widget_modify_bg(window,GTK_STATE_NORMAL,&color);
	gtk_window_set_position(GTK_WINDOW(window),GTK_WIN_POS_CENTER);
	gtk_window_set_default_size(GTK_WINDOW(window),600,400);
	gtk_container_set_border_width(GTK_CONTAINER(window),5);
	
	hbox = gtk_hbox_new(FALSE,5);
	gtk_container_add(GTK_CONTAINER(window),hbox);
	
	vbox = gtk_vbox_new(FALSE,0);
	gtk_container_add(GTK_CONTAINER(hbox),vbox);

	
	text_view = gtk_text_view_new();
	gtk_widget_set_size_request(text_view,300,250);
	gtk_text_view_set_wrap_mode(GTK_TEXT_VIEW(text_view),GTK_WRAP_WORD);

	 gtk_text_view_set_justification(GTK_TEXT_VIEW(text_view),GTK_JUSTIFY_LEFT);
	 gtk_text_view_set_editable(GTK_TEXT_VIEW(text_view),FALSE);
	 gtk_text_view_set_cursor_visible(GTK_TEXT_VIEW(text_view),TRUE);
	 gtk_text_view_set_left_margin(GTK_TEXT_VIEW(text_view),10);
	 gtk_text_view_set_right_margin(GTK_TEXT_VIEW(text_view),10);
	 p_chat_buf = gtk_text_view_get_buffer(GTK_TEXT_VIEW(text_view));
	argRead.pbuf = p_chat_buf;

	gtk_box_pack_start(GTK_BOX(vbox),text_view,FALSE,FALSE,5);
	

//=======================================================
	write_text = gtk_text_new(NULL,NULL);
	gtk_widget_set_size_request(write_text,300,70);
	gtk_text_set_editable(write_text,TRUE);
	 gtk_box_pack_start(GTK_BOX(vbox),write_text,FALSE,FALSE,5);
//========================================================
	
	button = gtk_button_new_with_label("Sent It");
	gtk_box_pack_start(GTK_BOX(vbox),button,TRUE,TRUE,3);
	g_signal_connect(G_OBJECT(button),"clicked",
			G_CALLBACK(on_send_clicked),write_text);
//	=====================================	
	log_text_view = gtk_text_view_new();
	gtk_widget_set_size_request(log_text_view,0,0);
	gtk_text_view_set_wrap_mode(GTK_TEXT_VIEW(log_text_view),GTK_WRAP_WORD);

	 gtk_text_view_set_justification(GTK_TEXT_VIEW(log_text_view),GTK_JUSTIFY_LEFT);
	 gtk_text_view_set_editable(GTK_TEXT_VIEW(log_text_view),FALSE);
	 gtk_text_view_set_cursor_visible(GTK_TEXT_VIEW(log_text_view),TRUE);
	 gtk_text_view_set_left_margin(GTK_TEXT_VIEW(log_text_view),10);
	 gtk_text_view_set_right_margin(GTK_TEXT_VIEW(log_text_view),10);
	 p_log_buf = gtk_text_view_get_buffer(GTK_TEXT_VIEW(log_text_view));
	 gtk_box_pack_start(GTK_BOX(hbox),log_text_view,FALSE,FALSE,0);
//=========================================================
	sub_hbox = gtk_hbox_new(FALSE,5);
	gtk_container_add(GTK_CONTAINER(vbox),sub_hbox);
	
	look_arg.window = window;
	look_arg.p_log_buf = p_log_buf;
	look_arg.log_text_view = log_text_view;
	button = gtk_button_new_with_label("Look Log");
	gtk_widget_set_size_request(button,130,30);
	gtk_box_pack_start(GTK_BOX(sub_hbox),button,FALSE,FALSE,3);

	g_signal_connect(G_OBJECT(button),"clicked",
			G_CALLBACK(on_look_clicked),&look_arg);
	
	button = gtk_button_new_from_stock(GTK_STOCK_CANCEL);
	gtk_widget_set_size_request(button,130,30);
	gtk_box_pack_start(GTK_BOX(sub_hbox),button,FALSE,FALSE,3);
	
	g_signal_connect(G_OBJECT(button),"clicked",
			G_CALLBACK(on_cancel_clicked),&look_arg);
	
//========== 创建写线程，读线程 ==============
    if(pthread_create(&tid,NULL,WriteThreadFunc,&argWrite)!=0)
	{
	printf("Create Thread Error !\n");
	exit(1);
	}	
    if(pthread_create(&tid,NULL,ReadThreadFunc,&argRead)!=0)
	{
	printf("Create Thread Error !\n");
	exit(1);
	}
//==========================================

	gtk_widget_show_all(window);
	gtk_main();
	return FALSE;
}

