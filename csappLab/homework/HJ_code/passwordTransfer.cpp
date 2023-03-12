#include <iostream>
#include <string>

using namespace std;

// HJ21 简单密码
int main()
{
    string password;

    if (cin >> password)
    {
        int len = password.length() - 1;
        for (size_t i = 0; i <= len; i++)
        {
            // 要先去判断小写字母，因为大写字母转换时变成小写字母
            if (password[i] >= 'a' && password[i] <= 'c')
            {
                password[i] = '0' + 2;
            }
            else if (password[i] >= 'd' && password[i] <= 'f')
            {
                password[i] = '0' + 3;
            }
            else if (password[i] >= 'g' && password[i] <= 'i')
            {
                password[i] = '0' + 4;
            }
            else if (password[i] >= 'j' && password[i] <= 'l')
            {
                password[i] = '0' + 5;
            }
            else if (password[i] >= 'm' && password[i] <= 'o')
            {
                password[i] = '0' + 6;
            }
            else if (password[i] >= 'p' && password[i] <= 's')
            {
                password[i] = '0' + 7;
            }
            else if (password[i] >= 't' && password[i] <= 'v')
            {
                password[i] = '0' + 8;
            }
            else if (password[i] >= 'w' && password[i] <= 'z')
            {
                password[i] = '0' + 9;
            }
            else if (password[i] == 'Z')
            {
                password[i] = 'a';
            }
            else if (password[i] <= 'Y' && password[i] >= 'A')
            {
                password[i] += 33;
            }
            else
            {
                ;
            }
        }
    }

    cout << password << endl;
    return 0;
}