#include <iostream>
#include <set>
#include <vector>
using namespace std;

int main()
{
    int a, ret = 0;
    size_t i, num;

    while (cin >> a)
    {
        vector<int> vec;
        while (a != 0)
        {
            int tmp = a % 10;
            num = vec.size();
            for (i = 0; i < num; ++i)
            {
                if (vec[i] == tmp)
                {
                    break;
                }
            }
            if (i == num)
                vec.push_back(tmp);
            a /= 10;
        }

        num = vec.size();
        for (i = 0; i < num; ++i)
        {
            ret = ret * 10 + vec[i];
        }

        cout << ret << endl;
        ret = 0;

        cin.get();
    }

    return 0;
}