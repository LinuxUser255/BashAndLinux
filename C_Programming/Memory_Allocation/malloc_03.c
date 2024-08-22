#include <stdio.h>
#include <stdlib.h>

// Malloc example:  Linked Lists
// Define the structure for a linked list node
struct Node {
    int data;
    struct Node* next;
};

// Function to create a new node with given data
struct Node* createNode(int data) {
    // Allocate memory for the new node
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));

    // Check if memory allocation was successful
    if (newNode == NULL) {
        printf("Memory allocation failed.\n");
        exit(0);
    }

    // Initialize the node's data and next pointer
    newNode->data = data;
    newNode->next = NULL;

    return newNode;
}

int main() {
    // Example usage of createNode function
    struct Node* node = createNode(10);
    printf("Node data: %d\n", node->data);

    // Free the allocated memory for the node
    free(node);

    return 0;
}
