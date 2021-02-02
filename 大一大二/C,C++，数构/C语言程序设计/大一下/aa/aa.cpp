#include <stdio.h>
int main()
{
    int n; //阶乘大小
    printf("请输入n的大小:");
    scanf("%d",&n); //从键盘接收阶乘大小
    int a[200]; //确保保存最终运算结果的数组足够大
    int carry; //进位
    int digit = 1; //位数
    a[0] = 1; //将结果先初始化为1
    int temp; //阶乘的任一元素与临时结果的某位的乘积结果
	
    for(int i = 2; i <= n; ++i) //开始阶乘，阶乘元素从2开始依次"登场"
    {
        //按最基本的乘法运算思想来考虑，将临时结果的每位与阶乘元素相乘
        for(int j = 1, carry = 0; j <= digit; ++j)
        {
			//相应阶乘中的一项与当前所得临时结果的某位相乘（加上进位）
            temp = a[j-1] * i + carry;
            a[j-1] = temp % 10; //更新临时结果的位上信息
            carry = temp / 10; //看是否有进位
        }
        while(carry) //如果有进位
        {
            a[++digit-1] = carry % 10; //新加一位，添加信息。位数增1
            carry /= 10; //看还能不能进位
        }
    }
    printf("结果是:\n%d ! = ",n); //显示结果
    for(i=digit; i>=1; --i)
    {
        printf("%d",a[i-1]);
    }
    return 0;
}
