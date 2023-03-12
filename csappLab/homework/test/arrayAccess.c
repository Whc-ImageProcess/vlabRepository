#include <stdio.h>

#define ZLEN 5
typedef int zip_dig[ZLEN];
zip_dig cmu = { 1, 5, 2, 1, 3 };
zip_dig mit = { 0, 2, 1, 3, 9 };
zip_dig ucb = { 9, 4, 7, 2, 0 };

#define PCOUNT 4
zip_dig pgh[PCOUNT] =
{{1, 5, 2, 0, 6},
	{1, 5, 2, 1, 3 },
	{1, 5, 2, 1, 7 },
	{1, 5, 2, 2, 1 }};
int get_pgh_digit(int index, int dig)
{
	return pgh[index][dig];
}

#define UCOUNT 3
int *univ[UCOUNT] = {mit, cmu, ucb};
int get_univ_digit(size_t index, size_t digit)
{
	return univ[index][digit];
}
