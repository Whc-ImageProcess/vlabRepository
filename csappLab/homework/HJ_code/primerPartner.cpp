#include <iostream>
#include <vector>
#include <math.h>
using namespace std;

bool isPrimer(int val)
{
    int boundary = sqrt(val);
    for (size_t i = 2; i <= boundary; i++)
    {
        if (val % i == 0)
        {
            return false;
        }
    }

    return true;
}

// HJ28 素数伴侣
int main()
{
    int n;
    int data;
    cin >> n;
    vector<int> vec;
    vec.resize(n);
    for (size_t i = 0; i < n; i++)
    {
        cin >> data;
        vec[i] = data;
    }

    // 素数伴侣对数
    int k = 0;
    int tmp;
    // 重复的数不能够再次使用
    for (size_t i = 0; i < n; i++)
    {
        for (size_t j = i + 1; j < n; j++)
        {
            if (isPrimer(vec[i] + vec[j]))
            {
                k++;
            }
        }
    }

    cout << k << endl;

    return 0;
}