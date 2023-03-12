#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <assert.h>

void func()
{
    int arr1[3] = {0, 1, 2};
    int arr2[3] = {3, 4, 5};
    printf("%d\n", *(arr2 - 1));
    printf("%d\n", *(int *)((void *)arr2 - sizeof(int)));
    // printf("%ld\n", arr2);

    // 空闲链表法获得block的信息
    void *p = malloc(24);
    uint64_t header_addr = (uint64_t)p - 8;
    uint32_t header_value = *((uint32_t *)((uint64_t)p - 8));
    uint32_t block_size = header_value & 0xFFFFFFFE;
    uint allocated = header_value & 0x1;
    uint64_t next_header_addr = header_addr + block_size;
    printf("block_size = %d\n", block_size);
    printf("allocated = %d\n", allocated);

    printf("\033[32;1m\tPass\033[0m\n");

    int var1 = 8;
    assert((var1 & 0x3) == 0);
}

void main()
{
    func();
}
