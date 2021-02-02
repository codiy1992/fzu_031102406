#include<stdio.h>     
void main()     
{     
    char c[5005];     
    int i,l=0,t=0;     
    scanf("%s",c);     
    for(i=0;c[i]!='\0';i++)     
    {     
      if(c[i]=='(')     
            l=l+1;     
        else if(c[i]==')')     
       {     
            l=l-1;     
            if(l<0)     
               l=0;     
      }     
       else if(c[i]=='G')     
       {     
            t=t+l;     
            l=0;     
        }     
    }     
    printf("%d\n",t);     
}     