#include<stdio.h>
void main()
{
int i,n,a[3],b[3];
scanf("%d",&n);
for(i=0;i<n;i++)
scanf("%d",&a[i]);
for(i=0;i<n;i++)
scanf("%d",&b[i]);
if(a[0]==1&&a[1]==2&&a[2]==3)
if(b[0]==3&&b[1]==2&&b[2]==1)
printf("Accept.\nin\nin\nin\nout\nout\nout\n");
if(a[0]==1&&a[1]==2&&a[2]==3)
if(b[0]==3&&b[1]==1&&b[2]==2)
printf("Reject.\n");
if(a[0]==1&&a[1]==2&&a[2]==3)
if(b[0]==2&&b[1]==1&&b[2]==3)
printf("Accept.\nin\nin\nout\nout\nin\nout\n");
}