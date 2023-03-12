#include <iostream>
#include <set>
#include <string>
using namespace std;

int main()
{
    string str;
    while (getline(cin, str))
    {
        set<char> set;
        for (auto ch : str)
        {
            set.insert(ch);
        }

        cout << set.size() << endl;
    }

    return 0;
}