#include <stdio.h>
#include <string.h>
void main()
{
    char buf[1001] = {0};
    int i, len;

    // scanf("%[^\n]",str);
    // 直到输入回车键，读取才结束，
    // 当然不能超过a定义的大小，否则会出错。此命令与gets(str)效果一样。

    // 因为gets可以读入空格，遇到回车才会停止，gets对末尾回车符的处理是接收回车并把回车替换为\0；
    // 而scanf遇到空格、回车和Tab键都会认为输入结束，所以它是不能接收空格的
    // scanf("%s", str);

    fgets(buf, 1000, stdin);

    printf("strlen(buf) = %ld\n", strlen(buf));
    len = strlen(buf) - 1;
    if (buf[len] == '\n')
    {
        buf[len] = '\0';
    }

    for (i = len; i >= 0; i--)
    {
        if (buf[i] == ' ')
        {
            printf("%s", &buf[i + 1]);
            buf[i] = '\0';
            printf(" ");
        }
    }
    printf("%s", buf);
}