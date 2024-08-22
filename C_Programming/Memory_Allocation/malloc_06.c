#include <stdio.h>
#include <stdlib.h>

// Resizing Arrays (Dynamic Growth)
int main() {
    int *array;
    int size = 10;   // Initial size of the array
    int count = 0;   // Number of elements added

    // Dynamically allocate memory for the array
    array = (int*)malloc(size * sizeof(int));

    // Check if memory allocation was successful
    if (array == NULL) {
        printf("Memory not allocated.\n");
        exit(0);
    }

    // Add elements to the array, resizing if necessary
    for (int i = 0; i < 20; i++) { // Suppose we're adding 20 elements
        if (count == size) {
            // Double the size of the array when it's full
            size *= 2;
            array = (int*)realloc(array, size * sizeof(int));

            // Check if memory allocation was successful
            if (array == NULL) {
                printf("Memory allocation failed.\n");
                exit(0);
            }
        }

        // Add the element to the array
        array[count++] = i;
    }

    // Use the array (e.g., print the values)
    for (int i = 0; i < count; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");

    // Free the allocated memory
    free(array);

    return 0;
}
