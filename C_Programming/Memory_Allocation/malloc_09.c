#include <stdio.h>
#include <stdlib.h>

int main() {
    char *buffer;
    int bufferSize;

    // Ask the user for the buffer size
    printf("Enter buffer size: ");
    scanf("%d", &bufferSize);

    // Dynamically allocate memory for the buffer
    buffer = (char*)malloc(bufferSize * sizeof(char));

    // Check if memory allocation was successful
    if (buffer == NULL) {
        printf("Memory not allocated.\n");
        exit(EXIT_SUCCESS);
    }
}
