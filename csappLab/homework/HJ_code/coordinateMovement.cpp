#include <iostream>
#include <string>
using namespace std;

int main()
{
    string str;
    getline(cin, str);
    int len = str.length();
    // 位移的合法性：2或者3个字符，且第一个字符必须为ASDW其中一个
    int pattern = 0;
    // 为了保证一致性
    int left = -1, right = -1;

    // 坐标
    int x = 0, y = 0;

    // 直接根据两个';'之间的字符串来找
    for (size_t i = 0; i < len; i++)
    {
        if (str[i] == ';')
        {
            left = right;
            right = i;
            // 现在找到两个分号之间的字符串，首字母不满足要求或者长度不满足要求都剔除
            if ((right - left) != 4 && (right - left) != 3)
            {
                continue;
            }
            // 现在属于是两个分号之间的数量对上了，但是需要保证第一个是ASDW，后面一个或者两个要必须是数字
            if ((right - left) == 4)
            {
                if (str[left + 2] < '0' || str[left + 2] > '9' || str[left + 3] < '0' || str[left + 3] > '9')
                {
                    continue;
                }
            }
            if ((right - left) == 3)
            {
                if (str[left + 2] < '0' || str[left + 2] > '9')
                {
                    continue;
                }
            }
            if (str[left + 1] == 'A')
            {
                x -= stoi(str.substr(left + 2, right));
            }
            else if (str[left + 1] == 'D')
            {
                x += stoi(str.substr(left + 2, right));
            }
            else if (str[left + 1] == 'S')
            {
                y -= stoi(str.substr(left + 2, right));
            }
            else if (str[left + 1] == 'W')
            {
                y += stoi(str.substr(left + 2, right));
            }
            else
            {
                continue;
            }
        }
    }

    cout << x << ',' << y << endl;

    return 0;
}

// 原型：string substr ( size_t pos = 0, size_t n = npos ) const;
// 功能：获得子字符串。
// 参数说明：pos为起始位置（默认为0），n为结束位置（默认为npos）
// 返回值：子字符串

// 失败的方法，我想要通过强制的方法硬找
// for (size_t i = 0; i < len; i++)
// {
//     if ((pattern == 0) && (str[i] != 'A' && str[i] != 'S' && str[i] != 'D' && str[i] != 'W'))
//     {
//         continue;
//     }
//     else
//     {
//         if (i != 0)
//         {
//             if (str[i - 1] != ';')
//             {
//                 pattern = 0;
//                 continue;
//             }
//         }

//         pattern += 1;
//         if (str[i] < '0' || str[i] > '9')
//         {
//             pattern = 0;
//             continue;
//         }
//         else
//         {
//             if ((str[i] <= '9' && str[i] >= '0') || str[i] == ';')
//             {
//                 if ((str[i] <= '9' && str[i] >= '0'))
//                 {
//                     if (str[i + 1] == ';')
//                     {
//                         int tmp = stoi(str.substr(i, 2));
//                         if (str[i] == 'A')
//                         {
//                             x -= tmp;
//                         }
//                         if (str[i] == 'D')
//                         {
//                             x += tmp;
//                         }
//                         if (str[i] == 'W')
//                         {
//                             y += tmp;
//                         }
//                         if (str[i] == 'S')
//                         {
//                             y -= tmp;
//                         }
//                     }
//                     else
//                     {
//                         pattern = 0;
//                         continue;
//                     }
//                 }
//                 if (str[i] == ';')
//                 {
//                     int tmp = stoi(str.substr(i, 1));
//                     if (str[i] == 'A')
//                     {
//                         x -= tmp;
//                     }
//                     if (str[i] == 'D')
//                     {
//                         x += tmp;
//                     }
//                     if (str[i] == 'W')
//                     {
//                         y += tmp;
//                     }
//                     if (str[i] == 'S')
//                     {
//                         y -= tmp;
//                     }
//                 }
//             }
//             else
//             {
//                 pattern = 0;
//                 continue;
//             }
//         }
//     }
// }
// cout << x << "," << y << endl;

// #include <iostream>
// #include <string>
// using namespace std;
// typedef struct Point
// {
//     int x = 0;
//     int y = 0;
// };
// string d("ADSW");
// void move(string str, Point &p)
// {
//     if ((str.size() <= 3) && (str.size() >= 2))
//     {
//         string dir = str.substr(0, 1);
//         string num = str.substr(1, str.size() - 1);
//         int n = atoi(num.c_str());
//         if ((dir.find_first_of(d) != string::npos) && isdigit(num[0]) && isdigit(num[num.size() - 1]))
//         {
//             char c = dir[0];
//             switch (c)
//             {
//             case 'S':
//                 p.y -= n;
//                 break;
//             case 'W':
//                 p.y += n;
//                 break;
//             case 'A':
//                 p.x -= n;
//                 break;
//             case 'D':
//                 p.x += n;
//                 break;
//             }
//             /* if (c == 'A')
//             p.x -= n;
//             int a = 0;*/
//         }
//     }
// }
// int main()
// {
//     string str;
//     while (getline(cin, str))
//     {
//         Point p;
//         int pStart = 0;
//         int pos = str.find_first_of(";", pStart);
//         if (pos == pos != string::npos)
//             move(str, p);
//         while (pos != string::npos)
//         {
//             string sub = str.substr(pStart, pos - pStart);
//             move(sub, p);
//             pStart = pos + 1;
//             pos = str.find_first_of(";", pStart);
//         }
//         cout << p.x << "," << p.y << endl;
//     }
//     return 0;
// }