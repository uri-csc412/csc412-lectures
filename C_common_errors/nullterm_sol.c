#include <stdio.h>
#include <string.h>

int main() {
    // buffer of size 15, hmmm that looks big
    char buffer[15];
    char mystr[] = "hello world";

    // copy strings
    strncpy(buffer, mystr, sizeof(buffer) - 1);
    buffer[sizeof(buffer) - 1] = '\0'; // safely null-terminate

    printf("buffer: %s\n", mystr);

    return 0;
}

