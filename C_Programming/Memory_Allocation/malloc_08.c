#include <stdio.h>
#include <stdlib.h>

// Data Structures with Variable Size
// Define the structure for a binary tree node
struct TreeNode {
    int data;
    struct TreeNode* left;
    struct TreeNode* right;
};

// Function to create a new tree node with given data
struct TreeNode* createTreeNode(int data) {
    // Allocate memory for the new node
    struct TreeNode* node = (struct TreeNode*)malloc(sizeof(struct TreeNode));

    // Check if memory allocation was successful
    if (node == NULL) {
        printf("Memory allocation failed.\n");
        exit(0);
    }

    // Initialize the node's data and child pointers
    node->data = data;
    node->left = NULL;
    node->right = NULL;

    return node;
}

int main() {
    // Example usage of createTreeNode function
    struct TreeNode* root = createTreeNode(10);

    // Add more nodes to the tree as needed...
    root->left = createTreeNode(5);
    root->right = createTreeNode(15);

    // Use the tree...

    // Free the allocated memory (would typically involve a tree traversal to free all nodes)
    free(root->left);
    free(root->right);
    free(root);

    return 0;
}
