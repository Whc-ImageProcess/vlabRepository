#include <stdio.h>
#include <string.h>

// EOF是一个整形

static int lenOFLastWord(char buf[])
{
    if (buf == NULL)
    {
        return 0;
    }

    int i = 0, j = 0;
    while (*(int *)(buf + i) != EOF)
    {
        if (*(buf + i) == ' ')
        {
            j = i;
        }

        i++;
    }

    return (i - j - 1);
}

int main()
{
    int a, b;
    char buf[5000] = {0};
    fgets(buf, 5000, stdin);
    // char *tmp = "hello nowcode";
    // strcpy(buf, tmp);
    // buf[13] = EOF;

    printf("%d\n", lenOFLastWord(buf));

    return 0;
}