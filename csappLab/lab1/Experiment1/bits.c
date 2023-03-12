/*
 * CS:APP Data Lab
 *
 * <Please put your name and userid here>
 *                王汉春      SA21218058
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:
 
  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code 
  must conform to the following style:
 
  int Funct(arg1, arg2, ...) {
      /* brief description of how your implementation works */
      int var1 = Expr1;
      ...
      int varM = ExprM;

      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. Integer constants 0 through 255 (0xFF), inclusive. You are
      not allowed to use big constants such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. Unary integer operations ! ~
  4. Binary integer operations & ^ | + << >>
    
  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting.
  7. Use any data type other than int.  This implies that you
     cannot use arrays, structs, or unions.

 
  You may assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts arithmetically.
  3. Has unpredictable behavior when shifting if the shift amount
     is less than 0 or greater than 31.


EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
   */
  int pow2plus1(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     return (1 << x) + 1;
  }

  /*
   * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
   */
  int pow2plus4(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     int result = (1 << x);
     result += 4;
     return result;
  }

FLOATING POINT CODING RULES

For the problems that require you to implement floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants. You can use any arithmetic,
logical, or comparison operations on int or unsigned data.

You are expressly forbidden to:
  1. Define or use any macros.
  2. Define any additional functions in this file.
  3. Call any functions.
  4. Use any form of casting.
  5. Use any data type other than int or unsigned.  This means that you
     cannot use arrays, structs, or unions.
  6. Use any floating point data types, operations, or constants.


NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to 
     check the legality of your solutions.
  2. Each function has a maximum number of operations (integer, logical,
     or comparison) that you are allowed to use for your implementation
     of the function.  The max operator count is checked by dlc.
     Note that assignment ('=') is not counted; you may use as many of
     these as you want without penalty.
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
  5. The maximum number of ops for each function is given in the
     header comment for each function. If there are any inconsistencies 
     between the maximum ops in the writeup and in this file, consider
     this file the authoritative source.

/*
 * STEP 2: Modify the following functions according the coding rules.
 * 
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the BDD checker to formally verify that your solutions produce 
 *      the correct answers.
 */

#endif
// 1
/*
 * bitXor - x^y using only ~ and &
 *   Example: bitXor(4, 5) = 1
 *   Legal ops: ~ &
 *   Max ops: 14
 *   Rating: 1
 */
//德·摩根定律
// NOR”或非“
// x XOR y = (x AND y) NOR (x NOR y)
// x NOPR y = ~x & ~y
int bitXor(int x, int y)
{
  return ~(x & y) & ~(~x & ~y);
}
/*
 * tmin - return minimum two's complement integer
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 4
 *   Rating: 1
 */
int tmin(void)
{
  return 1 << 31;
}
// 2
/*
 * isTmax - returns 1 if x is the maximum, two's complement number,
 *     and 0 otherwise
 *   Legal ops: ! ~ & ^ | +
 *   Max ops: 10
 *   Rating: 1
 */
//这道题要我们比较一个数是不是和int可以表示的最大值相等。当然最自然的办法是先凑出 0x7fffffff，之后和x比较。
// 可是很遗憾，这道题不允许我们使用左移右移操作，因此 0x7fffffff 是不容易凑出的。
// 那应该怎么办呢？我们知道，0x7fffffff 取反之后的结果 0x80000000 有一个特点：取它的补码，结果仍为 0x80000000
// 所以我们借助这个特点来写这个函数。注意， 0 取补码的结果也依然为 0. 把为 0 的情况排除掉就可以了。
int isTmax(int x)
{
  int negate1 = ~x;           // 取反
  int negate2 = ~negate1 + 1; // 取取反结果的补码
  return (!(negate2 ^ negate1)) & !!negate1;
  //     取过补码之后，值有变化吗？  negate1 为零吗？
  // return !((~(x + 1) ^ x)) & !!(x + 1);
  // return !(x ^ 0x7fffffff);
}
/*
 * allOddBits - return 1 if all odd-numbered bits in word set to 1
 *   where bits are numbered from 0 (least significant) to 31 (most significant)
 *   Examples allOddBits(0xFFFFFFFD) = 0, allOddBits(0xAAAAAAAA) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 2
 */
