# ZOMBIE PROCESSES! :/

### START main_1start.c: create some zombies

1. run the main_start.c code.
2. Then run `ps aux` in another terminal, do you see the PIDs?

Simple Fix to reap the children?

```
wait(NULL);
```

That will not work if the child process never exits.


### REAP main_2reap.c: Let's do better with helper functions!

We can work with signals to clean everything up! We can create a reusable helper function to take care of the zombies!


### SAVE US main.c - Joel uses signals

The sigaction structure specifies how a signal should be handled. ;)

**SIG_IGN**
SIG_IGN is a signal handler ignore specific signals. It is used in the system calls sigaction or signal. When a signal is ignored, your program discards it, and the default action does not occur.

**SIG_DFL**
SIG_DFL is a constant that represents the default action for a given signal in Unix-based OS's. It is an alternative to SIG_IGN in this coding example.

**SA_NOCLDWAIT**
The flag SA_NOCLDWAIT tells the kernel that the process does not want to create zombie processes when child processes terminate.

**SIGCHLD**
SIGCHLD (Signal Child) is a signal sent to a parent process whenever one of its child processes terminates, stops, or resumes execution.


##### Solution and Code heavily inspired by Professor Jacob Sorber's Example - C Zombies
https://www.youtube.com/watch?v=_5SCtRNnf9U&ab_channel=JacobSorber
