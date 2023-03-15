#include <iostream>
#include <vector>
using namespace std;

// HJ103 Redraiment的走法
int main()
{
    int n, val;
    cin >> n;
    vector<int> vec;
    for (size_t i = 0; i < n; i++)
    {
        cin >> val;
        vec.push_back(val);
    }

    int maxLen = 0;
    vector<int>::iterator idx = vec.begin();
    for (int i = 0; i < n; i++)
    {
        // 从vec[i]出发从前到后起跳，找到递增序列最长的
        // 可以将从i往后的数据进行排序

        int cmp = vec[i];
        int len = 1;
        vector<int>::iterator idxTmp = idx;
        // 找到比vec[i]大的最长的递增序列
        while (idxTmp != vec.end())
        {
            if (*idxTmp > cmp)
            {
                len++;
                ++idxTmp;
                cmp = *idxTmp;
            }
            else
            {
                ++idxTmp;
            }
        }
        if (len > maxLen)
        {
            maxLen = len;
        }

        // 更新为下一个
        ++idx;
    }

    cout << maxLen << endl;
    return 0;
}
