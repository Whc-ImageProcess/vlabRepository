#include <iostream>
#include <string>
#include <set>
using namespace std;

// HJ30 字符串合并处理
int main()
{
    string str;
    string str1;
    string str2;
    cin >> str1;
    cin >> str2;
    str = str1 + str2;
    int len = str.length();
    // 偶数位集合
    set<char> set1;
    // 奇数位集合
    set<char> set2;
    for (size_t i = 0; i < len; i += 2)
    {
        set1.insert(str[i]);
    }
    for (size_t i = 1; i < len; i += 2)
    {
        set2.insert(str[i]);
    }

    set<char>::iterator index1 = set1.begin(), index2 = set2.begin();
    for (size_t i = 0; i < len; i += 2)
    {
        str[i] = *index1;
        str[i + 1] = *index2;
        ++index1;
        ++index2;
    }
    if (len % 2 != 0)
    {
        str[len - 1] = *index1;
    }

    const string ss = "abcedfABCEDF0123456789";
    const string sa = "5D37BF5D37BF084C2A6E19";
    for (size_t i = 0; i < len; i++)
    {
        string::size_type index = ss.find(str[i]);
        if (index != string::npos)
        {
            str[i] = sa[index];
        }
        else
        {
            ;
        }
    }

    cout << str << endl;

    return 0;
}