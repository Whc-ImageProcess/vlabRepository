#include <stdio.h>

struct test
{
    char a[3];
    short b;
    long c;
};


void main()
{
    struct test val;
    printf("sizeof(test) = %ld\n", sizeof(val));
}