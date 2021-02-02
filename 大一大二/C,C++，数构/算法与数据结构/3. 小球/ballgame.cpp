#include<iostream>
#include<stack>
using namespace std;
int main()
{
  int n;
  cin>>n;
  int * a=new int[n];
  int * b=new int[n];
  int * in_or_out=new int[2*n];
  stack<int> s;
  int count=0;
  int count2=0;
  int z;
  for(int i=0;i<n;i++)
  cin>>a[i];
  for(int j=0;j<n;j++)
  cin>>b[j];
  
	 for(int k=0;k<2*n;k++)
  {
     if(k<n) 
     { s.push(a[k]);
	   in_or_out[count2++]=1;
	   //cout<<"in"<<endl;
	 }
	 if(!s.empty())
	 z=s.top();
	 while(z==b[count])
	 {
	  // cout<<"out"<<endl;
		 in_or_out[count2++]=2;
       count++;
	   s.pop();
	   if(!s.empty())
	   z=s.top();
	 }
	}
  
   if(count==n)
   {	 
	   cout<<"Accept"<<endl;
       for(int m=0;m<2*n;m++)
	   {
	     if(in_or_out[m]==1)
			 cout<<"in"<<endl;
         if(in_or_out[m]==2)
			 cout<<"out"<<endl;
	     // cout<<in_or_out[m]<<endl;
	   }
   
   }

   else cout<<"Reject"<<endl;
}
