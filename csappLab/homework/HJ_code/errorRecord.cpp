#include <iostream>
#include <string>
#include <unordered_map>
#include <vector>
#include <algorithm>
using namespace std;

// HJ19 简单错误记录
int main()
{
    // 接收文件名和行号
    string filename;
    int col;

    // 使用数组的下标作为文件第一次出现的顺序
    vector<string> vec;
    // 记录错误出现的行号，字符串和行号对才具有唯一性
    unordered_map<string, int> colHashMap;
    // 第一个int为下标，即文件第一次出现的顺序,这个具有唯一性，第二个int为行号
    unordered_map<int, int> indexHashMap;
    // 记录文件出现的次数
    vector<int> times;

    while (cin >> filename >> col)
    {
        int len = filename.length();
        int pos = filename.rfind('\\', len - 1);

        unordered_map<string, int>::iterator itC;
        string str;
        // 截取文件名的最后16个字符
        if (len - pos - 1 <= 16)
        {
            str = filename.substr(pos + 1, len - pos - 1);
        }
        else
        {
            str = filename.substr(len - 16, 16);
        }

        itC = colHashMap.find(str);

        if (itC != colHashMap.end())
        {
            if (itC->second == col)
            {
                vector<string>::iterator it = find(vec.begin(), vec.end(), str);
                int index = it - vec.begin();
                times[index]++;
            }
            else
            {
                vec.push_back(str);
                colHashMap.insert(make_pair(str, col));
                indexHashMap.insert(make_pair(vec.size() - 1, col));
                times.push_back(1);
            }
        }
        else
        {
            vec.push_back(str);
            colHashMap.insert(make_pair(str, col));
            indexHashMap.insert(make_pair(vec.size() - 1, col));
            times.push_back(1);
        }
    }

    int size = vec.size();
    int start = 0;
    string strTmp;
    int colTmp;
    int timesTmp;
    if (size <= 8)
    {
        start = 0;
    }
    else
    {
        start = size - 8;
    }
    for (size_t i = start; i < size; i++)
    {
        strTmp = vec[i];
        colTmp = indexHashMap.find(i)->second;
        timesTmp = times[i];
        cout << strTmp << ' ' << colTmp << ' ' << timesTmp << endl;
    }

    return 0;
}