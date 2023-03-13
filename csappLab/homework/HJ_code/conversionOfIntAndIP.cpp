#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

// HJ33 整数与IP地址间的转换
int main()
{
    string str1, str2;
    cin >> str1;
    cin >> str2;
    string::size_type idx = str1.find('.');
    if (idx == string::npos)
    {
        unsigned int mask1 = 0xFF;
        unsigned int mask2 = 0xFF00;
        unsigned int mask3 = 0xFF0000;
        unsigned int mask4 = 0xFF000000;
        int tmp = stol(str1);
        int ip1 = tmp & mask1;
        int ip2 = (tmp & mask2) >> 8;
        int ip3 = (tmp & mask3) >> 16;
        int ip4 = (tmp & mask4) >> 24;
        cout << ip4 << '.' << ip3 << '.' << ip2 << '.' << ip1 << endl;
    }
    else
    {
        auto idx2 = str1.find('.', idx + 1);
        auto idx3 = str1.rfind('.');
        int ip4 = stol(str1.substr(0, idx));
        int ip3 = stol(str1.substr(idx + 1, idx2 - idx - 1));
        int ip2 = stol(str1.substr(idx2 + 1, idx3 - idx2 - 1));
        int ip1 = stol(str1.substr(idx3 + 1, str1.length() - idx3));
        unsigned int ip = (ip4 << 24) + (ip3 << 16) + (ip2 << 8) + ip1;
        cout << ip << endl;
    }

    idx = str2.find('.');
    if (idx == string::npos)
    {
        unsigned int mask1 = 0xFF;
        unsigned int mask2 = 0xFF00;
        unsigned int mask3 = 0xFF0000;
        unsigned int mask4 = 0xFF000000;
        int tmp = stol(str2);
        int ip1 = tmp & mask1;
        int ip2 = (tmp & mask2) >> 8;
        int ip3 = (tmp & mask3) >> 16;
        int ip4 = (tmp & mask4) >> 24;
        cout << ip4 << '.' << ip3 << '.' << ip2 << '.' << ip1 << endl;
    }
    else
    {
        auto idx2 = str2.find('.', idx + 1);
        auto idx3 = str2.rfind('.');
        int ip4 = stol(str2.substr(0, idx));
        int ip3 = stol(str2.substr(idx + 1, idx2 - idx - 1));
        int ip2 = stol(str2.substr(idx2 + 1, idx3 - idx2 - 1));
        int ip1 = stol(str2.substr(idx3 + 1, str2.length() - idx3));
        unsigned int ip = (ip4 << 24) + (ip3 << 16) + (ip2 << 8) + ip1;
        cout << ip << endl;
    }

    return 0;
}