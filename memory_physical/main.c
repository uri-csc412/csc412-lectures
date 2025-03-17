#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>

int main() {
    // the physical address you want to write to
    unsigned long phys_addr = 0x12345678; // example address
    unsigned long page_size = sysconf(_SC_PAGESIZE);
    unsigned long mapped_size = page_size;
    unsigned long page_mask = (unsigned long)(long)(~(page_size - 1));
    unsigned long mapped_addr = phys_addr & page_mask;
    off_t offset = phys_addr - mapped_addr;

    // open /dev/mem file
    int mem_fd = open("/dev/mem", O_RDWR | O_SYNC);
    if (mem_fd < 0) {
        perror("Can't open /dev/mem");
        return -1;
    }

    // map one page of memory into user space 
    // so that the desired physical address can be accessed
    void *mapped_base = mmap(NULL, mapped_size, PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, mapped_addr);
    if (mapped_base == (void *) -1) {
        perror("Oh darn I cannot mmap");
        close(mem_fd);
        return -1;
    }

    // calculate the virtual address to be accessed
    void *virt_addr = (char *)mapped_base + offset;

    // write to physical memory
    unsigned long value = 0xDEADBEEF; // example value to write
    *((unsigned long *) virt_addr) = value;

    // clean up our mess
    munmap(mapped_base, mapped_size);
    close(mem_fd);

    return 0;
}
