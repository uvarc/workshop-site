---
title: "3. Conditionals and Loops"
author: "Erich Purpur & Karsten Siller"
date: 2020-05-11
categories: ["Summer Education Series: Programming in Python"]
toc: true
---

# Conditionals and Loops

Now that we understand the basic types, we can begin to study the fundamental programming constructs that all programs will use.  The two most important of these are _conditionals_ and _loops_.

## Conditionals

Computer programs really can't do all that many things.  They cannot

* assign values to variables (memory locations)
* make decisions based on comparisons
* repeat a sequence of instructions over and over
* call subprograms

Decisions (conditionals) are one of these basic constructs.

### Branching

When a program makes a decision, it is said to _branch_.  A program may be regarded as a tree with one root and many branches.  Executing the program causes the branches to be followed in a particular order.

##### Python if-else if-else

Most languages branch with some variant of 

if (something that evalutes to True or False) do something
else if (comparison) do some other things
else do some default things

Only the `if` is required; the other statements are optional.  The specific syntax in Python is

```
if some_condition:
    code block
elif another_condition:
    code block
else:
    code block
```

Observe the colons and the indentation.  To terminate the conditional, return to the same indentation level as the initial `if`.

If the "code block" consists of a single statement, it is permissible to write it on the same line as the if or elif

```
if x==0: z=0
```

Conditionals may be nested 

```
if some_condition:
    if another_condition:
        do_something
    else:
        do_something_else
elif condition2:
    if something:
        do_work
```

Some languages have a "case" or "switch" statement for a long sequence of options.  Python has no such construct so we use a series of `elif`s.

```
if cond1:
    block1
elif cond2:
    block2
elif cond3:
    block3
elif cond4:
    block4
else:
    final choice
```

The "condition" must be an expression that evaluates to True or False; that is, it must be a Boolean variable or expression.  Boolean expressions are formed from other types of variables with conditional operators. Here is another example of this in action:

```
import random

x = random.randint(0, 20)    #x becomes random integer between 0 and 20

if x < 10:
    print('x is less than 10')
elif x > 10:
    print('x is greater than 10')
else:
    print('x is 10')

```

<details>
<summary>Exercise 4</summary>
<pre>
The Body Mass Index is a widely-used number to classify body shapes.  The formula in Imperial units (pounds, inches) is
<code>
BMI=weight\*703.1/height**2
</code>
In metric units (kg, m) the formula is
<code>
BMI=weight/height**2
</code>
The categories are as follows (we have omitted the top two):
Under 18.5: underweight
18.5 to 25: normal 
over 25 to 30: overweight
over 30 to 35: obese class I
over 35 to 40: obese class II
over 40 to 45: obese class III
over 45: obese class IV (morbidly obese)
Using whichever unit system you prefer, write some code to assign the weight and height, compute the number, and determine its classification.  Assign your own weight and height.  Try a few others.  Use an online calculator to check your results.
</pre>
</details>

## Loops

One of the most fundamental processes in a computer program is to repeat statements many (perhaps many, many, many) times. Loops are super important because if you figure out the logic to do something once, the computer can carry out that logic a nearly unlimited amount of times, while humans will tire of it quickly. Computers never run out of patience. 

Like most languages, Python has two major types of loops.  

_For loops_ execute for a fixed number of iterations.  It is possible to exit early, but this must be explicitly added to the code. 

_While loops_ do not start with a predetermined number of iterations.  They terminate when some condition becomes False.

### For Loops in iPython

```
for item in iterator:
    block1
else:
    block2
```

The `else` clause is executed if the loop completes all iterations and is optional.  The colons are required as indicated.  Code blocks must be indented.  The `item` is a variable which successively takes on the values in the `iterator`.  An iterator is a data structure through which we can step, item by item.  Until we study some more general examples, let's look at the __range__ iterator. 

##### Range

The range iterator is used to step over a sequence of numbers.  It takes up to three arguments.

* range(10)  : 0,1,2,3,4,5,6,7,8,9
* range(1,10) : 1,2,3,4,5,6,7,8,9
* range(0,10,2) : 0,2,4,6,8
* range(10,0,-2) : 10,8,6,4,2 (note that zero is __not__ included)

The interval is often called a stride.  If it is present the lower bound must also be present even if it is the default, 0.  Otherwise the lower bound may be omitted.  If the stride is omitted it is 1.  The last value is never reached.

<details>
<summary>Exercise 5</summary>
<pre>
Execute the following for loop:
<code>
x = 10
for i in range(x):
    print(i)
</code>
Modify this loop to print the values of i for 
<code>
range(10)
range(1,10)
range(0,10,2)
range(1,0,-2)
</code>
Modify your loop to print the first N integers.  Be sure that N is set to a value before you try to run the loop.
Write a loop that will sum the first N integers.  Hint: you will need a variable called an <em>accumulator</em> whose value starts outside the loop at 0. Think, how do you add to an existing variable?
</pre>
</details>

##### Enumerate

Sometimes we need both the item and its index.  We can use enumerate for this purpose.

```
velocity=[-11.,-3.,-1.,1.,2.3,.4.]
for i,v in enumerate(velocity):
    print(i,v)
```

