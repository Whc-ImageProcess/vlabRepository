#include <stdio.h>
#include <stdlib.h>


void main()
{
    char arr[2] = {0, 0};
    char *ptr1 = arr;
    char *ptr2 = &arr;
    printf("ptr1 = %p\n", ptr1);
    printf("ptr2 = %p\n", ptr2);
    printf("ptr1+1 = %p\n", ++ptr1);
    printf("ptr2+1 = %p\n", ++ptr2);

    int num = 5;
    int (*arr)[3] = (int (*)[])malloc(sizeof(int) * num * 3);

}