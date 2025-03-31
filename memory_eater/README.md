# MEMORY EATER!

All three programs continuously allocate 1 GB of memory.

They are running `malloc()` and they track how many gigabytes have been allocated. 

BTW if (and hoenstly when) `malloc()` fails, the program prints the total amount of memory successfully allocated before terminating. 


### Why are we doing this?

The programs are demonstrating how memory exhaustion occurs. This can be useful for testing the limits of your OS or studying virtual memory's allocation behavior.

#### main.c (this should fail the slowest :/ )
Writes memory but never access it. BTW, the other two programs use `memset()`, which actively writes to the allocated memory.

In `main.c` the OS might overcommit and only fail when trying to actually use the memory later. Which we never force it to.

##### main_pointers.c
Since we are using `memset()`, this forces actual memory usage, hooray!!! 
`main_pointers.c` may run out of memory faster than `main.c`. 

##### main_write.c (this should fail the fastest!)
Since pointers are stored in an array, this could lead to fragmentation when memory is exhausted, as the OS has to manage a large number of allocations.