## While loops

A _while_ loop uses a conditional to determine when to exit.  The loop must be coded to ensure that the conditional will become False at some point, or it will never terminate.

Python syntax

```
while conditional:
    block1
else:  #optional
    block2
```

As for the _for_ loop, colons and indentations are required.  The optional _else_ clause is executed if and only if the conditional becomes False, which for a while loop is normal termination.

```
x=-20
y=-10
while x<0 and y<0:
    x=10-y
    y=y+1
    z=0
print(x,y,z)
```

<details>
<summary>Exercise 6</summary>
<pre>
Modify each for loop in the previous exercise to use a while loop instead.
</pre>
</details>

## Leaving Early

To exit a loop prior to its normal termination, use the `break` statement.  

If `break` is executed, any `else` clause will _not_ be executed.

Break can exit only from the loop level in which it occurs.  In Python this is the indentation level.

To skip the rest of the loop instrutions and go to the next cycle, use `continue`. Similarly to `break`, it skips only the rest of the statements at its own level.

```
x=1.
while x>0:
    x+=1.
    if x>=1000.0: break 
    if x<100.0: continue
    x+=20.
    print(x)
```

Now we can better understand the purpose of the `else` clause.  It can provide a warning for cases where a loop terminating normally may indicate a failure.  For example, if we were iterating on an algorithm that converges to an answer but may go astray, we can set a limit on the maximum number of iterations. In this example, optimize is a function that we invoke.  It may be in another package or it may be something we wrote.  The variable f stands for the function we are optimizing.  Therefore this code fragment is incomplete and cannot be run as is; it is an example of how `else` works.

```
max_iter=1000000000
tol=1.e-14
iter=0
while iter<max_iter:
    x_new=optimize(f,x_old)
    iter+-1
    if abs(x_new-x_old)<tol:
        break
    x_old=x_new
else:
    print("Warning: max_iter exceeded, solution may not be valid.")
```

## Repeat/Until

A while loop is equivalent to

```
while True:
    if not condition:
        break 
    codeblock
```

The while always tests at the _top_ of the loop.  If we wish to test elsewhere we can use break to accomplish this.  If we test at the bottom of the loop, the pattern is often called _repeat/until_.

```
while True:
   codeblock
   if condition: break 
```

Example:

```
x=1.
while True:
    z=x-1
    x+=1
    if x>10: break 
```

### Nested Loops

We can write loops within loops.  The outer loop variable remains fixed while the inner one goes through its iterator; then the outer one takes the next value and the entire inner loop is repeated.

```
for i in range(5):
    for j in range(10):
        print(i,j)
```

#### Reinitializing

In nested loops, if we need to recompute something we often need to reinitialize a variable.  Examine the difference between

```
s=0.
for i in range(10):
    for j in range(15):
        s=s+i+j
print(s)
```

and 

```
for i in range(10):
    s=0 
    for j in range(10):
        s=s+i+j
print(s)
```

## Compound Types

So far we have examined _primitive_ types.  Each variable stands for one value.  Python defines several built-in _compound types_; a single variable stands for multiple values. 

### Sequences

A _sequence_ in Python is an ordered group of values that can be represented by a single value. We can address individual elements or subgroups of a sequence with square brackets and possibly a range.  Square brackets hold the index or range.  

```
A[i]
A[1:j+k+1]
```

Python is _zero based_ (the first element is numbered 0) and the upper bound of _any_ range is always _non_inclusive_.  Python defines several intrinsic sequences: strings, unicode strings, lists, tuples, and a few others that we will not cover.

Sequences either are directly iterators or can be readily converted to an iterator.

#### Sequence Operators

* Belonging
  * in operator.  `x in S` returns True or False if x is or is not an element of the sequence S
* Identity
  * is operator.  `S1 is S`2 returns True or False if S1 and S2 are exactly the same or different.
  * is can be negated `S1 is not S2`
* Range extraction
  * S\[il:ul+1] starts at il and goes to ul.  The colon is here called a range operator.
* Starting from the end 
  * S\[-N] is the N-1 element.  Thus S\[-1] is the last element, S\[-2] the next to last, and so forth. 
* Concatenation
  * S1+E1
* Repetition
  * S1\*N replicates the sequence S1 N times.  

<details>
<summary>Exercise 7</summary>
Examine the results of the following:
<pre>
<code>
A=[1.,2,3.,4.,5,6]
1 in A
1. in A
9 in A
9 not in A
</code>
Remember that 1 and 1. are _different_ types. 
<code>
A[3]
B=A[:]
C=A
B is A
C is A
B is not A
</code>
</pre>
</details>

### Mutability

In Python types are categorized as __mutable__ or __immutable__.  Immutable types cannot be changed in place, but they can be overwritten.

```
x=1.0
x=2.0
```

All the types we have seen so far are _immutable_.  Compound types may be _mutable_; their elements can be changed in place.  Compound types may also be immutable.  Strings are a compound type but they are immutable.

```
S1="Hello world"
S1[0:5]="Goodbye" #illegal
S1="Goodbye cruel world." #legal
```