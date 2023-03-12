#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

int main()
{
    int num;
    cin >> num;
    string str;
    str = to_string(num);
    reverse(str.begin(), str.end());
    cout << str << endl;

    return 0;
}