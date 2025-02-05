#include <stdio.h>
#include <string.h>

int main() {
    // buffer of size 15, hmmm that looks big
    char buffer[15];
    char mystr[] = "hello world";

    // the buffer has more data that what we are trying to copy
    strcpy(buffer, mystr);

    printf("buffer: %s\n", mystr);

    return 0;
}
