#include <iostream>
using namespace std;

int main()
{
    int height;
    cin >> height;
    float dis[6];
    float hei[6];

    dis[0] = 0;
    hei[0] = height;
    dis[1] = height;
    hei[1] = hei[0] / 2;
    for (int i = 2; i < 6; i++)
    {
        hei[i] = hei[i - 1] / 2;
        dis[i] = dis[i - 1] + hei[i - 1] * 2;
    }

    cout << dis[5] << endl;
    cout << hei[5] << endl;
    return 0;
}