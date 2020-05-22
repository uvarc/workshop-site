---
title: "3. Conditionals and Loops"
author: "Erich Purpur"
date: 2020-05-18
categories: ["Summer Education Series: Programming in Python"]
toc: true
---


# Conditionals and Loops

Now that we understand the basic types, we can begin to study the fundamental programming constructs that all programs will use.  The two most important of these are _conditionals_ and _loops_.

#### Code Blocks

Now that we are adding a little sophistication to our python code, let's quickly talk about code blocks. Know that spacing is sometimes significant in python. Indention is always significant.

Statements can be grouped into _blocks_ that function logically as a single statement.  In Python these blocks are indicated by the _indentation level_. You may indent each block by however many spaces you wish (3 or 4 is usually recommended), but each block level must be indented by exactly the same number.  Do not use tabs.

Many editors, including Spyder, will automatically indent the next statement to the same level as the previous one.  You escape to an outer level with the backspace or some other key.  Spyder also provides _Indent_ and _Unindent_ options in its Edit menu.  These are extremely convenient for Python since you need only select lines, then click indent or unindent to create or move a code block level.

Examples

```
def func(z):
    x=99.0
    y=1
    return (x+y)/z


n = 15
for i in range(n):                          #first code block
    if i < 10:                              #second code block
        print("i is less than 10")          #third code block
    else:
        print("i is equal to or greater than 10")
```

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

## Loops

One of the most fundamental processes in a computer program is to repeat statements many (perhaps many, many, many) times. Loops are super important because if you figure out the logic to do something once, the computer can carry out that logic a nearly unlimited amount of times, while humans will tire of it quickly. Computers never run out of patience. 

Like most languages, Python has two major types of loops.  

_For loops_ execute for a fixed number of iterations.  It is possible to exit early, but this must be explicitly added to the code. 

_While loops_ do not start with a predetermined number of iterations.  They terminate when some condition becomes False.

### For Loops

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

#### Accumulator variables

An accumulator variable is a variable declared before a loop starts, but which is modified by the loop. Take this example:

```
x = 0

print("x = ", x)

for i in range(5):
    x = x + i

print("x = ", x)
```

What is this example doing?  Basically we are saying to computer:
X = 0. For the numbers 0,1,2,3,4 (remember: python starts counting at 0), add the current number to x. So in this sense, x accumulates the total value of all the numbers in range(5).


##### Enumerate

Sometimes we need both the item and its index.  We can use enumerate for this purpose.

```
velocity=[15, 26, 3.2, 7.89, 25]
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
x = 0

while x < 10:
    print("x =", x)
    x+=1
```
Why didn't the results print "x = 10"?


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
        print(f"i={i},j={j}")
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

### Exercises

<details>
<summary>Exercise 4</summary>
<pre>
The Body Mass Index is a widely-used number to classify body shapes.


The categories are as follows (we have omitted the top two):
Under 18.5: underweight
18.5 to 25: normal 
25 to 30: overweight
30 to 35: obese class I
35 to 40: obese class II
40 to 45: obese class III
45: obese class IV (morbidly obese)
Using whichever unit system you prefer, write some code to assign the weight and height, compute the number, and determine its classification.  
Assign your own weight and height.  Try a few others.  Use an online calculator to check your results.

The formula in Imperial units (pounds, inches) is
<code>
BMI= (703 * weight) / height**2
</code>
In metric units (kg, m) the formula is
<code>
BMI=weight/height**2
</code>


So for example... If am 150lbs and 70 inches tall (5'10"), my BMI is 21.52 (Normal Weight)

</pre>
</details>

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
Write a loop that will sum the first N integers.
</pre>
</details>

<details>
<summary>Exercise 6</summary>
<pre>
Modify each for loop in the previous exercise to use a while loop instead.
</pre>
</details>

---

{{< series-buttons overview="/categories/summer-education-series-programming-in-python/" prev="/lesson/ses-python-intro/variables/" next="/lesson/ses-python-intro/compound-types/" >}}