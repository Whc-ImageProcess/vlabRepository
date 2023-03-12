#include <iostream>
#include <string>
using namespace std;

int main()
{
    string str;
    // 默认回车符停止读入,按Ctrl+Z或键入EOF回车即可退出循环
    while (getline(cin, str))
    {
        int count = 0;
        for (int i = str.length() - 1; i >= 0; i--)
        {
            if (str[i] == ' ')
                break;
            else
                count++;
        }
        cout << count << endl;
        cin.get(); // 去掉上次输入残留在缓冲区的的换行符，没有也可以通过
    }
    return 0;
}
