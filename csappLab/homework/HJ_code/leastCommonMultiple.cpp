#include <iostream>
using namespace std;

// greatest common divisor
// 求最大公约数
int gcd(int m, int n)
{
    int a = (m > n) ? m : n;
    int b = (m > n) ? n : m;
    m = a;
    n = b;
    int r = 0;
    while (m % n != 0)
    {
        r = m % n;
        m = n;
        n = r;
    }
    return n;
}

int lcm(int m, int n)
{
    // 乘积除以最大公约数就是最小公倍数
    return m * n / gcd(m, n);
}

// HJ108 求最小公倍数
int main()
{
    int A, B;
    cin >> A >> B;
    cout << lcm(A, B) << endl;

    return 0;
}