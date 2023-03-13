#include <iostream>
#include <string>

using namespace std;

// HJ32 密码截取
int main()
{
    // 我们用一个 boolean dp[l][r] 表示字符串从 i 到 j 这段是否为回文。试想如果 dp[l][r]=true，
    // 我们要判断 dp[l-1][r+1] 是否为回文。只需要判断字符串在(l-1)和（r+1)两个位置是否为相同的字符，
    // 是不是减少了很多重复计算。
    // 进入正题，动态规划关键是找到初始状态和状态转移方程。
    // 初始状态，l=r 时，此时 dp[l][r]=true。
    // 状态转移方程，dp[l][r]=true 并且(l-1)和（r+1)两个位置为相同的字符，此时 dp[l-1][r+1]=true。

    bool dp[2600][2600] = {false};
    int maxStart = 0; // 最长回文串的起点
    int maxEnd = 0;   // 最长回文串的终点
    int maxLen = 1;   // 最长回文串的长度

    string str;
    cin >> str;
    int len = str.length();
    for (int r = 1; r < len; ++r)
    {
        for (int l = 0; l < r; ++l)
        {
            if (str[l] == str[r] && (r - l <= 2 || dp[l + 1][r - 1]))
            {
                dp[l][r] = true;
                if (r - l + 1 > maxLen)
                {
                    maxLen = r - l + 1;
                    maxStart = l;
                    maxEnd = r;
                }
            }
        }
    }

    cout << maxLen << endl;

    return 0;
}