#include <iostream>
using namespace std;

// HJ37 统计每个月兔子的总数
int main()
{
    int n;
    cin >> n;
    int arr[31];
    arr[0] = 1;
    arr[1] = 1;
    for (int i = 2; i < n; i++)
    {
        arr[i] = arr[i - 1] + arr[i - 2];
    }

    cout << arr[n - 1] << endl;
    return 0;
}