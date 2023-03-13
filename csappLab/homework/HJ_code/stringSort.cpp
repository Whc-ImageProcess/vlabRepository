#include <iostream>
#include <string>
#include <map>
using namespace std;

// HJ26 字符串排序
int main()
{
    string str;
    getline(cin, str);

    // 构建一个multimap，key为char，value为index
    // 大写字母都加上32放到multimap里面
    multimap<char, int> ret;
    int len = str.length();

    for (size_t i = 0; i < len; i++)
    {
        if (str[i] >= 'A' && str[i] <= 'Z')
        {
            ret.insert(make_pair(str[i] + 32, i));
        }
        else if (str[i] >= 'a' && str[i] <= 'z')
        {
            ret.insert(make_pair(str[i], i));
        }
        else
        {
        }
    }

    multimap<char, int>::iterator it = ret.begin();
    for (size_t i = 0; i < len; i++)
    {
        if ((str[i] >= 'A' && str[i] <= 'Z') || (str[i] >= 'a' && str[i] <= 'z'))
        {
            cout << str[it->second];
            ++it;
        }
        else
        {
            cout << str[i];
        }
    }

    cout << endl;
    return 0;
}