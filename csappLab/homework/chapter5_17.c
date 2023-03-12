#include <stdio.h>
#include <stdlib.h>

void *basic_memset(void *s, int c, size_t n)
{
    size_t cnt = 0;
    unsigned char *schar = s;
    while (cnt < n)
    {
        *schar++ = (unsigned char)c;
        cnt++;
    }
    return s;
}

//情况1:地址s可能未对齐
//情况2：n可能不是sizeof(unsigned long)的倍数
void *effective_memset(void *s, unsigned long cs, size_t n)
{
    size_t K = sizeof(unsigned long);
    size_t cnt = 0;
    unsigned char *schar = s;
    while (cnt < n)
    {
        if ((size_t)schar % K == 0)
        {
            break;
        }
        *schar++ = (unsigned char)cs;
        cnt++;
    }

    unsigned long *slong = (unsigned long *)schar;
    size_t rest = n - cnt;
    size_t loop = rest / K;
    size_t tail = rest % K;
    for (size_t i = 0; i < loop; i++)
    {
        *slong++ = cs;
    }

    schar = (unsigned char *)slong;
    for (size_t i = 0; i < tail; i++)
    {
        *schar++ = (unsigned char)cs;
    }
    return s;
}

void main()
{
    int n = 63;
    char *s = (char *)malloc(sizeof(char) * n);
    effective_memset(s, 0x39, n);
    for (size_t i = 0; i < n; i++)
    {
        printf("%c ", *(s + i));
    }
    printf("\n");
}
