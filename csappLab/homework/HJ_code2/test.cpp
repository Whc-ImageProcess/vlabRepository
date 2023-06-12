#include <iostream>
#include <stdio.h>
#include <map>
using namespace std;

// #pragma pack(2)
class Test1
{
public:
    Test1() // 无参构造函数
    {
        cout << "Construct Test1" << endl;
    }
    Test1(const Test1 &t1) // 拷贝构造函数
    {
        cout << "Copy constructor for Test1" << endl;
        this->a = t1.a;
    }
    Test1 &operator=(const Test1 &t1) // 赋值运算符
    {
        cout << "assignment for Test1" << endl;
        this->a = t1.a;
        return *this;
    }
    char b;
    int a;
};
class Test2
{
public:
    Test1 test1;
    Test2(Test1 &t1) : test1(t1)
    {
        // test1 = t1;
    }
};

#pragma pack(2)
struct node
{
    char a;
    char b;
    int c;
};


int main()
{
    // Test1 t1;
    // Test2 t2(t1);

    // struct node n1;
    // cout << sizeof(n1) << endl;
    // printf("%p  %p\n", &(n1.a), &(n1.b));

    // Test1 t1;
    // cout << sizeof(t1) << endl;

    map<string, string> hashMap;
    string key = "hello";
    string value = "world";
    hashMap[key] = value;

    return 0;
}

// 除了性能问题之外，有些时候合初始化列表是不可或缺的，以下几种情况时必须使用初始化列表
// 1.常量成员，因为常量只能初始化不能赋值，所以必须放在初始化列表里面
// 2.引用类型，引用必须在定义的时候初始化，并且不能重新赋值，所以也要写在初始化列表里面
// 3. 没有默认构造函数的类类型，因为使用初始化列表可以不必调用默认构造函数来初始化，而是直接调用拷贝构造函数初始化
