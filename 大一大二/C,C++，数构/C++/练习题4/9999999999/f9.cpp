#include<iostream.h>
class array
{
public:
	array();
	friend istream & operator >>(istream &,array &);
	friend ostream & operator <<(ostream &,array &);
private:	int a[2][3];
};
array::array()
{
	for(int i=0;i<2;i++)
		for(int j=0;j<3;j++)
			a[i][j]=0;
}
istream& operator >> (istream & input,array &b)
{
	for(int i=0;i<2;i++)
		for(int j=0;i<3;j++)
		input>>b.a[i][j];
	return input;
}
ostream& operator << (ostream &output,array & c)
{
	for(int i=0;i<2;i++)
		for(int j=0;j<3;j++)
		output<<c.a[i][j];
	return output;
}
void main()
{
	array a;
	cin>>a;
	cout<<"asffasfasf";
	cout<<a;
	cout<<endl;
}
