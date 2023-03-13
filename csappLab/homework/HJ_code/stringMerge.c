#include <stdio.h>
#include <string.h>
#include <math.h>

#define MAX 100

int char_cmp(const void *_a, const void *_b)
{
    char *a = (char *)_a;
    char *b = (char *)_b;
    return *a - *b;
}

char turn_bit(int x)
{
    int i = 0;
    int tmp = 0;
    char ret = 0;
    for (i = 0; i < 4; i++)
    {
        tmp = tmp + ((x >> i) & 1) * pow(2, 3 - i);
    }
    if (tmp >= 0 && tmp <= 9)
    {
        tmp = tmp + '0';
        ret = (char)tmp;
        return ret;
    }
    else if (tmp >= 10 && tmp <= 15)
    {
        tmp = tmp - 10 + 'A';
        ret = (char)tmp;
        return ret;
    }
    ret = (char)x;
    return ret;
}

int main()
{
    char str1[2 * MAX] = {0};
    char str2[MAX] = {0};
    char tmp_str1[MAX] = {0};
    char tmp_str2[MAX] = {0};
    int tmp = 0;
    int i = 0;
    while (scanf("%s", str1) != EOF)
    {
        scanf("%s", str2);
        // 合并字符串
        strcat(str1, str2);
        // 字符串分奇偶
        int len = strlen(str1);
        tmp_str1[0] = str1[0];
        int j = 0;
        int k = 0;
        for (i = 1; i < len; i++)
        {
            if (i % 2 == 0)
            {
                tmp_str1[++j] = str1[i];
            }
            else
            {
                tmp_str2[k++] = str1[i];
            }
        }
        // 奇偶字符串排序
        qsort(tmp_str1, j + 1, sizeof(char), char_cmp);
        qsort(tmp_str2, k, sizeof(char), char_cmp);
        // 还原回去
        str1[0] = tmp_str1[0];
        j = 0;
        k = 0;
        for (i = 1; i < len; i++)
        {
            if (i % 2 == 0)
            {
                str1[i] = tmp_str1[++j];
            }
            else
            {
                str1[i] = tmp_str2[k++];
            }
        }
        // 字符操作
        for (i = 0; i < len; i++)
        {
            if (str1[i] >= '0' && str1[i] <= '9')
            {
                tmp = str1[i] - '0';
                str1[i] = turn_bit(tmp);
            }
            else if ((str1[i] >= 'A' && str1[i] <= 'F') || (str1[i] >= 'a' && str1[i] <= 'f'))
            {
                tmp = toupper(str1[i]) - 'A' + 10;
                str1[i] = turn_bit(tmp);
            }
        }
        printf("%s\n", str1);
    }
    return 0;
}