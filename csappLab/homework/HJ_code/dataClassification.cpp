#include <iostream>
#include <string>
#include <set>
#include <vector>
using namespace std;

int main()
{
    int num;
    // 关于我为什么要用字符串存储整形数据，只是我感觉，在一个整形中查看是否包含
    // 另外一个整形串，没有直接用字符串的find方法找起来方便
    string tmpData;
    vector<string> data;
    set<int> hashSet;

    // 输入R
    cin >> num;
    for (size_t i = 0; i < num; i++)
    {
        cin >> tmpData;
        data.push_back(tmpData);
    }

    // 输入I
    cin >> num;
    for (size_t i = 0; i < num; i++)
    {
        cin >> tmpData;
        hashSet.insert(stoi(tmpData));
    }

    // 最终要输出的串的总数
    int sum = 0;
    // 最终输出结果
    // multimap<int, string> ret;
    vector<int> intVec;
    vector<string> strVec;
    vector<int> numberOfStr;
    for (set<int>::iterator it = hashSet.begin(); it != hashSet.end(); ++it)
    {
        int number = 0;
        for (size_t i = 0; i < data.size(); i++)
        {
            string::size_type idx = data[i].find(to_string(*it));
            if (idx != string::npos)
            {
                number++;
                intVec.push_back(i);
                strVec.push_back(data[i]);
            }
        }
        numberOfStr.push_back(number);
    }

    int len = numberOfStr.size();
    for (size_t i = 0; i < len; i++)
    {
        if (numberOfStr[i] != 0)
        {
            sum = sum + 2 + ((numberOfStr[i]) << 1);
        }
    }

    cout << sum << " ";
    int index = 0;
    set<int>::iterator it = hashSet.begin();
    for (size_t i = 0; i < len; i++)
    {
        if (numberOfStr[i] != 0)
        {
            cout << *it << " " << numberOfStr[i] << " ";
            for (size_t j = 0; j < numberOfStr[i]; j++)
            {
                cout << intVec[index] << " " << strVec[index] << " ";
                index++;
            }
        }
        ++it;
    }

    return 0;
}