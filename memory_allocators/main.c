#include <stdio.h>
#include <stdlib.h>

/*
* Stack Allocated Memory (faster!)
* - Memory is allocated on the stack
* - It is deallocated automatically when the function returns
* - Stack memory is limited per OS, check using `ulimit -s`
* - Stack memory is faster to allocate and deallocate
* - Stack memory is not manually freed :/
*/
void stack_allocation() {
    int stack_array[5]; // allocated on the stack
    printf("Stack Allocation:\n");
    for (int i = 0; i < 5; i++) {
        stack_array[i] = i + 1;
        printf("%d ", stack_array[i]);
    }
    printf("\n");
} // stack_array is deallocated automatically here woot!

/*
* Dyamically Allocated Memory (Heap)
* - Memory is allocated on the heap using malloc() function
* - Memory must be manually freed using free() function
* - If memory is not freed, it will cause memory leak
* - If freed memory is accessed, it will cause a dangling pointer error (seg fault)
*/
void heap_allocation() {
    int *heap_array = (int *)malloc(5 * sizeof(int));
    if (!heap_array) {
        perror("Heap allocation failed");
        return;
    }

    printf("Heap Allocation:\n");
    for (int i = 0; i < 5; i++) {
        heap_array[i] = i + 1;
        printf("%d ", heap_array[i]);
    }
    printf("\n");

    // what if we call realloc, what happens?

    free(heap_array); // heap allocated memory must be manually freed
    // heap_array = NULL; // set to NULL after freeing to avoid dangling pointer

    // uncomment below to cause an error (dangling pointer to freed heap memory)
    // printf("%d\n", heap_array[0]);
}

int main() {
    stack_allocation();
    heap_allocation();
    return 0;
}
