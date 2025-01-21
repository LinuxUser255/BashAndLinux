#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

// Model URLs
// https://ollama.com/library/codellama
// https://ollama.com/library/starcoder2
// https://ollama.com/library/codegemma
// https://ollama.com/library/deepseek-coder-v2

int main() {
    // Print a menu
    printf("Select an Ollama Model to run.\n\n");
    printf("A: llama3.1\n");
    printf("B: codellama\n");
    printf("C: starcoder2\n");
    printf("D: codegemma\n");
    printf("E: deepseek-coder-v2\n\n");

    // Prompt the user for their choice
    printf("Enter your choice (A/B/C/D/E): ");
    char choice;
    scanf(" %c", &choice);

    // Convert the choice to uppercase
    choice = toupper(choice);

    // Check the user's choice and run the corresponding model
    switch (choice) {
        case 'A':
            system("ollama pull llama3.1 && ollama run llama3.1");
            break;
        case 'B':
            system("ollama pull codellama && ollama run codellama");
            break;
        case 'C':
            system("ollama pull starcoder2 && ollama run starcoder2");
            break;
        case 'D':
            system("ollama pull codegemma && ollama run codegemma");
            break;
        case 'E':
            system("ollama pull deepseek-coder-v2 && ollama run deepseek-coder-v2");
            break;
        default:
            printf("Invalid selection\n");
    }

    // Return 0 to indicate successful program termination
    return 0;
}
