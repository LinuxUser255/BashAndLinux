#include <stdio.h>
#include <malloc.h>

/**
 * @brief Demonstrates basic memory allocation using malloc
 *
 * This program allocates memory for an array of 10 integers,
 * fills the array with square values, prints the array elements,
 * and then frees the allocated memory.
 *
 * @param void No input parameters
 * @return int Returns 0 on successful execution, 1 if memory allocation fails
 */
int main(void) {
    int *arr = (int *)malloc(10 * sizeof(int));

    if (arr == NULL) {
        printf("Memory allocation failed.\n");
        return 1;
    }
    for (int i = 0; i < 10; i++) {
        arr[i] = i * i;
    }
    printf("Array elements\n");
    for (int i = 0; i < 10; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    // Free the allocated memory
    free(arr);

    return 0;
}
