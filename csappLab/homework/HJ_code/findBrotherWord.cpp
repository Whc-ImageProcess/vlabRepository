#include <iostream>
#include <string>
#include <vector>
#include <set>
using namespace std;

bool isBrotherWords(string str1, string str2)
{
    if (str1.length() != str2.length())
    {
        return false;
    }
    // 字符串完全一样并不是兄弟单词
    if (str1 == str2)
    {
        return false;
    }

    unsigned int sum1 = 0, sum2 = 0;
    int len = str1.size();
    for (size_t i = 0; i < len; i++)
    {
        sum1 += str1[i];
        sum2 += str2[i];
        // adbcb 和acbcc，你可以在adbcb中找到abc，但是你不能再acbcc中找到d
        //  恰巧的是他们俩加和还是一样的
        if ((str1.find(str2[i]) == string::npos) || (str2.find(str1[i]) == string::npos))
        {
            return false;
        }
    }

    // 判断加和的结果，主要是因为abb和aab这样的情况，字符互相都是能找到的，但是加和结果不一样
    return (sum1 == sum2) ? true : false;
}

// HJ27 查找兄弟单词
int main()
{
    int numberOfWords;
    string word;
    vector<string> words;
    cin >> numberOfWords;
    for (size_t i = 0; i < numberOfWords; i++)
    {
        cin >> word;
        words.push_back(word);
    }
    string wordx;
    int k;
    cin >> wordx;
    cin >> k;

    multiset<string> set;
    for (size_t i = 0; i < numberOfWords; i++)
    {
        if (isBrotherWords(wordx, words[i]))
        {
            set.insert(words[i]);
        }
    }

    int len = set.size();
    cout << len << endl;
    if (k > len)
    {
        return 0;
    }

    multiset<string>::iterator it = set.begin();
    for (size_t i = 1; i < k; i++)
    {
        ++it;
    }
    cout << *it << endl;

    return 0;
}