#include <stdio.h>
#include <stdlib.h>  // Use stdlib.h instead of malloc.h

// Basic malloc example for Dynamic Array Allocation
int main(void) {
    // Allocate memory for 10 integers
    int *arr = malloc(10 * sizeof(int));

    // Check for successful allocation
    if (!arr) {
        printf("Memory allocation failed.\n");
        return 1;
    }

    // Initialize and print array elements
    for (int i = 0; i < 10; i++) {
        arr[i] = i * i;
        printf("%d ", arr[i]);
    }
    printf("\n");

    // Free the allocated memory
    free(arr);

    return 0;
}

