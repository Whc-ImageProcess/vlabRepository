#include <iostream>
#include <map>
#include <set>
using namespace std;

int main()
{
    int a, b, num;
    map<int, int> hashMap;
    
    if (cin >> num)
    {
        while (cin >> a >> b)
        {
            map<int, int>::iterator it = hashMap.find(a);
            if (it != hashMap.end())
            {
                it->second += b;
            }
            else
                hashMap.insert(make_pair(a, b));
        }

        for (map<int, int>::iterator i = hashMap.begin(); i != hashMap.end(); ++i)
        {
            cout << i->first << " " << i->second << endl;
        }
    }

    return 0;
}