int allOddBits(int x)
{
  int mask = 0xA + (0xA << 4);
  mask = mask + (mask << 8);
  mask = mask + (mask << 16);
  return !((mask & x) ^ mask);
}
/*
 * negate - return -x
 *   Example: negate(1) = -1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 5
 *   Rating: 2
 */
int negate(int x)
{
  return ~x + 1;
}
// 3
/*
 * isAsciiDigit - return 1 if 0x30 <= x <= 0x39 (ASCII codes for characters '0' to '9')
 *   Example: isAsciiDigit(0x35) = 1.
 *            isAsciiDigit(0x3a) = 0.
 *            isAsciiDigit(0x05) = 0.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 3
 */
int isAsciiDigit(int x)
{
  // int a = !(x >> 4 ^ 0x3);
  // int b = x & 0xF;
  // int c = ~0xA + 1;
  // int e = 0x80 << 4;
  // int d = !!((b + c) & (e));
  // return a & d;
  // 0x30~0x39和-48的补码相加的结果必然会产生进位且31位决定为0,取非判断最高为是否为0
  // 0x30~0x39和-57的补码相加（最大的Ascii为56）必然不会产生进位，且31位上必维1，两次取非使其满足“是非”条件
  // return (!((x + ~0x30 + 1) >> 31)) & !!((x + ~0x39 + 1) >> 31);

  // int sign = 0x1 << 31;
  // int upperBound = ~(sign | 0x39);
  // int lowerBound = ~0x30;
  // upperBound = sign & (upperBound + x) >> 31;
  // lowerBound = sign & (lowerBound + 1 + x) >> 31;
  // return !(upperBound | lowerBound);

  //参考上题的negate，两数做差
  int isAbove0x30 = !(((x + ((~0x30) + 1)) >> 31) & 1);
  int isBelow0x39 = !(((0x39 + (~x + 1)) >> 31) & 1);
  return isAbove0x30 & isBelow0x39;
}
/*
 * conditional - same as x ? y : z
 *   Example: conditional(2,4,5) = 4
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 16
 *   Rating: 3
 */
int conditional(int x, int y, int z)
{
  x = !!x;
  x = ~x + 1; //求补码
  return (x & y) | (~x & z);
}
/*
 * isLessOrEqual - if x <= y  then return 1, else return 0
 *   Example: isLessOrEqual(4,5) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */
/*
 * isLessOrEqual - if x <= y  then return 1, else return 0
 *   Example: isLessOrEqual(4,5) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */
int isLessOrEqual(int x, int y)
{
  int difference = y + (~x + 1);
  int sign_x = (x >> 31) & 1;
  int sign_y = (y >> 31) & 1;
  // 取x、y的符号
  int is_xy_share_same_sign = !(sign_x ^ sign_y);
  // x、y符号是否相同呢？
  int sign = (difference >> 31) & 1;
  return ((!sign) & is_xy_share_same_sign) |
         // x、y符号相同时才根据difference的符号判断大小
         ((!is_xy_share_same_sign) & (((sign_y + (~sign_x + 1)) >> 31) & 1));
          // x、y符号不相同就直接看是不是y为正、x为负
}
// 4
/*
 * logicalNeg - implement the ! operator, using all of
 *              the legal operators except !
 *   Examples: logicalNeg(3) = 0, logicalNeg(0) = 1
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 4
 */
int logicalNeg(int x)
{
  // 如果一个数x xx非零，那么它的相反数− x -x−x也一定不为零，对吧？
  // 那么，x xx和− x -x−x, 一定有一个的符号位为一，对吧？所以，只要我们取x的相反数，把它和原来的异或，再取符号位，
  // 是不是就可以把零和其他数区分出来了？
  // 区分出来之后呢，我们只要把刚才那个拼在一起的结果右移31位，是不是就得到-1(或者是零）了？再加上一，不就达到要求了嘛。
  return ((x | (~x + 1)) >> 31) + 1;
}
/* howManyBits - return the minimum number of bits required to represent x in
 *             two's complement
 *  Examples: howManyBits(12) = 5
 *            howManyBits(298) = 10
 *            howManyBits(-5) = 4
 *            howManyBits(0)  = 1
 *            howManyBits(-1) = 1
 *            howManyBits(0x80000000) = 32
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 90
 *  Rating: 4
 */
