#include <stdio.h>

int main() {
    int myval = 5;     // create an integer variable with a value we can use
    int *ptr = &myval; // initialize the pointer with the address of 'value'

    // attempt to dereference the uninitialized pointer
    printf("value at uninitialized pointer: %d\n", *ptr);

    return 0;
}
