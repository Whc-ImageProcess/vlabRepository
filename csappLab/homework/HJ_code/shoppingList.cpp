#include <iostream>
#include <stdlib.h>
#include <vector>
using namespace std;

// 返回当前的最大满意度
int satisfaction(int money, vector<vector<int>> &arr, int row, int col)
{
    for (size_t i = 0; i < row; i++)
    {
        if (arr[i][col - 1] == 0)
        {
            /* code */
        }
        
    }
    
    return 0;
}

int main()
{
    // money为重钱数，num为商品的个数
    int money, num;
    cin >> money;
    cin >> num;

    // int (*arr)[3] = (int (*)[3])malloc(sizeof(int) * num * 3);
    vector<vector<int>> arr(num);

    // 构建输入数组
    for (size_t i = 0; i < num; i++)
    {
        arr[i].resize(3);
        for (size_t j = 0; j < 3; j++)
        {
            cin >> arr[i][j];
        }
    }

    for (size_t i = 0; i < num; i++)
    {
        if (arr[i][2] == 0)
        {
            /* code */
        }
        
    }

    return 0;
}