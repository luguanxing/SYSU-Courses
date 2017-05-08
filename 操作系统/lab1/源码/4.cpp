#include <stdio.h>  
#include <sys/types.h>  
#include <unistd.h>  
int main(void)  
{  
   int i, a=0;  
   pid_t pid[2];
   for(i=0; i<2; i++){ 
   if((pid[i]=fork()))a=1;
      printf("X");  
   }  
   if(pid[0]==0)printf("%d\n",a);
   if(pid[1]==0)printf("%d\n",a);
   return 0;  
}  


