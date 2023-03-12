#include <stdio.h>
#include "csapp.h"

int main(int argc, char *argv[])
{
    int fd1, fd2, fd3;
    char *fname = argv[1];
    fd1 = Open(fname, O_CREAT | O_TRUNC | O_RDWR, S_IRUSR | S_IWUSR);
    write(fd1, "start", 5);
    fd3 = Open(fname, O_APPEND | O_WRONLY, 0);
    write(fd3, "second", 6);
    fd2 = dup(fd1);
    write(fd2, "third", 5);
    write(fd3, "END", 3);
    return 0;
}
