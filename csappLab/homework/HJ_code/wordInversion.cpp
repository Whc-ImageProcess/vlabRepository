#include <iostream>
#include <string>
#include <vector>
using namespace std;

// HJ31 单词倒排
int main()
{
    string str;
    vector<string> vec;
    while (cin >> str)
    {
        int len = str.length();
        int right = 0, left = -1;
        for (size_t i = 0; i < len; i++)
        {
            if ((str[i] >= 'A' && str[i] <= 'Z') || (str[i] >= 'a' && str[i] <= 'z'))
            {
                right++;
            }
            else
            {
                if (right - left <= 1)
                {
                    left = right;
                    right++;
                }
                else
                {
                    vec.push_back(str.substr(left + 1, right - left - 1));
                    left = right;
                    right++;
                }
            }
        }
        if (right - left <= 1)
        {
            left = right;
            right++;
        }
        else
        {
            vec.push_back(str.substr(left + 1, right - left - 1));
        }
    }

    int size = vec.size();
    for (int i = size - 1; i >= 0; --i)
    {
        cout << vec[i] << ' ';
    }
    cout << endl;

    return 0;
}