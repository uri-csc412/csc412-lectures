# Secure programming: writing to physical memory, why does this not work?

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

Remember we are running on Linux, so it likely this happens because `/dev/mem` is a special file that provides access to physical memory. Thus, Linux restricts access to it for security reasons. 
* Insufficient Permissions
* Kernel Restrictions (CONFIG_STRICT_DEVMEM)
* Running as an Unprivileged User (Docker, Chroot, etc.)

So for us it is likely:
* If strict kernel protections are enabled, disable them (iomem=relaxed)
* If running in a container, ensure it's privileged

## On Ubuntu we need to check Kernel Restrictions

Ubuntu often prevents access to `/dev/mem` via `CONFIG_STRICT_DEVMEM`.
```
cat /proc/sys/kernel/mem_protect
```

We can look at `/proc/iomem`

## `/proc/iomem` (readonly.c)

Since `/dev/mem` is restricted on Ubuntu 22.04, you can use `/proc/iomem` to retrieve memory region information instead of trying to map physical memory. However, note that `/proc/iomem` is read-only—you cannot modify physical memory through it. If your goal is to analyze memory mappings rather than write to memory, this approach will work.

```
make build
make run-readonly
```