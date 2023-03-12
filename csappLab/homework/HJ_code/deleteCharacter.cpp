#include <iostream>
#include <string>
#include <unordered_map>
using namespace std;

// HJ23 删除字符串中出现次数最少的字符
int main()
{
    string str;
    // // 作为记录26个小写英文字母出现的次数
    // int times[26] = {0};
    // 记录当前串中出现次数最少的字符的次数
    int minimumTimes = 0;
    // key为字符，value为出现的频次
    unordered_map<char, int> hashMap;

    if (cin >> str)
    {
        int len = str.length();
        for (size_t i = 0; i < len; i++)
        {
            // times[str[i] - 'a']++;
            unordered_map<char, int>::iterator it = hashMap.find(str[i]);
            if (it == hashMap.end())
            {
                hashMap.insert(make_pair(str[i], 1));
            }
            else
            {
                it->second++;
            }
        }

        minimumTimes = hashMap.begin()->second;
        // 找到出现频次最少的字符的频次数
        for (unordered_map<char, int>::iterator it = hashMap.begin(); it != hashMap.end(); ++it)
        {
            if (minimumTimes > it->second)
            {
                minimumTimes = it->second;
            }
        }

        string ret;
        for (size_t i = 0; i < len; i++)
        {
            unordered_map<char, int>::iterator it = hashMap.find(str[i]);
            if (it->second == minimumTimes)
            {
                continue;
            }
            else
            {
                ret.push_back(str[i]);
            }
        }
        cout << ret << endl;
    }

    return 0;
}