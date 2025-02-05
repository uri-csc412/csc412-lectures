#include <stdio.h>

int main() {
    printf("\nour new program :)\n\n");

    int y = 7;
    int *p = &y; // *p is a pointer

    printf("%p, %i\n",p,*p);

    *p = 14; // use the pointer to change the value ;)

    printf("%p, %i\n",p,*p);

    return 0;
}
