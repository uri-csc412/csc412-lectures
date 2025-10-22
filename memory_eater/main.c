#include <stdio.h>
#include <stdlib.h>

#define MEMTAKE (1 << 30)

int main() {
    int count = 0;

    while (1) {
        if(malloc(MEMTAKE) == NULL) {
            printf("malloc gave up after %d GB\n", count);
            return 0;
        }
        printf("we allocated %d GB of memory\n", count++);
    }
}
