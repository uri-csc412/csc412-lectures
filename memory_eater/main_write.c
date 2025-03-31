#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ONEGB (1 << 30)
#define N 10000L

int main() {
    int count = 0;
    int *blocks[N];

    for (int i = 0; i < N; i++) {
        blocks[i] = malloc(ONEGB);
        if (blocks[i] == NULL) {
            printf("done at %i\n",i);
            return 0;
        }
    }
    // we allocated N blocks, now let's write to them
    for (int i = 0; i < N; i++) {
        memset(blocks[i],2,ONEGB);
        printf("We wrote to %i GB of memory\n", i);
    }
}