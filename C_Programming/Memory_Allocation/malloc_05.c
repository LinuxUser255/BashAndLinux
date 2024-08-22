#include <stdio.h>
#include <stdlib.h>

// Dynamic 2D Arrays
int main() {
    int **array;
    int rows, cols;

    // Ask the user for the number of rows and columns
    printf("Enter the number of rows and columns: ");
    scanf("%d %d", &rows, &cols);

    // Dynamically allocate memory for the array of row pointers
    array = (int**)malloc(rows * sizeof(int*));

    // Allocate memory for each row
    for (int i = 0; i < rows; i++) {
        array[i] = (int*)malloc(cols * sizeof(int));
    }

    // Initialize the 2D array with values
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            array[i][j] = i * cols + j;
        }
    }

    // Use the 2D array (e.g., print the values)
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            printf("%d ", array[i][j]);
        }
        printf("\n");
    }

    // Free the allocated memory for each row
    for (int i = 0; i < rows; i++) {
        free(array[i]);
    }

    // Free the memory allocated for the row pointers
    free(array);

    return 0;
}
