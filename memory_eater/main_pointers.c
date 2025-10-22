#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ONEGB (1 << 30)

int main() {
    int count = 0;

    while (1) {
        int *p = malloc(ONEGB);
        if(p == NULL) {
            printf("malloc gave up after %d GB\n", count);
            return 0;
        }
        memset(p,1,ONEGB); // set all bytes in block to be one (this will write mem)
        printf("we allocated %d GB of memory\n", count++);
    }
}
