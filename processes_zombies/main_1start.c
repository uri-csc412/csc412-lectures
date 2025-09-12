#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdbool.h>
#include <string.h>
#include <signal.h>

int main(int argc, char **argv) {
    while (1) {
        pid_t pid = fork();
        if (pid == 0) {
            printf("here's looking at you kid: (%d)\n", getpid()); // child process ID
            exit(EXIT_SUCCESS); // does the child process live on? (as a zombie?)
            // if the parent does not handle SIGCHLD signal, 
            // then the child may become a zombie process
        }

        // the parent process just continues to fork children
        // we sleep for 1 second to give the child process time to exit
        sleep(1);
    }
    return 0; // for now this line is unreachable due to the infinite loop
}
