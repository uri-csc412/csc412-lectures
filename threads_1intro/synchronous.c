#include <stdio.h>

/*
    putchar prints a single char to the screen
*/

void func1() {
    for (size_t i = 0; i < 250; i++) {
        putchar('+');
    }
}

void func2() {
    for (size_t i = 0; i < 250; i++) {
        putchar('-');
    }
}

int main() {
    func1();
    func2();

    putchar('\n');
    return 0;
}
