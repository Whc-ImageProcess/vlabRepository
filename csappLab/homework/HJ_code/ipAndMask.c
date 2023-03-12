#include <stdio.h>

int main(void)
{
    char str[50];
    int illegal_f;
    int len, i, tmp_i, ip_i, j;
    int ymtmp;
    int A = 0, B = 0, C = 0, D = 0, E = 0, illegal = 0, P = 0;
    while (fgets(str, 50, stdin) != NULL)
    {
        int ip[8] = {0};
        len = strlen(str) - 1;
        str[len] = 0;
        illegal_f = 0;
        for (i = 0, tmp_i = 0, ip_i = 0; i < len; i++)
        {
            if (('.' == str[i]) || ('~' == str[i]) || (len - 1 == i))
            {
                if (len - 1 == i)
                {
                    i++;
                }
                if ((3 < i - tmp_i) || (i == tmp_i))
                {
                    illegal_f = 1;
                    break;
                }
                else
                {
                    for (j = tmp_i; j < i; j++)
                    {
                        ip[ip_i] = ip[ip_i] * 10 + (int)(str[j] - '0');
                    }
                    if ((255 < ip[ip_i]) || (0 > ip[ip_i]))
                    {
                        illegal_f = 1;
                        break;
                    }
                    if (7 > ip_i)
                    {
                        ip_i++;
                    }
                }
                tmp_i = i + 1;
            }
        }

        //+++++++++++++掩码合法性确认++++++++++++++++++++++++++++++++++++++
        if (0 == illegal_f)
        { // 如果已判断为非法IP，则不需要再判断掩码的合法性了。
            if ((0 == ip[4]) && (0 == ip[5]) && (0 == ip[6]) && (0 == ip[7]))
            { // 掩码全0：非法。
                illegal_f = 1;
            }
            else if ((255 == ip[4]) && (255 == ip[5]) && (255 == ip[6]) && (255 == ip[7]))
            { // 掩码全255：非法。
                illegal_f = 1;
            }
            else
            {
                ymtmp = 0;
                for (i = 7; 3 < i; i--)
                {
                    for (ip_i = 0; 8 > ip_i; ip_i++, ip[i] /= 2)
                    {
                        if (0 != ymtmp)
                        {
                            if (0 == ip[i] % 2)
                            {
                                illegal_f = 1;
                                break;
                            }
                        }
                        else
                        {
                            ymtmp = ip[i] % 2;
                        }
                    }
                    if (0 != illegal_f)
                    {
                        break;
                    }
                }
            }
        }
        //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

        //+++++++++++IP类型统计+++++++++++++++++++++++++++++++++++++++++
        if ((0 != ip[0]) && (127 != ip[0]))
        {
            if (0 != illegal_f)
            { // 非法IP
                illegal++;
            }
            else if ((1 <= ip[0]) && (126 >= ip[0]))
            { // A类
                A++;
                if (10 == ip[0])
                { // 私有
                    P++;
                }
            }
            else if ((128 <= ip[0]) && (191 >= ip[0]))
            { // B类
                B++;
                if (172 == ip[0])
                { // 私有
                    if ((16 <= ip[1]) && (31 >= ip[1]))
                    {
                        P++;
                    }
                }
            }
            else if ((192 <= ip[0]) && (223 >= ip[0]))
            { // C类
                C++;
                if (192 == ip[0])
                { // 私有
                    if (168 == ip[1])
                    {
                        P++;
                    }
                }
            }
            else if ((224 <= ip[0]) && (239 >= ip[0]))
            { // D类
                D++;
            }
            else if ((240 <= ip[0]) && (255 >= ip[0]))
            { // E类
                E++;
            }
        }
        //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    }
    printf("%d %d %d %d %d %d %d", A, B, C, D, E, illegal, P);
    return 0;
}