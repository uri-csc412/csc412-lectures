#include <stdio.h>
#include <string.h>

int main() {
    // buffer of size 5
    char buffer[5];
    char mystr[] = "hello world";

    // use strncpy from string.h to copy data safely
    strncpy(buffer, mystr, sizeof(buffer) - 1);
    buffer[sizeof(buffer) - 1] = '\0'; // safely null-terminate

    printf("buffer: %s\n", buffer);

    return 0;
}
