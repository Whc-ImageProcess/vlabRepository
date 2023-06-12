#include <iostream>
#include <string>
#include <map>
#include <vector>
#include <algorithm>
using namespace std;

// bool cmp(pair<string, int> a, pair<string, int> b)
// {
//     return a.second < b.second;
// }

// HJ102 字符统计
int main()
{
    string input;
    cin >> input;

    int len = input.size();
    map<char, int> map1;
    for (int i = 0; i < len; i++)
    {
        map<char, int>::iterator it = map1.find(input[i]);
        if (it != map1.end())
        {
            it->second++;
        }
        else
        {
            map1.insert(make_pair(input[i], 1));
        }
    }

    vector<pair<char, int>> vec;
    for (map<char, int>::iterator it = map1.begin(); it != map1.end(); ++it)
    {
        vec.push_back(make_pair(it->first, it->second));
    }
    sort(vec.begin(), vec.end(),
         [](const pair<int, int> &x, const pair<int, int> &y) -> int
         {
             return x.second > y.second;
         });

    for (vector<pair<char, int>>::iterator it = vec.begin(); it != vec.end(); ++it)
    {
        cout << it->first;
    }
    cout << endl;

    return 0;
}
