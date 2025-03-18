# writing to physical memory

We open the /dev/mem device file which is an image of the main memory of the computer. 

We then map a page of physical memory into the process's virtual address space using the mmap system call. 

After the memory is mapped, we can read from and write to it as if it were normal process memory.

You are likely to see this error when running the code :/
```
csc412-user@ef51339ef69a:~/lectures/memory_physical$ make 
gcc -Wall -Werror -pedantic -o main main.c
./main
Can't open /dev/mem: Operation not permitted
make: *** [Makefile:7: run] Error 255
```
We need to research why we cannot open: `/dev/mem`
