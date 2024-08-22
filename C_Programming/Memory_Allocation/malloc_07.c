
// Custom Memory Pools
// Custom memory pool example is more conceptual and would typically involve
// complex management of memory. Here is a simplified example:

#include <stdio.h>
#include <stdlib.h>

// Function to allocate a large block of memory
void* createMemoryPool(size_t size) {
    void* pool = malloc(size);
    if (pool == NULL) {
        printf("Memory allocation failed.\n");
        exit(0);
    }
    return pool;
}

// Function to allocate memory from the pool
void* allocateFromPool(void** pool, size_t size) {
    void* allocation = *pool;
    *pool = (char*)(*pool) + size; // Move the pointer forward
    return allocation;
}

int main() {
    // Create a memory pool of 1 KB
    void* memoryPool = createMemoryPool(1024);

    // Allocate 256 bytes from the pool
    void* block1 = allocateFromPool(&memoryPool, 256);

    // Allocate another 128 bytes from the pool
    void* block2 = allocateFromPool(&memoryPool, 128);

    // Pool usage example ends here; in a real application, you would keep track
    // of allocations and possibly implement a free operation for reuse.

    return 0;
}
