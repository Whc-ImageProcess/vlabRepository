#include <iostream>
using namespace std;

// HJ107 求解立方根
int main()
{
    double input;
    cin >> input;

    float startNum = 0, endNum = 0;
    if (input <= 1 && input >= 0)
    {
        startNum = 0;
        endNum = 1;
    }
    if (input >= -1 && input < 0)
    {
        startNum = -1;
        endNum = 0;
    }
    if (input > 1 && input < 8)
    {
        startNum = 1;
        endNum = 2;
    }
    if (input > -8 && input < -1)
    {
        startNum = -2;
        endNum = -1;
    }
    if (input >= 8 && input <= 27)
    {
        startNum = 2;
        endNum = 3;
    }
    if (input >= -27 && input <= -8)
    {
        startNum = -3;
        endNum = -2;
    }

    float result = 0;
    for (float i = startNum; i <= endNum; i += 0.1)
    {
        float tmp1 = i * i * i - input;
        float tmp2 = (i + 0.1) * (i + 0.1) * (i + 0.1) - input;
        if (tmp1 == 0)
        {
            result = i;
        }
        // 发生符号跳变时，必然是tmp1<0,tmp2>0
        else if (tmp1 * tmp2 < 0)
        {
            if (tmp1 + tmp2 < 0)
            {
                result = i + 0.1;
            }
            else
            {
                result = i;
            }
        }
        else
        {
        }
    }

    cout << result << endl;
    return 0;
}