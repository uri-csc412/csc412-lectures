#include <stdio.h>

int main() {
    // uninitialized pointer
    int *ptr; 

    // attempt to use the uninitialized pointer
    *ptr = 5; 

    // attempt to dereference the uninitialized pointer
    printf("value at uninitialized pointer: %d\n", *ptr);
    
    return 0;
}
