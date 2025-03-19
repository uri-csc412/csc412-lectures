#include <stdio.h>

// what is this address?
int globalVar = 6;

int main() {
    // what is this address?
    int localVar = 1;

    //printf("Address of globalVar: %p\n", (void*)&globalVar);
    printf("Address of globalVar: %p\n", (void*)&globalVar);
    printf("Address of localVar: %p\n", (void*)&localVar);

    return 0;
}