#include <stdio.h>
#include <string.h>

int main() {
    // buffer of size 5, is that enough?
    char buffer[5];
    char mystr[] = "hello world";

    // trying to copy more data than the buffer can hold
    strcpy(buffer, mystr);

    printf("buffer: %s\n", buffer);

    return 0;
}

