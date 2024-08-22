#include <stdio.h>
#include <malloc.h>

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
