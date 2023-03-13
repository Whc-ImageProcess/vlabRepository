#include <iostream>
#include <string>
using namespace std;

// HJ29 字符串加解密
int main()
{
    // 待加密的字符串
    string enStr;
    // 加密过后的字符串
    string deStr;
    // 'a'的ascii为97，'A'的ascii为65
    cin >> enStr;
    cin >> deStr;

    int len = enStr.size();
    for (size_t i = 0; i < len; i++)
    {
        if (enStr[i] >= 'a' && enStr[i] < 'z')
        {
            enStr[i] -= 31;
        }
        else if (enStr[i] == 'z')
        {
            enStr[i] = 'A';
        }
        else if (enStr[i] >= 'A' && enStr[i] < 'Z')
        {
            enStr[i] += 33;
        }
        else if (enStr[i] == 'Z')
        {
            enStr[i] = 'a';
        }
        else if (enStr[i] >= '0' && enStr[i] < '9')
        {
            enStr[i] += 1;
        }
        else if (enStr[i] == '9')
        {
            enStr[i] = '0';
        }
        else
        {
        }
    }

    len = deStr.length();
    for (size_t i = 0; i < len; i++)
    {
        if (deStr[i] == 'A')
        {
            deStr[i] = 'z';
        }
        else if (deStr[i] >= 'B' && deStr[i] <= 'Z')
        {
            deStr[i] += 31;
        }
        else if (deStr[i] == 'a')
        {
            deStr[i] = 'Z';
        }
        else if (deStr[i] >= 'b' && deStr[i] <= 'z')
        {
            deStr[i] -= 33;
        }

        else if (deStr[i] == '0')
        {
            deStr[i] = '9';
        }
        else if (deStr[i] >= '1' && deStr[i] <= '9')
        {
            deStr[i] -= 1;
        }
        else
        {
        }
    }

    cout << enStr << endl
         << deStr << endl;

    return 0;
}