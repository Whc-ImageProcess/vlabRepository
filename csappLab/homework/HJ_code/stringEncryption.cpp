#include <iostream>
#include <string>
#include <vector>
using namespace std;

bool isVecContain(vector<char> &vec, char a)
{
    int len = vec.size();
    for (int i = 0; i < len; i++)
    {
        if (vec[i] == a)
        {
            return true;
        }
    }

    return false;
}

int main()
{
    string originalUpperCharTable("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
    string originalLowerCharTable("abcdefghijklmnopqrstuvwxyz");
    char upperCharStart = 'A';
    char lowerCharStart = 'a';

    string secretKey;
    string str;
    string result;
    cin >> secretKey;
    cin >> str;

    // 用于存储不重复的字符，并按照index的顺序尾插
    vector<char> vecUpper, vecLower;
    int len = secretKey.length();
    for (size_t i = 0; i < len; i++)
    {
        if ((secretKey[i] >= 'A' && secretKey[i] <= 'Z') &&
            isVecContain(vecUpper, secretKey[i]) == false)
        {
            vecUpper.push_back(secretKey[i]);
        }
        if ((secretKey[i] >= 'a' && secretKey[i] <= 'z') &&
            isVecContain(vecLower, secretKey[i]) == false)
        {
            vecLower.push_back(secretKey[i]);
        }
    }

    len = originalLowerCharTable.length();
    for (int i = 0; i < len; i++)
    {
        if ((originalLowerCharTable[i] >= 'A' && originalLowerCharTable[i] <= 'Z') &&
            isVecContain(vecUpper, originalLowerCharTable[i]) == false)
        {
            vecUpper.push_back(originalLowerCharTable[i]);
        }
        if ((originalLowerCharTable[i] >= 'a' && originalLowerCharTable[i] <= 'z') &&
            isVecContain(vecLower, originalLowerCharTable[i]) == false)
        {
            vecLower.push_back(originalLowerCharTable[i]);
        }
    }

    len = str.length();
    for (int i = 0; i < len; i++)
    {
        if (str[i] >= 'A' && str[i] <= 'Z')
        {
            int index = str[i] - upperCharStart;
            result.push_back(vecUpper[index]);
        }
        if (str[i] >= 'a' && str[i] <= 'z')
        {
            int index = str[i] - lowerCharStart;
            result.push_back(vecLower[index]);
        }
    }

    cout << result << endl;
    return 0;
}
