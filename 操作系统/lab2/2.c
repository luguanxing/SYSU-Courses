#include <pthread.h>
#include <stdio.h>

int mat1[10][10];
int mat2[10][10];
int mat3[10][10];
int m;
int n;
int k;

void *runner(void *param);

int main() {
	printf(">>>>>>>>start<<<<<<<\n");
	printf("intput m, k, n\n");
	scanf("%d%d%d", &m, &k, &n);
	if (m<0 || m>10 || n<0 || n>10 || k<0 || k>10) {
		printf("invalid, m,k,n must in[0,10]\n");
		return -1;
	}

	int i,j;
	pthread_t tid[100];
	pthread_attr_t attr;
	printf("intput A[%d][%d]:\n", m, k);
	for (i = 0; i < m; i++)
		for (j = 0; j < k; j++)
			scanf("%d", &mat1[i][j]);
	printf("intput B[%d][%d]:\n", k, n);
	for (i = 0; i < k; i++)
		for (j = 0; j < n; j++)
			scanf("%d", &mat2[i][j]);

	for (i = 0; i < m; i++)
		for (j = 0; j < n; j++) {
			int *ports = (int*)malloc(sizeof(int)*2);
			ports[0] = i;
			ports[1] = j;
			pthread_attr_init(&attr);
			pthread_create(&tid[i*n+j],&attr,runner,ports);
	}
	for (i = 0; i < m*n; i++)
		pthread_join(tid[i],NULL);

	printf(">>>>>>>>finish<<<<<<<");
	printf("\nA[%d][%d]:\n", m, k);
	for (i = 0; i < m; i++) {
		for (j = 0; j < k; j++) {
			printf("%d ", mat1[i][j]);
		}
		printf("\n");
	}
	printf("\nB[%d][%d]:\n", k, n);
	for (i = 0; i < k; i++) {
		for (j = 0; j < n; j++) {
			printf("%d ", mat2[i][j]);
		}
		printf("\n");
	}
	printf("\nC[%d][%d]:\n", m, n);
	for (i = 0; i < m; i++) {
		for (j = 0; j < n; j++) {
			printf("%d ", mat3[i][j]);
		}
		printf("\n");
	}
	return 0;
}

void *runner(void *param) {
	int m, n, i, *ports = param;
	m = ports[0];
	n = ports[1];
	int sum = 0;
	for (i = 0; i < k; i++) {
		sum += mat1[m][i] * mat2[i][n];
	}
	mat3[m][n] = sum;
}
