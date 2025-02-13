#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <signal.h>

int main() {
    while (1) {
        pid_t pid = fork();
        if (pid == 0) { // child process
            printf("Child process started: PID (%d)\n", getpid());
            sleep(1);   
            printf("Child process finished: PID (%d)\n", getpid());
            return 0;   // child process exits when done
        } else if (pid > 0) { // parent process
            printf("Parent process waiting for child to finish...\n");
            wait(NULL); 
            sleep(2);
            //kill(getpid(), SIGKILL);
        } else {
            perror("Fork failed");
            return 1;
        }
    }
    return 0; // for now this line is unreachable due to the infinite loop
}
