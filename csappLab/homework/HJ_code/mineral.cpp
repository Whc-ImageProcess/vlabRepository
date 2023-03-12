#include <iostream>
#include <string>
using namespace std;

// HJ22 汽水瓶
int main()
{
    int num;

    while (cin >> num)
    {
        if (num == 0)
        {
            break;
        }
        cout << num / 2 << endl;
    }

    return 0;
}