#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdbool.h>
#include <string.h>

void save_us_joel() {
    // Save us Joel from the zombies!
    struct sigaction sa;
    memset(&sa, 0, sizeof(sigaction));
    sa.sa_handler = SIG_DFL;
    sa.sa_flags = SA_NOCLDWAIT;

    sigaction(SIGCHLD, &sa, NULL);
}

int main(int argc, char **argv) {
    save_us_joel();
    while (1) {
        pid_t pid = fork();
        if (pid == 0) {
            printf("here's looking at you kid: (%d)\n", pid);
            exit(EXIT_SUCCESS); // does the child process live on? (as a zombie?)
        }
        sleep(1);
    }
    return 0; // for now this line is unreachable due to the infinite loop
}
