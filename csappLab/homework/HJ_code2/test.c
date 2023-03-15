#include <stdio.h>

void quickSort(int arr[], int begin, int end)
{
    if (begin > end)
    {
        return;
    }
    int tmp = arr[begin];
    int i = begin;
    int j = end;
    while (i != j)
    {
        // 因为基准选择的是第一个节点，所以high指针先移动，找到第一个比基准小的数
        while (arr[j] >= tmp && j > i)
        {
            j--;
        }
        // low指针++，找到第一个比基准大的数
        while (arr[i] <= tmp && j > i)
        {
            i++;
        }
        if (j > i)
        {
            int t = arr[i];
            arr[i] = arr[j];
            arr[j] = t;
        }
    }
    arr[begin] = arr[i];
    arr[i] = tmp;
    quickSort(arr, begin, i - 1);
    quickSort(arr, i + 1, end);
}

void main()
{
    int arr[10] = {3, 2, 1, 4, 6, 5, 7, 9, 8, 0};
    quickSort(arr, 0, 9);
    for (int i = 0; i < 10; i++)
    {
        printf("%d ", arr[i]);
    }
    printf("\n");
}