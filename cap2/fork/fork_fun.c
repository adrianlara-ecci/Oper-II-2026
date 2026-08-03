#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main() {
    pid_t pid = fork();

    if (pid == 0) {
        // Child
        printf("👶 Child: My PID is %d, my parent is %d\n", getpid(), getppid());
        for (int i = 0; i < 3; i++) {
            printf("👶 Child says hi %d\n", i);
            sleep(1);
        }
    } else {
        // Parent
        printf("👨‍🦱 Parent: My PID is %d, I created child %d\n", getpid(), pid);
        for (int i = 0; i < 3; i++) {
            printf("👨‍🦱 Parent working %d\n", i);
            sleep(1);
        }
    }

    return 0;
}
