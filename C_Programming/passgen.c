#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Random password generator
#define PASSWORD_LENGTH 20  // Define the length of the password
#define NUM_CHARACTERS (sizeof(characters) - 1)  // Number of available characters

int main(void) {
    // Available characters for the password
    const char characters[] = "abcdefghijklmnopqrstuvwxyz"
                              "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                              "0123456789"
                              "!@#$%^&*()_+[]{}|;:,.<>?";
                              
    char password[PASSWORD_LENGTH + 1];  // Array to hold the generated password
    srand((unsigned int)time(NULL));  // Seed the random number generator

    // Generate the random password
    for (int i = 0; i < PASSWORD_LENGTH; i++) {
        password[i] = characters[rand() % NUM_CHARACTERS];
    }
    password[PASSWORD_LENGTH] = '\0';  // Null-terminate the password string

    // Print the generated password
    printf("\nGenerated Password:\n\n%s\n\n",password);

    return 0;
}
