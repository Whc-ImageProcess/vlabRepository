#include <iostream>
#include <string>
using namespace std;

int main()
{
    string str;
    size_t i, num;

    while (getline(cin, str))
    {
        num = str.length() / 8;
        for (i = 0; i < num; i++)
        {
            cout << str.substr(i * 8, 8) << endl;
        }
        if (str.length() % 8 != 0)
        {
            // str的函数substr() 函数用于从 string 字符串中提取子字符串，它的原型为：
            // string substr (size_t pos = 0, size_t len = npos) const;
            // pos 为要提取的子字符串的起始下标，len 为要提取的子字符串的长度。
            cout << str.substr(num * 8, str.length() - num * 8);
            num = (num + 1) * 8 - str.length();
            for (i = 0; i < num; i++)
            {
                cout << "0";
            }
        }
    }

    return 0;
}