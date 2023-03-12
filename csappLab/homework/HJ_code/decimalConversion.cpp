#include <iostream>
#include <string>
using namespace std;

int main()
{
    string str;
    size_t num = 0, i;
    int ret = 0, tmp;
    char charTmp;
    while (getline(cin, str))
    {
        num = str.length() - 2;
        for (i = 0; i < num; i++)
        {
            charTmp = str[num + 1 - i];
            if (charTmp <= 'F' && charTmp >= 'A')
            {
                tmp = charTmp - 55;
            }
            else if(charTmp <= 'f' && charTmp >= 'a')
            {
                tmp = charTmp - 87;
            }
            else if (charTmp <= '9' && charTmp >= '0')
            {
                tmp = atoi(&charTmp);
            }
            else
            {
                return -1;
            }
            ret += tmp << (i * 4);
        }
        cout << ret << endl;
        ret = 0;
    }

    return 0;
}
