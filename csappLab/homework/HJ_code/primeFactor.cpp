#include <iostream>
#include <set>
#include <cmath>
using namespace std;

int main()
{
    unsigned int a;
    size_t i;
    // 2000000014
    if (cin >> a)
    {
        multiset<int> set;
        i = 2;
        int tmp = sqrt(a);
        // 有点讨巧了，从2开始除，2、3、5肯定是质数的，4不是，但是前面我是while，选择除完2之后再去
        // 除2，所以4会被分解成两个2，依次类推。
        // 如果这时候i大于a/2了，因为a是2的倍数的话前面肯定分解出来2的的因子的
        while (i <= tmp)
        {
            if (a == 1)
            {
                break;
            }

            if (a % i == 0)
            {
                // 这个应该不是影响程序性能的关键，因子的数量跟a肯定不成正比
                set.insert(i);
                a /= i;
                tmp = sqrt(a);
            }
            else
            {
                i++;
            }
        }

        // 这里补一个判断，可以减少上面a/2量级的循环次数
        if (a != 1)
        {
            set.insert(a);
        }

        for (multiset<int>::iterator it = set.begin(); it != set.end(); ++it)
        {
            cout << *it << " ";
        }
        cout << endl;
    }

    return 0;
}