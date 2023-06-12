#include <iostream>
#include <vector>
using namespace std;

int main()
{
    int n;
    while (cin >> n)
    {
        vector<int> nums(n, 0);
        for (int i = 0; i < n; i++)
        {
            cin >> nums[i];
        }

        // dp[i]代表从前走到第i个的梅花桩（i从0开始）最多需要走的步数
        vector<int> dp(n, 1);
        int maxsteps = 0;
        for (int i = 1; i < n; i++)
        {
            for (int j = 0; j < i; j++)
            {
                // 梅花桩j在梅花桩i的前面
                if (nums[j] < nums[i] && dp[j] >= dp[i])
                {
                    // 如果梅花桩j比梅花桩i矮，但是梅花桩j的最多步数多于或等于梅花桩i的最多步数，
                    // 那么更新梅花桩i的最多步数
                    dp[i] = dp[j] + 1;
                }
            }
            maxsteps = maxsteps > dp[i] ? maxsteps : dp[i];
        }
        cout << maxsteps << endl;
    }
    return 0;
}
