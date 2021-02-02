#include <gtk/gtk.h>
#include "2-4semshm-.h"

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

void* ReadThreadFunc(void* arg)
{
    PARG pArg = (PARG)arg; 
    int semid, shmid;
    char* shmaddr = NULL;
    char *ret = NULL;
    shmid = pArg->shmid;
    semid = pArg->semid;
    shmaddr = pArg->shmaddr;
	GtkTextBuffer* pbuf = pArg->pbuf;
	GtkTextIter start,end;
	while(1)
	{
	wait_sem(semid,0);
	if(sem_p(semid,0) == -1) break;
	if(strlen(shmaddr) != 0)
	{
	gtk_text_buffer_get_bounds(GTK_TEXT_BUFFER(pbuf),&(start),&(end));
	gtk_text_buffer_insert(GTK_TEXT_BUFFER(pbuf),&(end),shmaddr,strlen(shmaddr));
	strcpy(shmaddr,"");
	}
	sem_v(semid,0);
//	usleep(100);
	}
}

void* WriteThreadFunc(void* arg)
{
    PARG pArg = (PARG)arg; 
    int semid, shmid;
    char* shmaddr = NULL;
    char *ret = NULL;
    shmid = pArg->shmid;
    semid = pArg->semid;
    shmaddr = pArg->shmaddr;
   while(1)
    {
        wait_sem(semid, 0);
       if( sem_p(semid, 0) == -1);  
		int len = strlen(g_write_str);
        if(len != 0)
		{
			g_write_str[len] = '\n';
			strcpy(shmaddr, g_write_str);
			strcpy(g_write_str,"");
		}
        sem_v(semid, 0);         
//		usleep(100); 
    }
}

void on_clicked (GtkButton* button,gpointer data)
{
	GtkWidget* entry = (GtkWidget *)data;
	const gchar* enText = NULL;
	enText = gtk_entry_get_text(GTK_ENTRY(entry));
	sprintf(g_write_str,"%s",enText);
	gtk_entry_set_text(GTK_ENTRY(entry),"");
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
	GtkWidget* button = NULL;
	GtkWidget* entry = NULL;
	GtkWidget* text_view = NULL;
	GtkTextBuffer* pbuf = NULL;
	gchar* title = "Chat Box";
	GtkTextIter start,end;
    DATA data;
	
	//======================================================
    if((argRead.shmid = creatshm(".",57,SHM_SIZE)) == -1)
	return -1;
    if((argWrite.shmid = creatshm(".", 58, SHM_SIZE)) == -1) 
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
    if((argWrite.semid = creatsem("./", 40, 1, 1)) == -1)
        return -1;
    if((argRead.semid = creatsem("./",39,1,1))==-1)
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
	gtk_window_set_position(GTK_WINDOW(window),GTK_WIN_POS_CENTER);
	gtk_window_set_default_size(GTK_WINDOW(window),200,280);
	gtk_container_set_border_width(GTK_CONTAINER(window),5);
	
	vbox = gtk_vbox_new(FALSE,0);
	gtk_container_add(GTK_CONTAINER(window),vbox);

	text_view = gtk_text_view_new();
	gtk_text_view_set_wrap_mode(GTK_TEXT_VIEW(text_view),GTK_WRAP_WORD);

	 gtk_text_view_set_justification(GTK_TEXT_VIEW(text_view),GTK_JUSTIFY_LEFT);/*控制文字显示方向的,对齐方式*/
	 gtk_text_view_set_editable(GTK_TEXT_VIEW(text_view),FALSE);/*允许text view内容修改*/
	 gtk_text_view_set_cursor_visible(GTK_TEXT_VIEW(text_view),TRUE);/*设置光标可见*/
	 gtk_text_view_set_pixels_above_lines(GTK_TEXT_VIEW(text_view),5);
	 gtk_text_view_set_pixels_below_lines(GTK_TEXT_VIEW(text_view),5);/*设置下行距*/
	 gtk_text_view_set_pixels_inside_wrap(GTK_TEXT_VIEW(text_view),5);/*设置词距*/
	 gtk_text_view_set_left_margin(GTK_TEXT_VIEW(text_view),10);/*设置左边距*/
	 gtk_text_view_set_right_margin(GTK_TEXT_VIEW(text_view),10);/*设置右边距*/
	pbuf = gtk_text_view_get_buffer(GTK_TEXT_VIEW(text_view));
	argRead.pbuf = pbuf;

	gtk_box_pack_start(GTK_BOX(vbox),text_view,FALSE,FALSE,5);
	
	
	entry = gtk_entry_new();
	gtk_widget_set_direction(entry,GTK_TEXT_DIR_LTR);
	gtk_box_pack_start(GTK_BOX(vbox),entry,FALSE,FALSE,5);
	
	
	button = gtk_button_new_with_label("Send It");
	gtk_box_pack_start(GTK_BOX(vbox),button,FALSE,FALSE,3);

	g_signal_connect(G_OBJECT(button),"clicked",
			G_CALLBACK(on_clicked),entry);
	
	
//======Create Read/Write Thread ===========
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

