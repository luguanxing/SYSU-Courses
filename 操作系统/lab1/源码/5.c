#include <stdlib.h>  
#include <stdio.h>  
#include <sys/wait.h>  
#include <signal.h>  
#include <unistd.h>  
  
  
void waiting();  
void stop();  
void none();
static int wait_mark;  
  
  
int main(int argc, const char *argv[])  
{  
    int p1, p2;  
    int stdout;  
    while ((p1 = fork()) == -1);  
    if (p1 > 0)  
    {  
        while ((p2 = fork()) == -1);  
        if (p2 > 0)  
        {  
            wait_mark = 1;   
	    signal(SIGINT, SIG_IGN);
	    signal(SIGQUIT, SIG_IGN);	 
            waiting();  
            kill(p1, 16);  
            wait(0);  
            kill(p2, 17);  
            wait(0);  
            printf("Parent process is killed!\n");  
            exit(0);  
        }  
        else  
        {  
            wait_mark = 1;  
            signal(17, stop); 
	    signal(SIGINT, SIG_IGN);
	    signal(SIGQUIT, SIG_IGN);	 
            waiting();  
            lockf(stdout, 1, 0);  
            printf("Child process 2 is killed by parent!\n");  
            lockf(stdout, 0, 0);  
            exit(0);  
        }  
    }  
    else  
    {  
        wait_mark = 1;  
        signal(16, stop);
	    signal(SIGINT, SIG_IGN);
	    signal(SIGQUIT, SIG_IGN);
        waiting();  
        lockf(stdout, 1, 0);  
        printf("Child process 1 is killed by parent!\n");  
        lockf(stdout, 0, 0);  
        exit(0);  
    }  
    return 0;  
}  
  
  
void waiting()  
{  
    while (wait_mark != 0);  
}  
  
  
void stop()  
{  
    wait_mark = 0;  
}  

void none() {

}

