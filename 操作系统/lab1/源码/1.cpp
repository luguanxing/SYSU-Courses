#include <unistd.h>  
#include <stdio.h> 
using namespace std;

int main(){
	pid_t pid1=0;
	pid1=fork();
	printf("**1** --processid:%d\n",getpid());
	int pid2=fork();
	printf("**2** --processid:%d\n",getpid());
	if(pid1 == 0){
		int pid3=fork();
		printf("**3** --processid:%d\n",getpid());
	} else {
		printf("**4** --processid:%d\n",getpid());
		printf("pid1=:%d\n",pid1);
	}
	return 0;
}

