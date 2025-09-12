#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdbool.h>
#include <string.h>
#include <signal.h>

void save_us_joel() {
    // save us Joel from the zombies!
    struct sigaction sa;
}

int main(int argc, char **argv) {
    save_us_joel(); // this function can use signals to save us!
    while (1) {
        pid_t pid = fork();
        if (pid == 0) {
            printf("here's looking at you kid: (%d)\n", getpid());
            exit(EXIT_SUCCESS); // does the child process live on? (as a zombie?)
        }
        sleep(1);
    }
    return 0; // for now this line is unreachable due to the infinite loop
}
