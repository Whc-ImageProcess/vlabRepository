#include <stdio.h>
int N;//要输入多少个数
int nodes[100];//保存的数
char match[100];//跟谁配的对
char vis[100];//有没有被访问过
int is_prime(int num)
{
    int end = sqrt(num);
    for(int i = 2; i <= end; ++i)
    {
        if(num % i == 0)
            return 0;
    }
    return 1;
}
int Match(int x)
{
    for(int i = 0; i < N; ++i)
    {
        if(!(nodes[i]%2) && !vis[i] && is_prime(nodes[i] + nodes[x]))
        {
            vis[i] = 1;
            if(match[i] == -1 || Match(match[i]))
            {
                match[i] = x;
                match[x] = i;
                return 1;
            }
        }
    }
    return 0;
}
int main()
{
    while(scanf("%d", &N) != EOF)
    {
        int i;
        int cnt = 0;
        for(i = 0; i < N; ++i) 
            scanf("%d", nodes+i);
        for(i = 0; i < N; ++i) 
            match[i] = -1;
        for(i = 0; i < N; ++i)
        {//对于每一个人i
            if((nodes[i]%2))
            {
                memset(vis, 0, sizeof(char)*N);
                if(Match(i))
                    cnt++;
            }
        }
        printf("%d\n", cnt);
    }
    return 0;
}