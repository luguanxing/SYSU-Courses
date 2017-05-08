#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#define PERM S_IRUSR|S_IWUSR

#define MAX_SEQUENCE 10
typedef struct {
	long fib[MAX_SEQUENCE];
	int size;
} shared_data, *pshared_data;

shared_data sd;

void calculatefib() {
	sd.fib[0] = 1;
	sd.fib[1] = 1;
	int i;
	for (i = 2; i < MAX_SEQUENCE; i++)
		sd.fib[i] = sd.fib[i-1] + sd.fib[i-2];
	sd.size = MAX_SEQUENCE;
}

int main() {
    key_t shmid;
    char   *p_addr, *c_addr;
    int i;
    pid_t pid;
    if( (shmid = shmget(IPC_PRIVATE, 66666, PERM)) == -1 ) {
        fprintf(stderr, "Create Share Memory Error:%s\n\a", strerror(errno));
        exit(1);
    }
    pid = fork();
    if(pid > 0) {
        p_addr = shmat(shmid, 0, 0);
        memset(p_addr, '\0', 1024);
        wait(NULL);

	printf("shared memo:");
	pshared_data psd = (pshared_data)p_addr;
	for (i = 0; i < MAX_SEQUENCE; i++)
		printf("%ld ", psd->fib[i]);
	printf("\nsize=%d ", psd->size);
	printf("parent over\n");
        exit(0);
    } else if (pid == 0){
        sleep(5);
        c_addr = shmat(shmid, 0, 0);
	
	calculatefib();
	printf("check data:\n");
	for (i = 0; i < MAX_SEQUENCE; i++)
		printf("%ld ", sd.fib[i]);
	printf("\n\n\n");

	pshared_data psd = (pshared_data)c_addr;
	psd->size = sd.size;
	for (i = 0; i < MAX_SEQUENCE; i++)
		psd->fib[i] = sd.fib[i];

	printf("son over\n");
        exit(0);
    }
}

