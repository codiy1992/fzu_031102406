/*#include <stdio.h>
int main(void)   
{
    int i, j, n, x;
    int repeat, ri;
    int a[10];

    scanf("%d", &repeat);
    for(ri = 1; ri <= repeat; ri++){
        scanf("%d", &n);
        for(i = 0; i < n; i++)
            scanf("%d", &a[i]);
        scanf("%d", &x);
/*---------
        for(i = 0; i < n + 1; i++)
            printf("%d ", a[i]);
        putchar('\n');   
    }*/
#include<iostream>
using namespace std;
int main(void)
{
int i,j,n,x;
int repeat,ri;
int a[10];
cin>>repeat;
for(ri=0;ri<=repeat;ri++)
{
cin>>n;
for(i=0;i<n;i++)
cin>>a[i];
cin>>x;
j=0;
for(i=0;i<n;i++)
if(a[i]<=x)
j++;
for(i=n;i>j;i--)
a[i]=a[i-1];
a[j]=x;
for(i=0;i<n+1;i++)
cout<<a[i]<<" ";
cout<<"\n";
}return(0);
}
