#include <iostream>
#include <stdlib.h>
#include <set>
#include <unordered_map>

using namespace std;

int main()
{
    int sum = 0, tmp;
    cin >> sum;
    if (sum <= 0 || sum >= 1000)
    {
        return 0;
    }
    set<int> s;

    for (size_t i = 0; i < sum; i++)
    {
        cin >> tmp;
        s.insert(tmp);
    }

    for (set<int>::iterator it = s.begin(); it != s.end(); ++it)
    {
        cout << *it << endl;
    }

    return 0;
}