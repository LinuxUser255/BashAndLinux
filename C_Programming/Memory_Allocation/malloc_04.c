#include <stdio.h>
#include <stdlib.h>

// Dynamic Strings
int main() {
    char *str;
    int len;

    // Ask the user for the length of the string
    printf("Enter the length of the string: ");
    scanf("%d", &len);

    // Dynamically allocate memory for the string (including null terminator)
    str = (char*)malloc((len + 1) * sizeof(char));

    // Check if memory allocation was successful
    if (str == NULL) {
        printf("Memory not allocated.\n");
        exit(0);
    }

    // Ask the user to input the string
    printf("Enter the string: ");
    scanf("%s", str);

    // Print the entered string
    printf("You entered: %s\n", str);

    // Free the allocated memory
    free(str);

    return 0;
}
