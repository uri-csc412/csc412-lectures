# writing to physical memory

We open the /dev/mem device file which is an image of the main memory of the computer. 

We then map a page of physical memory into the process's virtual address space using the mmap system call. 

After the memory is mapped, we can read from and write to it as if it were normal process memory.

