#include <stdio.h>
#include <string.h>

int main() {
    // buffer of size 5
    char buffer[5];
    char mystr[] = "hello world";

    // copying two strings
    strcpy(buffer, mystr);

    // printing characters in buffer using the incorrect indices
    for (int i = 0; i < sizeof(buffer); i++) {
        printf("buffer[%d]: %c\n", i, buffer[i]);
    }

    return 0;
}
