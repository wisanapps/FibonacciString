# FibonacciString
Fibonacci function definition:

f(0) = 0,

f(1) = 1,

f(n) = f(n-1) + f(n-2)

n >= 0

As output of the function are huge and cannot fit to type UInt64 on Swift.
So I decded to convert each recursive result to type String and then converting each of character (which is a digit) back to type of Int and then compute digit by digit and convert the result back to type of String.
