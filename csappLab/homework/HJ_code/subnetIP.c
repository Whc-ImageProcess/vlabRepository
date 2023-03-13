#include <stdio.h>

int main()
{
    unsigned int a, b, c, d;
    unsigned int mask1, mask2, mask3, mask4;
    unsigned int and1, and2, and3, and4;
    int current_stage = 0, skip_stages = 0;

    while (scanf("%d.%d.%d.%d", &a, &b, &c, &d) != EOF)
    {
        current_stage++;

        if (skip_stages > 0)
        {
            skip_stages--;
            current_stage = 0;
            continue;
        }

        if (a > 255 || b > 255 || c > 255 || d > 255)
        {
            printf("1\n");
            skip_stages = 3 - current_stage;
            continue;
        }

        if (current_stage == 1)
        {
            if (a != 255 || d != 0)
            {
                printf("1\n");
                skip_stages = 3 - current_stage;
                continue;
            }

            mask1 = a;
            mask2 = b;
            mask3 = c;
            mask4 = d;
        }

        if (current_stage == 2)
        {
            and1 = a & mask1;
            and2 = b & mask2;
            and3 = c & mask3;
            and4 = d & mask4;
        }

        if (current_stage == 3)
        {
            if (
                and1 - (a & mask1) != 0 ||
                and2 - (b & mask2) != 0 ||
                and3 - (c & mask3) != 0 ||
                and4 - (d & mask4) != 0)
            {
                printf("2\n");
            }
            else
            {
                printf("0\n");
            }

            current_stage = 0;
        }
    }

    return 0;
}