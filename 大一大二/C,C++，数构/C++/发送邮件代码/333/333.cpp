#include <stdio.h>
#include <winsock2.h>

#pragma comment(lib, "ws2_32.lib")

//Global Variables Declaration
const char* HostName = "Smtp.163.com"; //Mail Server
const char* MailData = "From: \"孤独剑客\"<wssbrl2@163.com>\r\n"
"To: \"孤独剑客\"<wssbrl2@163.com>\r\n"
"Date: Fri, 18 May 2012 23:35:27 +0800\r\n"
"Subject: Hello Wtf!This is a test mail, you don't reply it!\r\n.\r\n";

//User-Define Function Declaration
void Usage(void);                       //CopyRight

//Mail Function
int main(int argc, char *argv[])
{

    WSADATA wsa;
    struct hostent *pHostent = NULL;
    SOCKET server = INVALID_SOCKET;
    struct sockaddr_in ServerAddr;
    int ret = 0;
    char Buffer[1024] = {0};
    
    Usage();                                         //Print Copyright
    
    if (WSAStartup(MAKEWORD(2, 2), &wsa) != 0)       //Init Socket
    {
            printf("Init Socket Failure...\n");
            goto CleanUP;
    }
    
    server = socket(AF_INET, SOCK_STREAM, 0);        //Create Socket Handle
    if (server == INVALID_SOCKET)
    {
           printf("Create Socket Failure...\n");
           goto CleanUP;
    }
    
    pHostent = gethostbyname(HostName);              //Get Mail Server Name
    if (pHostent == NULL)
    {
          printf("The Host Name is Invalid...\n");
          goto CleanUP;
    }
    
    //Fill Sockaddr_in Structure
    ServerAddr.sin_family = AF_INET;
    memcpy(&ServerAddr.sin_addr.S_un.S_addr, pHostent->h_addr_list[0], pHostent->h_length);
    ServerAddr.sin_port = htons(25);
    
    //Connect to remote Mail Server
    ret = connect(server, (struct sockaddr*)&ServerAddr, sizeof(ServerAddr));
    if (ret == SOCKET_ERROR)
    {
            printf("Connect Mail Server Failed...\n");
            goto CleanUP;
    }
    
    printf("Connect to %s...\n", inet_ntoa(ServerAddr.sin_addr));
    
    //Recv Data From Mail Server
    ZeroMemory(Buffer, sizeof(Buffer));
    ret = recv(server, Buffer, sizeof(Buffer), 0);
    if (ret == SOCKET_ERROR)
    {
           printf("Receive Data From Mail Server Failure...\n");    
           goto CleanUP;     
    }
    else
    {
           // Buffer[ret] = '';
           // printf("%s\n", Buffer);
    }
    
    //Send "HELO Server\r\n" to Mail Server
    ret = send(server, "HELO Server\r\n", strlen("HELO Server\r\n"), 0);
    if (ret == SOCKET_ERROR)
    {
            printf("Send HELO to Mail Failure...\n");
            goto CleanUP;
    }
    else
    {
            printf("HELO Server\n");   
    } 
    
    //Recv Data From Mail Server
    ZeroMemory(Buffer, sizeof(Buffer));
    ret = recv(server, Buffer, sizeof(Buffer), 0);
    if (ret == SOCKET_ERROR)
    {
           printf("Receive Data From Mail Server Failure...\n");    
           goto CleanUP;     
    }
    else
    {
           // Buffer[ret] = '';
           // printf("%s\n", Buffer);
    }
    
    //Send "AUTH LOGIN\r\n" to Mail Server
    ret = send(server, "AUTH LOGIN\r\n", strlen("AUTH LOGIN\r\n"), 0);
    if (ret == SOCKET_ERROR)
    {
            printf("Send \"AUTH LOGIN\" to Mail Failure...\n");
            goto CleanUP;
    }
    else
    {
            printf("AUTH LOGIN\n");   
    }      

    //Recv Data From Mail Server
    ZeroMemory(Buffer, sizeof(Buffer));
    ret = recv(server, Buffer, sizeof(Buffer), 0);
    if (ret == SOCKET_ERROR)
    {
           printf("Receive Data From Mail Server Failure...\n");    
           goto CleanUP;     
    }
    else
    {
           // Buffer[ret] = '';
           // printf("%s\n", Buffer);
    }
    
    //Send UserName to Mail Server, The UserName is Encoded by Base64.
    ret = send(server, "eHl6LnN1bi5vaw==\r\n", strlen("eHl6LnN1bi5vaw==\r\n"), 0);
    if (ret == SOCKET_ERROR)
    {
            printf("Send UserName to Mail Failure...\n");
            goto CleanUP;
    }
    else
    {
            printf("UserName\n");   
    }      
        
    //Recv Data From Mail Server
    ZeroMemory(Buffer, sizeof(Buffer));
    ret = recv(server, Buffer, sizeof(Buffer), 0);
    if (ret == SOCKET_ERROR)
    {
           printf("Receive Data From Mail Server Failure...\n");    
           goto CleanUP;     
    }
    else
    {
          //  Buffer[ret] = '';
           // printf("%s\n", Buffer);
    }

    //Send Password to Mail Server, The Password is Encoded by Base64.
    ret = send(server, "TG9uZzIwNzAz\r\n", strlen("TG9uZzIwNzAz\r\n"), 0);
    if (ret == SOCKET_ERROR)
    {
            printf("Send Password to Mail Failure...\n");
            goto CleanUP;
    }
    else
    {
            printf("Password\n");   
    } 
    
    //Recv Data From Mail Server
    ZeroMemory(Buffer, sizeof(Buffer));
    ret = recv(server, Buffer, sizeof(Buffer), 0);
    if (ret == SOCKET_ERROR)
    {
           printf("Receive Data From Mail Server Failure...\n");    
           goto CleanUP;     
    }
    else
    {
          //  Buffer[ret] = '';
           // printf("%s\n", Buffer);
    }

    //Send "Mail From: " Fiele to Mail Server, Sender 's Mail Address
    ret = send(server, "MAIL FROM: <wssbrl2@163.com>\r\n", strlen("MAIL FROM: <wssbrl2@163.com>\r\n"), 0);
    if (ret == SOCKET_ERROR)
    {
            printf("Send \"Mail From: \" to Mail Failure...\n");
            goto CleanUP;
    }
    else
    {
            printf("MAIL FROM: <wssbrl2@163.com>\n");   
    } 
    
    //Recv Data From Mail Server
    ZeroMemory(Buffer, sizeof(Buffer));
    ret = recv(server, Buffer, sizeof(Buffer), 0);
    if (ret == SOCKET_ERROR)
    {
           printf("Receive Data From Mail Server Failure...\n");    
           goto CleanUP;     
    }
    else
    {
          //  Buffer[ret] = '';
          //  printf("%s\n", Buffer);
    }

    //Send "RCPT TO: " Fiele to Mail Server, Receiver 's Mail Address
    ret = send(server, "RCPT TO: <wssbrl2@163.com>\r\n", strlen("RCPT TO: <wssbrl2@163.com>\r\n"), 0);
    if (ret == SOCKET_ERROR)
    {
            printf("Send \"RCPT TO: \" to Mail Failure...\n");
            goto CleanUP;
    }
    else
    {
            printf("RCPT TO: <wssbrl2@163.com>\n");   
    } 
    
    //Recv Data From Mail Server
    ZeroMemory(Buffer, sizeof(Buffer));
    ret = recv(server, Buffer, sizeof(Buffer), 0);
    if (ret == SOCKET_ERROR)
    {
           printf("Receive Data From Mail Server Failure...\n");    
           goto CleanUP;     
    }
    else
    {
          //  Buffer[ret] = '';
          //  printf("%s\n", Buffer);
    }

    //Send "Data" Fiele to Mail Server,Start to Send mail
    ret = send(server, "Data\r\n", strlen("Data\r\n"), 0);
    if (ret == SOCKET_ERROR)
    {
            printf("Send \"Data\" Field to Mail Failure...\n");
            goto CleanUP;
    }
    else
    {
            printf("Data\n");   
    } 

    //Recv Data From Mail Server
    ZeroMemory(Buffer, sizeof(Buffer));
    ret = recv(server, Buffer, sizeof(Buffer), 0);
    if (ret == SOCKET_ERROR)
    {
           printf("Receive Data From Mail Server Failure...\n");    
           goto CleanUP;     
    }
    else
    {
         //   Buffer[ret] = '';
         //   printf("%s\n", Buffer);
    }

    //Send Mail Context to Mail Server
    ret = send(server, MailData, strlen(MailData), 0);
    if (ret == SOCKET_ERROR)
    {
            printf("Send Context Of Mail to Mail Failure...\n");
            goto CleanUP;
    }
    else
    {
            printf("%s\n", MailData);
    }
    //Recv Data From Mail Server
    ZeroMemory(Buffer, sizeof(Buffer));
    ret = recv(server, Buffer, sizeof(Buffer), 0);
    if (ret == SOCKET_ERROR)
    {
           printf("Receive Data From Mail Server Failure...\n");    
           goto CleanUP;     
    }
    else
    {
         //   Buffer[ret] = '';
          //  printf("%s\n", Buffer);
    }

    //Send "QUIT" Context to Mail Server
    ret = send(server, "QUIT\r\n", strlen("QUIT\r\n"), 0);
    if (ret == SOCKET_ERROR)
    {
            printf("Send \"Quit\" to Mail Failure...\n");
            goto CleanUP;
    }
    else
    {
            printf("Quit\n");   
    } 
   
    printf("Send Mail Successful!\n");
              
    CleanUP:
            if (server != INVALID_SOCKET)
            {
                       closesocket(server);   //Close Socket Handle
            }
            WSACleanup();                     //Cleanup Winsock
    
    
   return 0;
}
//End of Mail Function

//Usage Function Defination, Provider Some help to User
void Usage(void)
{
         printf("------------------------------------------------------------\n");
         printf("The Demo of Collects data by Sending mail\n");
         printf("Codz by xyzjanker\n");
         printf("------------------------------------------------------------\n");
         
         return;
}
//End of function Defination


 

//总结整个过程:

//建立sock-->连接邮件服务器==>发送helo打招呼==>发送auth login登陆请求==>发送账号的BASE64编码==>发送密码的BASE64编码==>发送发送人账号Mail From:==>发送接收者账号RCPT TO:==>发送邮件正文==>发送退出登陆

//1.其中除了发送退出登陆命令以外，发送其他的邮件服务器命令时，必须发送一条命令后，要接收从邮件服务器反馈回的信息.

//2.命令格式:每个(关键字+内容)均以/r/n结尾

//3.将MailData里的From改为另外一个邮箱，就可以达到欺骗别人!收件人将看到的发件人是MailData里的From字段为发送人,而收件人如果回复这封邮件的话，也是发送到你改的这个邮箱里。也就是达到完全欺骗了。
