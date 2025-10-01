#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>

/*
    putchar prints a single char to the screen
*/

void* func1() {
    for (size_t i = 0; i < 250; i++) {
        putchar('+');
    }
    return NULL;
}

void* func2() {
    for (size_t i = 0; i < 250; i++) {
        putchar('-');
    }
    return NULL;
}

int main() {
    pthread_t t1, t2;

    // create threads
    if (pthread_create(&t1, NULL, func1, NULL) != 0) {
        perror("pthread_create");
        exit(1);
    }
    if (pthread_create(&t2, NULL, func2, NULL) != 0) {
        perror("pthread_create");
        exit(1);
    }

    // wait for threads to finish
    // for fun, comment these out and run it
    //pthread_join(t1, NULL);
    //pthread_join(t2, NULL);

    putchar('\n'); // just a line break
    return 0;
}