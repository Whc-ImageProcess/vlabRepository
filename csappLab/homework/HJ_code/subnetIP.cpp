#include <iostream>

using namespace std;

#define ERRIPORMASK 1
#define SAMESUBNET 0
#define UNSAMESUBNET 2

int main()
{
    string maskStr;
    string ip1Str;
    string ip2Str;
    char bitSplit = '.';

    while (cin >> maskStr >> ip1Str >> ip2Str)
    {
        unsigned int ip1Address;
        unsigned int ip2Address;
        unsigned int maskCode;
        unsigned int maskBlock[4] = {0};
        unsigned int ip1Block[4] = {0};
        unsigned int ip2Block[4] = {0};

        int point1, point2, point3;
        point1 = maskStr.find(bitSplit, 0);
        if (point1 <= 0)
        {
            cout << ERRIPORMASK << endl;
            continue;
        }
        else
        {
            maskBlock[3] = stoi(maskStr.substr(0, point1));
            if (maskBlock[3] >= 256)
            {
                cout << ERRIPORMASK << endl;
                continue;
            }
        }

        point2 = maskStr.find(bitSplit, point1 + 1);
        if (point2 - point1 - 1 <= 0)
        {
            cout << ERRIPORMASK << endl;
            continue;
        }
        else
        {
            maskBlock[2] = stoi(maskStr.substr(point1 + 1, point2 - point1 - 1));
            if (maskBlock[2] >= 256)
            {
                cout << ERRIPORMASK << endl;
                continue;
            }
        }

        point3 = maskStr.find(bitSplit, point2 + 1);
        if (point3 - point2 - 1 <= 0)
        {
            cout << ERRIPORMASK << endl;
            continue;
        }
        else
        {
            maskBlock[1] = stoi(maskStr.substr(point2 + 1, point3 - point2 - 1));
            if (maskBlock[1] >= 256)
            {
                cout << ERRIPORMASK << endl;
                continue;
            }
        }

        if (maskStr.length() - point3 <= 0)
        {
            cout << ERRIPORMASK << endl;
            continue;
        }
        else
        {
            maskBlock[0] = stoi(maskStr.substr(point3 + 1, maskStr.length() - point3));
            if (maskBlock[0] >= 256)
            {
                cout << ERRIPORMASK << endl;
                continue;
            }
        }

        maskCode = maskBlock[0] + (maskBlock[1] << 8) + (maskBlock[2] << 16) + (maskBlock[3] << 24);
        // 如果tmp不是高位全是1地位全是0的形式就说明其为errMask，其中全1全0也是errMask
        if (maskCode == (unsigned int)(-1) || maskCode == 0)
        {
            cout << ERRIPORMASK << endl;
            continue;
        }
        // 高位全1低位全0时，按位取反＋1之后只有一个1，此时取(~tmp+1)&(~tmp) == 0
        if ((((~maskCode) + 1) & (~maskCode)) != 0)
        {
            // 掩码错误
            cout << ERRIPORMASK << endl;
            continue;
        }

        point1 = ip1Str.find(bitSplit, 0);
        if (point1 <= 0)
        {
            cout << ERRIPORMASK << endl;
            continue;
        }
        else
        {
            ip1Block[3] = stoi(ip1Str.substr(0, point1));
            if (ip1Block[3] >= 256)
            {
                cout << ERRIPORMASK << endl;
                continue;
            }
        }

        point2 = ip1Str.find(bitSplit, point1 + 1);
        if (point2 - point1 - 1 <= 0)
        {
            cout << ERRIPORMASK << endl;
            continue;
        }
        else
        {
            ip1Block[2] = stoi(ip1Str.substr(point1 + 1, point2 - point1 - 1));
            if (ip1Block[2] >= 256)
            {
                cout << ERRIPORMASK << endl;
                continue;
            }
        }

        point3 = ip1Str.find(bitSplit, point2 + 1);
        if (point3 - point2 - 1 <= 0)
        {
            cout << ERRIPORMASK << endl;
            continue;
        }
        else
        {
            ip1Block[1] = stoi(ip1Str.substr(point2 + 1, point3 - point2 - 1));
            if (ip1Block[1] >= 256)
            {
                cout << ERRIPORMASK << endl;
                continue;
            }
        }

        if (ip1Str.length() - point3 <= 0)
        {
            cout << ERRIPORMASK << endl;
            continue;
        }
        else
        {
            ip1Block[0] = stoi(ip1Str.substr(point3 + 1, ip1Str.length() - point3));
            if (ip1Block[0] >= 256)
            {
                cout << ERRIPORMASK << endl;
                continue;
            }
        }
        ip1Address = ip1Block[0] + (ip1Block[1] << 8) + (ip1Block[2] << 16) + (ip1Block[3] << 24);

        point1 = ip2Str.find(bitSplit, 0);
        if (point1 <= 0)
        {
            cout << ERRIPORMASK << endl;
            continue;
        }
        else
        {
            ip2Block[3] = stoi(ip2Str.substr(0, point1));
            if (ip2Block[3] >= 256)
            {
                cout << ERRIPORMASK << endl;
                continue;
            }
        }

        point2 = ip2Str.find(bitSplit, point1 + 1);
        if (point2 - point1 - 1 <= 0)
        {
            cout << ERRIPORMASK << endl;
            continue;
        }
        else
        {
            ip2Block[2] = stoi(ip2Str.substr(point1 + 1, point2 - point1 - 1));
            if (ip2Block[2] >= 256)
            {
                cout << ERRIPORMASK << endl;
                continue;
            }
        }

        point3 = ip2Str.find(bitSplit, point2 + 1);
        if (point3 - point2 - 1 <= 0)
        {
            cout << ERRIPORMASK << endl;
            continue;
        }
        else
        {
            ip2Block[1] = stoi(ip2Str.substr(point2 + 1, point3 - point2 - 1));
            if (ip2Block[1] >= 256)
            {
                cout << ERRIPORMASK << endl;
                continue;
            }
        }

        if (ip2Str.length() - point3 <= 0)
        {
            cout << ERRIPORMASK << endl;
            continue;
        }
        else
        {
            ip2Block[0] = stoi(ip2Str.substr(point3 + 1, ip1Str.length() - point3));
            if (ip2Block[0] >= 256)
            {
                cout << ERRIPORMASK << endl;
                continue;
            }
        }
        ip2Address = ip2Block[0] + (ip2Block[1] << 8) + (ip2Block[2] << 16) + (ip2Block[3] << 24);

        if ((maskCode & ip1Address) == (maskCode & ip2Address))
        {
            cout << SAMESUBNET << endl;
        }
        else
        {
            cout << UNSAMESUBNET << endl;
        }
    }

    return 0;
}