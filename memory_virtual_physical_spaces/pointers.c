#include <stdio.h>
#include <unistd.h>

int n = 0;

int main() {
    for (size_t i = 0; i < 4; i++) {
        n++;
        printf("n=%d :: pointer = %p\n", n, &n);
        sleep(1);
    }

    return 0;
}