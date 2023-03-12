#include <iostream>
#include <string>
using namespace std;

int main()
{
    string str;
    getline(cin, str);
    char tmp;
    int strLen = str.length();
    int i;

    for (i = 0; i < (strLen >> 1); i++)
    {
        tmp = str[i];
        str[i] = str[strLen - 1 - i];
        str[strLen - 1 - i] = tmp;
    }

    cout << str << endl;

    return 0;
}