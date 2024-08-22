#include <stdio.h>
#include <stdlib.h>

//  Dynamic Array Allocation
int main() {
    int *array;
    int n;

    // Ask the user for the number of elements
    printf("Enter the number of elements: ");
    scanf("%d", &n);

    // Dynamically allocate memory for 'n' integers
    array = (int*)malloc(n * sizeof(int));

    // Check if memory allocation was successful
    if (array == NULL) {
        printf("Memory not allocated.\n");
        exit(0);
    }

    // Initialize the array with values
    for (int i = 0; i < n; i++) {
        array[i] = i + 1;
    }

    // Use the array (e.g., print the values)
    for (int i = 0; i < n; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");

    // Free the allocated memory
    free(array);

    return 0;
}
