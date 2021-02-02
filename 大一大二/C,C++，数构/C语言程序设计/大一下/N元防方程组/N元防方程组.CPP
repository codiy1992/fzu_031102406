#include <stdio.h> //该程序只能输出有穷解其中一解
#include <stdlib.h>
# define MAX 15
void main()
 {
FILE * fp;
int i,j,col,row;
int flag; //是否有无穷解的标记
int N; //多少个未知数
double a[MAX][MAX]; //存放增广矩阵的数组
double result[MAX]; //存放解的数组
char filename[20] = "input.txt";
double max,temp; max=temp=0.0; //max作为主元
printf("请确认您在input.txt中输入的格式正确，如有疑问请阅读readme.txt。\n");
if( (fp=fopen(filename,"r")) == NULL ){
printf("cannot open the file,\n");
 exit(0);
}else {
 printf("open file successfully!\n");
}
fscanf(fp,"%d",&N);
printf("未知元的个数为: %d\n",N); //检测是否读入正确
while(! feof(fp) ){
 for(i=0;i<N;i++){
 for(j=0;j<=N;j++){
 fscanf(fp,"%lf",&a[i][j]);
 }
 }
}
if(i<N) { //方程不够则为无穷解
 printf("无穷解!\n"); exit(0); }
// 输出增广矩阵检查是否读入正确
printf("您输入的增广矩阵为：\n");
for(i=0;i<N;i++){
 for(j=0;j<=N;j++){
 printf("%.2f ",a[i][j]);
 }
 printf("\n");
} printf("\n");

fclose(fp); //从文件读入结束
for(row=0,col=0;col<N;col++,row++){
if(a[row][col] == 0){ //当该行首元素为0时进行列主元处理
 flag = 1; //
 for(j=row+1;j<N;j++){
 if(a[j][col] > max){ //当第一行为0时，选出列主元，如果失败则是无穷解，跳出
 max = a[j][col];
 for(i=0;i<=N;i++){ //交换两行
 temp = a[row][i];
 a[row][i] = a[j][i];
 a[j][i] = temp;
 flag = 0;
 }//两行交换结束
 break;
 } //End of if
 } //End of for
 if ((a[N-1][N-1] == 0) && (a[N-1][N] != 0)){
 printf("无解！\n");
 exit(0);
 }
 if(flag == 1){ //无穷解
 printf("无穷解！\n");
 exit(0); }
} // end of if
 if(a[row][col] != 1){//将第一行首数字设为1，同时该行元素除以相同倍数
 temp = a[row][col];
for(i=col;i<=N;i++){
a[row][i] /= temp;
 }
 }
 for(i=row+1;i<N;i++){ //处理成下三角为0
 temp = a[i][col];
 for(j=col;j<=N;j++){
 a[i][j] -= a[row][j]*temp; }
 }
//观察矩阵变化过程
 printf("变换\n");
 for(i=0;i<N;i++){
 for(j=0;j<=N;j++){
 printf("%.2f ",a[i][j]);
 }
 printf("\n");
} printf("\n");
} //End of FOR
for(i=N-1;i>=0;i--){ //处理解
result[i] = a[i][N];
 for(j=N-1;j>i;j--){
 result[i] = result[i] - result[j]*a[i][j];
 }
}
printf("可行解:\n");
for(i=0;i<N;i++){ //输出解
 printf("第%d个解：%.2f\n",i+1,result[i]);
}
}