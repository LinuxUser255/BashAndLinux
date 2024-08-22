# Use Cases for Memory Allocation in C Programming

In C programming, dynamic memory allocation is essential for **managing memory at runtime**. 
The function `malloc()` (defined in the **malloc.c** file in some implementations) is a **key tool for allocating memory dynamically**
Here are some use cases and examples:

### 1. **Dynamic Array Allocation**
   ```c
   #include <stdio.h>
   #include <stdlib.h>

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
   ```

### 2. **Linked Lists**
   ```c
   #include <stdio.h>
   #include <stdlib.h>

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
   ```

### 3. **Dynamic Strings**
   ```c
   #include <stdio.h>
   #include <stdlib.h>

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
   ```

### 4. **Dynamic 2D Arrays**
   ```c
   #include <stdio.h>
   #include <stdlib.h>

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
   ```

### 5. **Resizing Arrays (Dynamic Growth)**
   ```c
   #include <stdio.h>
   #include <stdlib.h>

   int main() {
       int *array;
       int size = 10;   // Initial size of the array
       int count = 0;   // Number of elements added

       // Dynamically allocate memory for the array
       array = (int*)malloc(size * sizeof(int));

       // Check if memory allocation was successful
       if (array == NULL) {
           printf("Memory not allocated.\n");
           exit(0);
       }

       // Add elements to the array, resizing if necessary
       for (int i = 0; i < 20; i++) { // Suppose we're adding 20 elements
           if (count == size) {
               // Double the size of the array when it's full
               size *= 2;
               array = (int*)realloc(array, size * sizeof(int));

               // Check if memory allocation was successful
               if (array == NULL) {
                   printf("Memory allocation failed.\n");
                   exit(0);
               }
           }

           // Add the element to the array
           array[count++] = i;
       }

       // Use the array (e.g., print the values)
       for (int i = 0; i < count; i++) {
           printf("%d ", array[i]);
       }
       printf("\n");

       // Free the allocated memory
       free(array);

       return 0;
   }
   ```

### 6. **Custom Memory Pools**
   ```c
   // Custom memory pool example is more conceptual and would typically involve
   // complex management of memory. Here is a simplified example:
   
   #include <stdio.h>
   #include <stdlib.h>

   // Function to allocate a large block of memory
   void* createMemoryPool(size_t size) {
       void* pool = malloc(size);
       if (pool == NULL) {
           printf("Memory allocation failed.\n");
           exit(0);
       }
       return pool;
   }

   // Function to allocate memory from the pool
   void* allocateFromPool(void** pool, size_t size) {
       void* allocation = *pool;
       *pool = (char*)(*pool) + size; // Move the pointer forward
       return allocation;
   }

   int main() {
       // Create a memory pool of 1 KB
       void* memoryPool = createMemoryPool(1024);

       // Allocate 256 bytes from the pool
       void* block1 = allocateFromPool(&memoryPool, 256);

       // Allocate another 128 bytes from the pool
       void* block2 = allocateFromPool(&memoryPool, 128);

       // Pool usage example ends here; in a real application, you would keep track
       // of allocations and possibly implement a free operation for reuse.

       return 0;
   }
   ```

### 7. **Data Structures with Variable Size**
   ```c
   #include <stdio.h>
   #include <stdlib.h>

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
   ```

### 8. **Buffers for I/O Operations**
   ```c
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
           exit(0);
