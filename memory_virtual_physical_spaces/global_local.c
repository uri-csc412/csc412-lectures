#include <stdio.h>

// what is this address?
int globalVar21 = 10;
int globalVar22 = 10;
int globalVar1 = 110;
int globalVar2 = 11;

int main() {
    // what is this address?
    int localVar = 999;

    //printf("Address of globalVar: %p\n", (void*)&globalVar);
    printf("Address of globalVar: %p\n", (void*)&globalVar1);
    printf("Address of localVar: %p\n", (void*)&localVar);

    return 0;
}

// Address of globalVar: 0xaaaae7801010