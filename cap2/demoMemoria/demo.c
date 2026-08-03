#include <stdio.h>
#include <unistd.h>   // sleep()
#include <stdint.h>   // uintptr_t

static int staticVar = 0;   // variable estática global

int main(void) {
    staticVar += 1;

    sleep(10);  // espera 10 segundos

    printf("Address: %p; Value: %d\n", (void*)&staticVar, staticVar);

    return 0;
}
