#include <stdlib.h>
#include <stdio.h>

int main(void){
	setreuid(geteuid(), geteuid());
	int choice;
	printf("Выберите опцию\n");
	printf("1. Системные процессы\n");
	printf("2. Сетевые интерфейсы\n");
	printf("3. Память\n");
	scanf("%d", &choice);
	if(choice == 1){
		system("ps");
	}else if(choice == 2){
		system("ps a");
	}else if(choice == 3){
		system("df -h");
	}
	return 0;
}
