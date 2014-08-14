---
layout: post
title:  "Divideby2 Algorithm - Decimal to Binary convereter"
date:   2014-08-14 16:19:14
categories: binary algorithms
---
Binary (1's and 0's), popularly called base-2 (2<sup>n</sup>) is the core of how computers work. Without it, computers will probably not exist.

According to Wikipedia?
<blockquote>
	A binary number is a number expressed in the binary numeral system, or base-2 numeral system, which represents numeric values using two different symbols: typically 0 (zero) and 1 (one).
	<footer>Source<cite title="Source Title">Wikepedia</cite></footer>
</blockquote>

As humans we have been taught the decimal system otherwise knows as base-10 (10<sup>n</sup>). This is the basis
with which we represent numbers - 0,1,2,3...9.

Recently I have taken a keen interest to go back to the fundamentals of Computer Science. Data Structures and
Algorithm is one part that have been of particular interest. I thought about writing an algorithm that will
help me convert with ease from one base to the other. I have decided to start with decimal to binary.



I whiped out an algorithm in Python to solve this problem -

{% highlight python %}
from __future__ import division

def remainderDiv(number):
    return number // 2, number % 2

def divideBy2(number):
    remStack = []
    i = number
    while i > 0:
        number,rem = remainderDiv(number)
        remStack.append(rem)
        i = number

    remStack = remStack[::-1]
    return remStack

{% endhighlight %}