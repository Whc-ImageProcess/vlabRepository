#include <stdio.h>
#include <assert.h>

void test()
{
    // TMin32 = -2147483648
    // TMax32 = 2147483647
    int x = -2147483647;
    printf("x = %d\n -x = %d\n", x, -x);
    unsigned int  ux = x;
    printf("ux = %u\n", ux);
    assert(1.0/2 == 1/2.0);
    float f = 1.0e20;
    double d = 1.0;
    assert((f + d) - f == d);
}

void main()
{
    test();
}