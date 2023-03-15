// 称砝码
/*利用set里面没有重复元素进行去重，需要注意，必须先insert0，否则会丢失情况*/
#include <iostream>
#include <vector>
#include <set>
#include <algorithm>
using namespace std;

int main()
{
    int N;
    while (cin >> N)
    {
        vector<int> weight, count;
        int input;
        for (int i = 0; i < N; ++i)
        {
            cin >> input;
            weight.push_back(input);
        }
        for (int i = 0; i < N; ++i)
        {
            cin >> input;
            count.push_back(input);
        }
        set<int> res = {0}, temp = {0}; // 必须先把0推进去
        // 有N类砝码
        for (int i = 0; i < N; ++i)
        {
            // 每类砝码有count[i]个
            for (int j = 1; j <= count[i]; ++j)
            {

                set<int>::iterator iter = temp.begin();
                while (iter != temp.end())
                {
                    res.insert((j * weight[i] + (*iter)));
                    iter++;
                }
            }
            // temp存储现在已有的砝码重量的种类
            temp = res;
        }
        cout << res.size() << endl;
    }
    return 0;
}