int howManyBits(int x)
{
  int b16, b8, b4, b2, b1, b0;
  int flag = x >> 31;
  x = (flag & ~x) | (~flag & x); // x为非正数则不变,x 为负数则相当于按位取反
  b16 = !!(x >> 16) << 4;        //如果高16位不为0,则我们让b16=16
  x >>= b16;                     //如果高16位不为0 则我们右移动16位来看高16位的情况
  //下面过程基本类似
  b8 = !!(x >> 8) << 3;
  x >>= b8;
  b4 = !!(x >> 4) << 2;
  x >>= b4;
  b2 = !!(x >> 2) << 1;
  x >>= b2;
  b1 = !!(x >> 1);
  x >>= b1;
  b0 = x;
  return b0 + b1 + b2 + b4 + b8 + b16 + 1;

  // int mask = x >> 31;
  // int value = (mask & (~(x + ~0))) | (~mask & (x + 1));
  // // 这是 conditional 里用过的逻辑
  // int processed_x = value;

  // // 下面几行是取对数的代码
  // int r; // result of log2(value) will go here
  // int shift;
  // r = (!!(value >> 16)) << 4; value >>= r;
  // shift = (!!(value >> 8)) << 3; value >>= shift; r |= shift;
  // shift = (!!(value >> 4)) << 2; value >>= shift; r |= shift;
  // shift = (!!(value >> 2)) << 1; value >>= shift; r |= shift;
  // r |= ((value >> 1) & 1);
  // // 最后只取 value 的低位

  // r += !!(processed_x ^ (1 << r));
  // // 需要向上取整吗？如果需要，就把r的值加上一。
  // r += 1;
  // return r;
}
// float
/*
 * floatScale2 - Return bit-level equivalent of expression 2*f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   When argument is NaN, return argument
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned floatScale2(unsigned uf)
{
  int exp = (uf & 0x7f800000) >> 23; //取出exp部分
  int sign = uf & (1 << 31);         //取出符号位
  if (exp == 0)
    return uf << 1 | sign; //情况2
  if (exp == 255)
    return uf; //情况1
  exp++;
  if (exp == 255)
    return 0x7f800000 | sign; //情况3
  return (exp << 23) | (uf & 0x807fffff);
}
/*
 * floatFloat2Int - Return bit-level equivalent of expression (int) f
 *   for floating point argument f.
 *   Argument is passed as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point value.
 *   Anything out of range (including NaN and infinity) should return
 *   0x80000000u.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
int floatFloat2Int(unsigned uf)
{
  int sign = (uf >> 31) & 1;
  int exp = (uf >> 23) & 0xff;
  int frac = uf & 0x7fffff;

  int E = exp - 127;

  if (E < 0) //小数
  {
    return 0;
  }
  else if (E >= 31) // 超出int范围
  {
    return 0x80000000u;
  }
  else
  {
    frac = frac | (1 << 23); //加上隐含的1

    if (E < 23) //舍去部分小数
    {
      frac >>= (23 - E);
    }
    else //不需要舍去小数
    {
      frac <<= (E - 23);
    }

    if (sign)
      return -frac;
    else
      return frac;
  }
}
/*
 * floatPower2 - Return bit-level equivalent of the expression 2.0^x
 *   (2.0 raised to the power x) for any 32-bit integer x.
 *
 *   The unsigned value that is returned should have the identical bit
 *   representation as the single-precision floating-point number 2.0^x.
 *   If the result is too small to be represented as a denorm, return
 *   0. If too large, return +INF.
 *
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. Also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned floatPower2(int x)
{
  if (x > 127) // too large, return +INF
  {
    return (0xFF << 23);
  }
  else if (x < -148) // too small, return 0
  {
    return 0;
  }
  else if (x >= -126) // norm，计算exp
  {
    int exp = x + 127;
    return (exp << 23);
  }
  else // denorm，令frac中某一位为1
  {
    int t = 148 + x;
    return (1 << t);
  }
}
