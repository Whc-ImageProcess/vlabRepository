#include <iostream>
#include <string>
#include <set>
using namespace std;

int main()
{
    int n;
    string str;
    cin >> n;
    multiset<string> set;
    for (size_t i = 0; i < n; i++)
    {
        cin >> str;
        set.insert(str);
    }
    
    for(string tmp : set)
    {
        cout << tmp << endl;
    }

    return 0;
}