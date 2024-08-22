#include <stdio.h>
#include <stdlib.h>

//  Buffers for I/O Operations
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
        exit(0);
