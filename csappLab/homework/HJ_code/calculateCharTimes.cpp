#include <iostream>
#include <string>
using namespace std;

int main()
{
    string str;
    // 声明两个用于匹配的字符，且mode2要保证不为数字，字符或者空格
    char mode, mode2 = EOF;
    // 测试的输入必须写在同一行;cin过程中输入空格会断掉输入
    while (getline(cin, str) && cin >> mode)
    {
        int count = 0;
        if (mode <= 'Z' && mode >= 'A')
        {
            mode2 = mode + 32;
        }
        if (mode <= 'z' && mode >= 'a')
        {
            mode2 = mode - 32;
        }

        for (size_t i = 0; i < str.length(); i++)
        {
            if (str[i] == mode || str[i] == mode2)
            {
                count++;
            }
        }
        cout << count << endl;
    }
    return 0;
}