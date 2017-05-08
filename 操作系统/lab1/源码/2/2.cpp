#include <unistd.h>  
#include <stdio.h>   
int main() {   
	pid_t fpid1, fpid2;
	fpid1=fork();
	fpid2=fork();   
	if (fpid1 < 0 || fpid2 < 0) {
		printf("error in fork!");   
	} else if (fpid1 != 0 && fpid2 != 0) {  
		printf("A!! i am the parent process, my process id is %d\n",getpid()); 
	} else if (fpid1 == 0 && fpid2 != 0) {  
		printf("B!! i am the 1st child, my process id is %d\n",getpid());   
	} else if (fpid1 != 0 && fpid2 == 0) {  
		printf("C!! i am the 2nd child, my process id is %d\n",getpid());   
	} else {  
		printf("None!! i am the 3rd child, my process id is %d\n",getpid()); 
	}
	return 0;  
} 

