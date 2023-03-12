#include <iostream>
#include <string>
#include <vector>
using namespace std;

// HJ18 识别有效的IP地址和掩码并进行分类统计
int main()
{
    string str;
    // splitting char
    char ipAndMaskSplit = '~';
    char bitSplit = '.';
    // 存储IP地址和掩码
    vector<unsigned int> ip;
    unsigned int ipBlock[4] = {0};
    vector<unsigned int> mask;
    unsigned int maskBlock[4] = {0};
    // 各类别的个数
    int A, B, C, D, E, errIpOrMask, privateIp;
    A = B = C = D = E = errIpOrMask = privateIp = 0;
    int low_8_one = 255;
    int low_16_one = (255 << 8) + low_8_one;
    int low_24_one = (255 << 16) + low_16_one;

    while (cin >> str)
    {
        unsigned int ipAddress;
        unsigned int maskCode;
        int wave, point1, point2, point3, point4, point5, point6;
        int len = str.length();
        wave = str.find(ipAndMaskSplit, 0);
        point1 = str.find_first_of(bitSplit, 0);
        if (point1 <= 0)
        {
            ipBlock[3] = 0;
        }
        else
        {
            ipBlock[3] = stoi(str.substr(0, point1));
        }
        point2 = str.find_first_of(bitSplit, point1 + 1);
        if (point2 - point1 - 1 <= 0)
        {
            ipBlock[2] = 0;
        }
        else
        {
            ipBlock[2] = stoi(str.substr(point1 + 1, point2 - point1 - 1));
        }
        point3 = str.find_first_of(bitSplit, point2 + 1);
        if (point3 - point2 - 1 <= 0)
        {
            ipBlock[1] = 0;
        }
        else
        {
            ipBlock[1] = stoi(str.substr(point2 + 1, point3 - point2 - 1));
        }
        if (wave - point3 - 1 <= 0)
        {
            ipBlock[0] = 0;
        }
        else
        {
            ipBlock[0] = stoi(str.substr(point3 + 1, wave - point3 - 1));
        }
        ipAddress = ipBlock[0] + (ipBlock[1] << 8) + (ipBlock[2] << 16) + (ipBlock[3] << 24);
        ip.push_back(ipAddress);

        point4 = str.find_first_of(bitSplit, wave + 1);
        if (point4 - wave - 1 <= 0)
        {
            maskBlock[3] = 0;
        }
        else
        {
            maskBlock[3] = stoi(str.substr(wave + 1, point4 - wave - 1));
        }
        point5 = str.find_first_of(bitSplit, point4 + 1);
        if (point5 - point4 - 1 <= 0)
        {
            maskBlock[2] = 0;
        }
        else
        {
            maskBlock[2] = stoi(str.substr(point4 + 1, point5 - point4 - 1));
        }
        point6 = str.find_first_of(bitSplit, point5 + 1);
        if (point6 - point5 - 1 <= 0)
        {
            maskBlock[1] = 0;
        }
        else
        {
            maskBlock[1] = stoi(str.substr(point5 + 1, point6 - point5 - 1));
        }
        if (len - point6 - 1 <= 0)
        {
            maskBlock[0] = 0;
        }
        else
        {
            maskBlock[0] = stoi(str.substr(point6 + 1, len - point6 - 1));
        }
        maskCode = maskBlock[0] + (maskBlock[1] << 8) + (maskBlock[2] << 16) + (maskBlock[3] << 24);
        mask.push_back(maskCode);

        // ip地址0开头的和127开头的都不管
        if (ipBlock[3] == 0 || ipBlock[3] == 127)
        {
            continue;
        }

        // 如果tmp不是高位全是1地位全是0的形式就说明其为errMask，其中全1全0也是errMask
        if (maskCode == (unsigned int)(-1) || maskCode == 0)
        {
            errIpOrMask++;
            continue;
        }
        // 高位全1低位全0时，按位取反＋1之后只有一个1，此时取(~tmp+1)&(~tmp) == 0
        if ((((~maskCode) + 1) & (~maskCode)) == 0)
        {
            // 如果ipBlock中有一项为无则说明其为errIp
            if (point1 == 0 || (point2 - point1 - 1) == 0 || (point3 - point2 - 1) == 0 || (wave - point3 - 1) == 0)
            {
                errIpOrMask++;
            }
            else
            {
                // 判断私网IP
                // 私网IP范围是：
                // 从10.0.0.0到10.255.255.255
                // 从172.16.0.0到172.31.255.255
                // 从192.168.0.0到192.168.255.255
                if (ipAddress >= (10 << 24) && ipAddress <= ((10 << 24) + low_24_one))
                {
                    privateIp++;
                }
                if (ipAddress >= ((172 << 24) + (16 << 16)) && ipAddress <= ((172 << 24) + low_8_one))
                {
                    privateIp++;
                }
                if (ipAddress >= ((192 << 24) + (168 << 16)) && ipAddress <= ((192 << 24) + (168 << 16) + low_8_one))
                {
                    privateIp++;
                }

                // 所有的IP地址划分为 A,B,C,D,E五类
                // A类地址从1.0.0.0到126.255.255.255;
                // B类地址从128.0.0.0到191.255.255.255;
                // C类地址从192.0.0.0到223.255.255.255;
                // D类地址从224.0.0.0到239.255.255.255；
                // E类地址从240.0.0.0到255.255.255.255
                if (ipAddress >= (1 << 24) && ipAddress <= ((126 << 24) + low_24_one))
                {
                    A++;
                }
                if (ipAddress >= (128 << 24) && ipAddress <= ((191 << 24) + low_24_one))
                {
                    B++;
                }
                if (ipAddress >= (192 << 24) && ipAddress <= ((223 << 24) + low_24_one))
                {
                    C++;
                }
                if (ipAddress >= (224 << 24) && ipAddress <= ((239 << 24) + low_24_one))
                {
                    D++;
                }
                if (ipAddress >= (240 << 24))
                {
                    E++;
                }
            }
        }
        else
        {
            errIpOrMask++;
        }
    }

    cout << A << " " << B << " " << C << " " << D << " " << E << " " << errIpOrMask << " " << privateIp << endl;

    return 0;
}
