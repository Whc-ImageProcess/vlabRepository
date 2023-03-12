#include "csapp.h"

int main(int argc, char *argv[])
{
    char c1, c2;
    int fd1;
    int s = getpid() & 0x1;
    printf("%d\n", s);
    char *fname = argv[1];
    fd1 = Open(fname, O_RDONLY, 0);
    Read(fd1, &c1, 1);
    if (fork())
    {
        Sleep(1 - s);
        Read(fd1, &c2, 1);
        printf("Parent: c1 = %c, c2 = %c\n", c1, c2);
    }
    else
    {
        Sleep(s);
        Read(fd1, &c2, 1);
        printf("Child: c1 = %c, c2 = %c\n", c1, c2);
    }

    return 0;
}