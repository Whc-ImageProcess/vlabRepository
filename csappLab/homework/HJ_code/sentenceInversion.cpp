#include <iostream>
#include <string>

using namespace std;

int main()
{
    string str;
    int left, right;
    getline(cin, str);

    left = str.length() - 1;
    right = left;
    for (size_t i = str.length() - 1; i >= 0; --i)
    {
        if (str[i] != ' ')
        {
            if (left == right)
            {
                left--;
                right--;
            }
            else
            {
                cout << str.substr(left + 1, right - left) << " ";
            }
        }
        else
        {
            left--;
        }
    }

    return 0;
}