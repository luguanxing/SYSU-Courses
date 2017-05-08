#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <signal.h>
#include <string>
#include<deque>
#include<iostream>
using namespace std;
#define MAX_LINE 80
deque<string> cmds;
deque<string>::iterator pos;
void setup(char inputBuffer[], char *args[],int *background)
{
    int length, /* 命令的字符数目 */
        i,      /* 循环变量 */
        start,  /* 命令的第一个字符位置 */
        ct;     /* 下一个参数存入args[]的位置 */
    
    ct = 0;
    
    /* 读入命令行字符，存入inputBuffer */
    length = read(STDIN_FILENO, inputBuffer, MAX_LINE);  

    start = -1;
    if (length == 0) exit(0);            /* 输入ctrl+d，结束shell程序 */
    if (length < 0){ 
        perror("error reading the command");
	exit(-1);           /* 出错时用错误码-1结束shell */
    }    
    for (i=0;i<length;i++) { /* 检查inputBuffer中的每一个字符 */
        switch (inputBuffer[i]){
	    case ' ':
	    case '\t' :               /* 字符为分割参数的空格或制表符(tab)'\t'*/
		if(start != -1){
                    args[ct] = &inputBuffer[start];    
		    ct++;
		}
                inputBuffer[i] = '\0'; /* 设置 C string 的结束符 */
		start = -1;
		break;

            case '\n':                 /* 命令行结束 */
		if (start != -1){
                    args[ct] = &inputBuffer[start];     
		    ct++;
		}
                inputBuffer[i] = '\0';
                args[ct] = NULL; /* 命令及参数结束 */
		break;

	    default :             /* 其他字符 */
		if (start == -1)
		    start = i;
                if (inputBuffer[i] == '&'){  
		    *background  = 1;          /*置命令在后台运行*/
                    inputBuffer[i] = '\0';
		}
	} 
     }    
     args[ct] = NULL; /* 命令字符数 > 80 */
} 




int main(void) {
	char inputBuffer[MAX_LINE];   
	int background;               
	char *args[MAX_LINE/2+1];
	signal(SIGINT, SIG_IGN);
	while (1) {   
		string cmd;
		background = 0;  
		printf("COMMAND->\n");  
		setup(inputBuffer,args,&background);
		cmd = args[0];
		if (cmds.size() >= 10) {
			cmds.pop_front();
		}
		cmds.push_back(cmd);
		pid_t pid;  
		pid = fork();  
		if (pid < 0) {
			fprintf(stderr, "Fork Failed");  
			exit(-1);  
		} else if (pid == 0) {
			cmd = args[0];
			if (cmd == "his") {
				for (pos = cmds.begin(); pos != cmds.end(); pos++)  
					cout << *pos << endl; 
			} else if (cmd[0] == 'r' && cmd[1] == ' ' && 'a' <= cmd[2] && cmd[2] <= 'z' && 'A' <= cmd[2] && cmd[2] <= 'Z') {
				for (pos = cmds.end()-1; pos != cmds.begin(); pos--) {
					string oldcmd = *pos;
					if (oldcmd[2] == oldcmd[1]) {
						cout << "rerun" << *pos << endl; 
					}
				}
			} else
				execvp(args[0], args);  
		}  
		else  
			if (background == 1)  
				wait();  
	}  
}  





