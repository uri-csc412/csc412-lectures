#include <stdio.h>
#include <unistd.h>
#include <signal.h> // required for kill() and signal constants like SIGKILL

int main() {
    int true = 1;
    while (true) {
        if (fork() == 0) {
            printf("child process started and finished: (%d)\n", getpid());
            return 0;
        } else {
            kill(getpid(), SIGKILL);
            printf("parent process will not go away...\n");
            sleep(5);
        }
    }
}