/*���ļ�ָ��λ�õĶ�λ����*/
/*�����д��������ļ��Ǵ��ı��ļ�����ʹ�á�od -td1 -tc -Ad �ļ�������ʽ�鿴������ */
/*-td1ѡ���ʾ���ļ��е��ֽ���ʮ���Ƶ���ʽ�г�����ÿ��һ���ֽڡ�
-tcѡ���ʾ���ļ��е�ASCII�����ַ���ʽ�г�����
����������ߵ�һ�����ļ��еĵ�ַ��-Adѡ��Ҫ����ʮ������ʾ�ļ��еĵ�ַ��*/

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

struct stu
{
	char name[10];
	int age;	
};

main()
{
   struct stu mystu[3]={{"Jim",14},{"Jam",15},{"Lily",19}};
   struct stu mystuout;
   FILE *fp;
   extern int errno; 
   char file[]="record.txt";
   int i,j;
   long k;
   fpos_t pos1,pos2;
  
   fp=fopen(file,"w");
   if(fp==NULL)
   {
   	  printf("cant't open file %s.\n",file);
   	  printf("errno:%d\n",errno);
   	  printf("ERR  :%s\n",strerror(errno));
   	  return;
   	}
   	else
   	{
   		printf("%s was opened.\n",file);   		
	}
 
    i=fwrite(mystu,sizeof(struct stu),3,fp);//�������ļ�����Ϊ�������ļ����Ǵ��ı��ļ�.
    printf("%d students was written.\n",i);
    fclose(fp);

/*����Ϊ��ָ��Ҫ�������¼*/

   fp=fopen(file,"r");
   if(fp==NULL)
   {
   	  printf("cant't open file %s.\n",file);
   	  printf("errno:%d\n",errno);
   	  printf("ERR  :%s\n",strerror(errno));
   	  return;
   }


   k=ftell(fp);//ftell�����ɵõ���ǰ�ļ�ָ��λ��
   printf("��ǰָ��λ��Ϊ%ld .\n",k);

   fseek(fp,1*sizeof(struct stu),SEEK_SET);//���ļ���ʼ��SEEK_SET���ƶ�ָ����1���ṹ���ƫ����
   
   fgetpos(fp,&pos1);//����һ�ֵõ���ǰ�ļ�ָ��λ�õķ���
   printf("�ƶ�ָ���ĵ�ǰָ��λ��Ϊ%ld .\n",pos1);
  
   j=fread(&mystuout,sizeof(struct stu),1,fp);//���ļ����ж�1���ṹ��ĳ��ȵ�������mystuout
   printf("%d students was read.\n",j);
   printf("NAME:%s\tAGE:%d\n",mystuout.name,mystuout.age);

   k=ftell(fp);//�õ���ǰ�ļ�ָ��λ��
   printf("������¼��ĵ�ǰָ��λ��Ϊ%ld .\n",k);

   j=fread(&mystuout,sizeof(struct stu),1,fp);
   printf("%d students was read.\n",j);
   printf("NAME:%s\tAGE:%d\n",mystuout.name,mystuout.age);

   pos2.__pos=(long)(1*sizeof(struct stu));//�����ƶ���Ϊһ���ṹ��
   fsetpos(fp,&pos2);//����һ���ƶ��ļ�ָ��λ�õķ���
  
   k=ftell(fp);
   printf("�ٴ��ƶ�ָ���ĵ�ǰָ��λ��Ϊ%ld .\n",k);

   j=fread(&mystuout,sizeof(struct stu),1,fp);
   printf("%d students was read.\n",j);
   printf("NAME:%s\tAGE:%d\n",mystuout.name,mystuout.age);

   k=ftell(fp);
   printf("�ٴζ���¼��ĵ�ǰָ��λ��Ϊ%ld .\n",k);

   fclose(fp);

}

