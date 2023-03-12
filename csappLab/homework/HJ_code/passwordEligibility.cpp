#include <iostream>
#include <string>
using namespace std;

// HJ20 密码验证合格程序
int main()
{
    string password;
    // 符号大写字母是一类，小写字母是一类，其他符号是一类，数字是一类
    // 必须要包括三种或者三种以上
    int capital = 0;
    int lowerCase = 0;
    int number = 0;
    int otherSymbol = 0;
    int symbolType = 0;
    char ngFlag = 1;

    while (cin >> password)
    {
        if (password.length() <= 8)
        {
            cout << "NG" << endl;
            continue;
        }

        int i;
        int boundary = password.length() - 4;
        // 不能有长度大于2的包含公共元素的子串重复 （注：其他符号不含空格或换行）
        for (i = 0; i < boundary; i++)
        {
            if (password[i] <= 'Z' && password[i] >= 'A')
            {
                capital++;
            }
            else if (password[i] <= 'z' && password[i] >= 'a')
            {
                lowerCase++;
            }
            else if (password[i] <= '9' && password[i] >= '0')
            {
                number++;
            }
            else if (password[i] == '\n' || password[i] == ' ')
            {
                ngFlag = 0;
                break;
            }
            else
            {
                otherSymbol++;
            }

            // 取巧的话就是从当前位置开始的三个字符与后面的字符进行比较，一旦有一样的字符串
            // 就直接ngFlag = 0，然后break。
            int j;
            for (j = i + 1; j < password.length() - 1; j++)
            {
                if (password.substr(i, 3) == password.substr(j, 3))
                {
                    ngFlag = 0;
                    break;
                }
            }

            if (ngFlag == 0)
            {
                break;
            }
        }

        for (i = boundary; i < password.length(); i++)
        {
            if (password[i] <= 'Z' && password[i] >= 'A')
            {
                capital++;
            }
            else if (password[i] <= 'z' && password[i] >= 'a')
            {
                lowerCase++;
            }
            else if (password[i] <= '9' && password[i] >= '0')
            {
                number++;
            }
            else if (password[i] == '\n' || password[i] == ' ')
            {
                ngFlag = 0;
                break;
            }
            else
            {
                otherSymbol++;
            }
        }

        if (ngFlag == 0)
        {
            ngFlag = 1;
            capital = lowerCase = number = otherSymbol = 0;
            cout << "NG" << endl;
            continue;
        }

        if ((capital == 0 && lowerCase == 0) || (number == 0 && otherSymbol == 0) || (capital == 0 && number == 0) || (capital == 0 && otherSymbol == 0) || (lowerCase == 0 && number == 0) || (lowerCase == 0 && otherSymbol == 0))
        {
            capital = lowerCase = number = otherSymbol = 0;
            cout << "NG" << endl;
            continue;
        }

        capital = lowerCase = number = otherSymbol = 0;
        cout << "OK" << endl;
    }

    return 0;
}