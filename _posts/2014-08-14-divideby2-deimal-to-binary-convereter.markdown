---
layout: post
title:  "Divideby2 Algorithm - Decimal to Binary converter"
date:   2014-08-14 16:19:14
categories: binary algorithms
---
Binary (1's and 0's), popularly called base-2 (2<sup>n</sup>) is the core of how computers work. Without it, computers would probably not exist.

According to Wikipedia?
<blockquote>
	A binary number is a number expressed in the binary numeral system, or base-2 numeral system, which represents numeric values using two different symbols: typically 0 (zero) and 1 (one).
	<footer>Source <cite title="Source Title">Wikepedia</cite></footer>
</blockquote>

As humans we have been taught the decimal system otherwise knowmnas base-10 (10<sup>n</sup>). This is the basis
with which we represent numbers - 0,1,2,3...9.

Recently I have the taken time to go back to the fundamentals of Computer Science. Data Structures and
Algorithm is one part that has been of particular interest. I thought about writing an algorithm that will
help me convert with ease from one base to the other. I have decided to start with decimal to binary.



I whiped out an algorithm in Python to solve this problem -

{% highlight python %}
def remainderDiv(number):
    return number // 2, number % 2

def binaryConvet(number):
    remStack = []
    i = number
    while i > 0:
        number,rem = remainderDiv(number)
        remStack.append(rem)
        i = number

    remStack = remStack[::-1]
    return remStack

{% endhighlight %}

I basically wrote two functions for abstraction sake. <code>remainderDiv</code> does two things;
get a number, perfom an integer division and modulus on the number. 

The second function <code>binaryConvet</code> takes a number and calls <code>remainderDiv</code> iteratively
and it stores the remainder in a list. After the iteration is complete, I do a reversal on the list. With that,
I have my own home grown binary converter :-).

Thank you for reading.