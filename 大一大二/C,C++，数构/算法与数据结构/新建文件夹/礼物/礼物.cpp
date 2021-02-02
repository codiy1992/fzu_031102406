#include<iostream>
using namespace std;
int main()
{
  char c[5000];
  int t=0,m,n,q;
  for(m=0;m<5000;m++)
  {
     cin>>c[m];
  }
  for(n=0;n<5000;n++)
  {
    if(c[n]=='('&&c[n+1]!=')')
     t=t+1;
    else 
		for(q=1;;q++)
		{
			if(c[n]=='('&&c[n+1]==')'&&c[n+1+q]==')')
				t=t-1;
            if(c[n+1+q]!=')')
				break;
		}
  }
  cout<<t;
  return 0;
}