#include <iostream>
#include <vector>
#include <string>
#include <map>
using namespace std;

int main()
{
    // string str = "123.123.123.123";
    // cout << stoi(str.substr(5, 4)) << endl;

    // string str;
    // // 空格会阻断cin的输入但是不会报错，所以while(cin >> str)可以
    // // 循环接收输出参数
    // while (cin >> str)
    // {
    //     cout << str << endl;
    //     // cin.get(无参数)没有参数主要是用于舍弃输入流中的不需要的字符,或者舍弃回车。
    //     // cin.get();
    // }

    // cout << "Enter a list of integers:" << std::endl;
    // int currVal = 0;
    // int val = 0;
    // int cnt = 0;

    // /*读入第一个输入的数据*/
    // if (cin >> currVal)
    // {
    //     cnt = 1;
    //     /*循环读入之后的数据*/
    //     while (cin >> val)
    //     {
    //         /*如果当前读入的数据val与之前的数据currVal相等，cnt++*/
    //         if (currVal == val)
    //         {
    //             ++cnt;
    //         }
    //         else
    //         {
    //             /*如果不相等，输出之前数据currVal连续出现的次数，同时重新统计当前数据的连续出现次数*/
    //             cout << currVal << " occurs " << cnt << " times. " << endl;
    //             currVal = val;
    //             cnt = 1;
    //         }
    //     }
    //     /*打印最后一个数据的连续出现次数*/
    //     cout << currVal << " occurs " << cnt << " times. " << endl;
    // }

    // unsigned int tmp = 0;
    // tmp = 10 << 24;
    // printf("%u\n", tmp);
    // tmp = (255 << 24) + (255 << 16) + (255 << 8) + 255;
    // printf("%u\n", tmp);
    // unsigned int low_24_one = (255 << 16) + (255 << 8) + 255;
    // unsigned int tmp = 168452706;
    // tmp <= (10 << 24) + low_24_one;

    // unsigned int maskCode = (unsigned int) (255 << 24);
    // unsigned int tmp = ~maskCode + 1;
    // cout << ((tmp & (~maskCode)) == 0) << endl;

    // int low_8_one = 255;
    // int low_16_one = (255 << 8) + low_8_one;
    // int low_24_one = (255 << 16) + low_16_one;
    // cout << ((low_24_one + (255 << 24)) == (unsigned)-1) << endl;

    // string str1 = "hello";
    // string str2 = "hello";
    // // ==也有重载
    // cout << (str1 == str2) << endl;

    // string str = "he";
    // str.push_back('l');
    // cout << str << endl;

    string a = "abcdefghigklmn";
    string b = "def";
    string c = "123";
    string::size_type idx;
    idx = a.find(b);         // 在a中查找b.
    if (idx == string::npos) // 不存在。
        cout << "not found\n";
    else // 存在。
        cout << "found at " << idx << endl;
    idx = a.find(c);         // 在a中查找c。
    if (idx == string::npos) // 不存在。
        cout << "not found\n";
    else // 存在。
        cout << "found at " << idx << endl;

    return 0;
}

void hjcode1()
{
    int N, m;
    cin >> N >> m;
    // 由于价格是10的整数倍，处理一下以降低空间/时间复杂度
    N /= 10;
    vector<vector<int>> prices(61, vector<int>(3, 0));                // 价格
    vector<vector<int>> priceMultiplyPriority(61, vector<int>(3, 0)); // 重要程度
    for (int i = 1; i <= m; ++i)
    {
        int a, b, c;
        cin >> a >> b >> c;
        a /= 10;
        b *= a;
        if (c == 0)
        {
            prices[i][0] = a;
            priceMultiplyPriority[i][0] = b;
        }
        else
        {
            if (prices[c][1] == 0)
            {
                prices[c][1] = a;
                priceMultiplyPriority[c][1] = b;
            }
            else
            {
                prices[c][2] = a;
                priceMultiplyPriority[c][2] = b;
            }
        }
    }
    // 使用分组背包
    vector<vector<int>> dp(m + 1, vector<int>(N + 1, 0));
    for (int i = 1; i <= m; ++i)
    {
        for (int j = 1; j <= N; ++j)
        {
            int a = prices[i][0], b = priceMultiplyPriority[i][0];
            int c = prices[i][1], d = priceMultiplyPriority[i][1];
            int e = prices[i][2], f = priceMultiplyPriority[i][2];
            dp[i][j] = j >= a ? max(dp[i - 1][j - a] + b, dp[i - 1][j]) : dp[i - 1][j];
            dp[i][j] = j >= (a + c) ? max(dp[i - 1][j - a - c] + b + d, dp[i][j]) : dp[i][j];
            dp[i][j] = j >= (a + e) ? max(dp[i - 1][j - a - e] + b + f, dp[i][j]) : dp[i][j];
            dp[i][j] = j >= (a + c + e) ? max(dp[i - 1][j - a - c - e] + b + d + f, dp[i][j]) : dp[i][j];
        }
    }
    cout << dp[m][N] * 10 << endl;
}