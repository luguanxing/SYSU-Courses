#include <pthread.h>
#include <stdio.h>

#define MAX 20
void *runner(void *param);


int main() {
	pthread_t tid;
	pthread_attr_t attr;
	int fib[MAX];
	int i, n;
	printf("MAIN:thread start\n");
	pthread_attr_init(&attr);
	pthread_create(&tid,&attr,runner,fib);
	pthread_join(tid,NULL);
	printf("MAIN:thread end\n");
	for (i = 0; i < MAX; i++)
		printf("fib[%d]=%d\n", i, fib[i]);
	return 0;
}

void *runner(void *param) {
	printf("THREAD:thread start\n");
	int i, *fib = param;
	fib[0] = 0;
	fib[1] = 1;
	for (i = 2; i < MAX; i++)
		fib[i] = fib[i-1]+fib[i-2];
	printf("THREAD:thread end\n");
}
