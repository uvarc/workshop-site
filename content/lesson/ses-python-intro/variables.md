---
title: "2. Variables, Expressions and Statements"
author: "Erich Purpur"
date: 2020-05-19
categories: ["Summer Education Series: Programming in Python"]
toc: true
---





### Variables

Variables in a computer program are not quite like mathematical variables.  They are placeholders for _locations in memory_.  Memory values consists of a sequence of binary digits (bits) that can be `0` or `1`, so all numbers are represented internally in __base 2__.  A standard called IEEE 754 defines the way decimal numbers are represented as base-2 numbers with a specific, and finite, number of bits for each value.  In most computer languages the number of bits per number can be 32 or 64, with some languages allowing 128-bit representations.  Eight bits is a _byte_, another frequently used unit in computing.

Names of variables are chosen by the programmer.  Python is case sensitive, so `myVariable` is not the same as `Myvariable` which in turn is not the same as `MyVariable`.  With some exceptions, however, the programmer should avoid assigning names that differ only by case since human readers can overlook such differences.

To create a variable, you use the assignment operator: `=`. `=` in python does not mean '=' in math class. In python, `=` is more analagous to the english word "is". See example: 

```
x = 5
```
In english, you can read this as 'the variable x represents the integer 5'. 

### Literals

Literals are specific values, as distinct from variables.  Literals also have a type, which is determined by their format.  Examples:

* 3 (integer)
* 3.2 (floating point)
* 1.234e-25 (floating point, exponential notation)
* "This is a string" (Python string)
* True (Python Boolean)
* 1.0+2J (Python complex)

### Python Types

Variables always have a __type__ even if you don't declare it.  The __primitive types__ correspond more or less to the types handled directly by the hardware, specifically integers, floating-point numbers, and characters.  Many languages define a number of other simple types including Booleans, strings, complex numbers, and so forth.  Python defines several primitive types and has some built-in _compound types_.

#### Integers

Integers are whole numbers and are not written with a decimal point.  In Python an integer can be of any size but numbers larger than what can be represented in the hardware will be handled by software and can be slow. On modern systems the hardware size is 64 bits.  Only signed integers are supported (so any integer may be positive or negative).

#### Floating-Point Numbers

Floating-point numbers are real numbers. Meaning numbers which contain a fractional part

Floating-point numbers are represented internally by a variant of scientific notation, to base 2, with one bit for the sign and the rest for the mantissa and the exponent.  In most languages there are two types of floating-point numbers, single precision and double precision.  Single precision numbers are 32 bits long in total.  Double precision numbers occupy 64 bits.  Most of the time a Python floating-point variable is double precision.  Only in a few packages, mainly NumPy, is a single-precision floating-point number available.

A double-precision floating-point number has an exponent range, in base 10, of approximately 10<sup>-308</sup> to 10<sup>308</sup> and a decimal precision of about 15-16 digits.  The first thing to note is that this is _finite_.  The number of mathematical real numbers is infinite, and they must all be represented by the finite number of floating-point values.  It should be obvious, then, that infinitely many real numbers will map to the same floating-point number.  It also follows that only integers or terminating rational numbers can be exactly represented at all.  All other numbers are approximated.  Some numbers that are terminating in base 10 are not terminating in base 2 and vice versa.  Floating-point numbers do not obey all the rules of mathematical real numbers; in particular, they are commutative (so a+b = b+a) but are not necessarily associative (i.e. a + (b+c) may not equal (a + b) + c) and they are generally not distributive (so a x (b-c) is not necessarily equal to a x b-a x c).  For most work these properties of floating-point numbers do not matter, but for some types of scientific programs this behavior can be important.

The floating-point standard also defines special values INF (and -INF) and NAN.  __INF__ or -INF means the absolute value of the number is too large to be represented.  __NAN__ stands for "Not a Number" and is returned when a program attempts to perform a mathematically illegal operation, such as dividing by zero.  It is also frequently used in some Python packages to represent missing data.

#### Complex

Python supports complex numbers.  A complex number consists of two double-precision real numbers and is expressed in the form

```
R+I*1J
```

or

```
R+I*1j
```

The imaginary part is denoted by the letter "J" (not "i" as in most of mathematics) and it is not case sensitive in this context.  The numerical value of the imaginary part must immediately precede it with no multiplication symbol.  If the imaginary part is a variable, as in the examples, the digit 1 must be present.  This is so the interpeter knows that the J indicates imaginary and is not a variable.

#### Spyder Variable Explorer

I'll take a quick break to remind you of the variable explorer in Spyder. It is very handy!

![AnacondaNavigator](/images/python/variable_explorer.png)

#### Boolean

Boolean variables indicate _truth value_.  Booleans have only two possible values, `True` or `False` (note the capitalization).  Internally Booleans are integers, but this is (usually) not important to the programmer.  Use Booleans when a variable naturally represents a value that can be expressed as true/false or yes/no.

#### Operators

Operators are defined on types and return a new value, usually of the same but sometimes of a different type.  The most familar are the arithmetic operators `+ - * /` (addition, subtraction, multiplication, division).  Python also provides an exponentiation operator `**`, e.g. a\*\*b.  Python also accepts pow(a,b) for exponentiation.

The equal sign (=) is an _assignment operator_ in Python.  It does not indicate equality; rather it assigns a value to a variable.  Since variables represent locations in memory, the assignment tells the interpreter to place the value into that memory location.  This means that a mathematically nonsensical expression like

```
x=x+1
```

is perfectly correct Python.  The interperter fetches the value of x from memory, adds one to it, and stores the result back into the same memory location.

Python supports add/assign and similar operators.  Thus

```
x+=1
```

is the same thing as

```
x=x+1
```

Experienced programmers tend to use operator/assignment (+=, -=, \*=, /=) but it is not required.

##### Integer Operators

The arithemetic operators on all numerical types.  Two additional operators work on integers.  

* Integer division // returns the integer part of the division.  For example, 7//2=3.  
* The mod or modulo operator % returns the remainder of the division, so 7%2=1.

These operators are also defined on floating-point numbers, but the results may not be what you expect!  Also avoid using % with negative numbers, for the same reason.

_Special note for Python 2.7 users_: In Python 2.7, 2/3=0.  This is because each operand is an integer, so the operator returns an integer.  However, in Version 3 and up, 2/3=0.6666666666666666 (this value is the result of an expression evaluation).  Python 2.7 users who want the newer behavior should begin each file With

```
from __future__ import division
```

If you'd like the new print function as well, modify this line to

```
from __future__ import division, print_function
```



##### Boolean Operators

Boolean operators operate on Boolean expressions.  

* Negation
  * not somevar
* AND 
  * somevar and anothervar
  * Example: given two Boolean variables is_present and has_value, 
    * is_present and has_value is True when both are True, otherwise False 
* OR
  * somevar or anothervar
    * Example: is_zero or is_negative
    * __Warning__: in Python `or` is _nonexclusive_.  The expression is True if _either_ or _both_ are True.
    * This is different from the usual meaning of _or_ in natural languages. "You can have ice cream or cake" usually implies "but not both."  But in Python,
      * if ice_cream_OK or cake_OK:
        is true if both are True.  

##### Comparison operator

Comparison operators operate on other types but return Boolean values.  They are also called _conditional_ operators or relational operators.

Comparison operators represent relationships between two or more variables.  They can be defined on any type, but arithmetic and string comparisons are the most common.

###### Arithmetic Comparison operators

* Equal, not equal. Note that equality is a double equal sign.
  * == !=
* Less than, greater than, less than or equal to, greater than or equal to
  * &lt; > &lt;= >=

_Chaining_

In Python we can write an expression like 

```
0<a<=1
```

just as in the analogous mathematical expression.  An `and` operator is always assumed.  This chain is equivalent to

```
0<a and a<=1
```

### Expressions and Statements

#### Expressions

_Expressions_ are combinations of variables, literals, operators on variables, invocations of functions, and so on.  Given values for each variable that appears, it must be possible for the intepreter to evaluate the expression to yield an unambiguous result.

The interpreter has a strict set of rules it follows to arrive at a unique evaluation.  It does not care what the programmer actually intended so _you_ must adapt to _it_.  If it cannot arrive at an unambiguous result it will reject your code.

Examples

* a\*b+c/d
* math.pi\*sin(x)
* 1./(x+y)

#### Operator Precedence

Among the rules for expression evaluation is operator precedence.  If you write

```
x*z-w/y+v
```

the interpreter must follow a set of rules to evaluate each operation.  Python, as well as most other programming language, carries out the operations from left to right by the priority assigned to each operator.  In Python the ranking for arithmetic operators is, from first to last, \*\*, then (\* /) have equal rank, followed by (+ -) also with equal rank.  So in the expression above, the interpeter first evaluates x\*z, then w/y, then subtracts the second from the first result, and finally adds v.  If you want a different grouping you must use parentheses. For example, you may want to add y and v before dividing.

```
x*z-w/(y+v)
```

The interpreter will never be confused about the order in which it will evaluate an expression, but humans can often become confused.  It is better to include more parentheses than needed than to have too few, in order to keep your meaning clear both to the interpreter and your reader.

The Boolean operators have their own precedence rules. Highest to lowest are `not`, then `and`, then `or`.

All comparison operators have the same precedence relative to each other.  All comparison operators outrank all Boolean operators.



#### Type Conversions

Type conversions, also know as _casts_, are used when it is necessary to change a variable's type from one to another.  Python assigns types to variables by _inference_; that is, it determines from context what the type should be.  If the programmer needs it to be something different, an explicit cast can be used.

```
n=int(f)
f=float(n)
```

Often an arithmetic expression contains variables of more than one type. If no explict casts are specified, the interpeter promotes each variable to the highest-rank type in the expression.  The hierarchy from top to bottom is complex, float (double), then integer.

#### Statements

A __statement__ is one complete "sentence" of the language.  It contains one complete instruction.  Examples:

* B=A
* C=0.25\*math.pi\*d\*\*2

Unlike some other languages, Python statements do not require a semicolon at the end of the line.  Semicolons may be used to separate multiple statements on one line.

The backslash character \\ is the line-continuation marker.  A comma that separates elements can also mark a continuation as long as it is the last character on the line.

A statement that does nothing (a _no-op_) is the single word

```
pass
```

Examples

* x=x+1
* x+=1
* (x,y,z)=myfunc(a)
* f=open("myfile.txt","w")
* x=0; y=1; z=2
* A=[1,2,3,
     4, 5, 6]




#### Comments

Comments are statements or partial statements inserted for the benefit of human readers of the program.  Comments are ignored by the interpreter.  In Python ordinary comments begin with a hash mark (or octothorpe) #.  All symbols from the hash mark to the end of the line are ignored.

Examples

```
#The following line of code computes a number
z=a\*b+c
  
f=open("input.csv","r")            #open file for reading
```

#### Docstrings

A special type of string literal is surrounded by triple double quotes """a""". When placed at the top of a unit of code, immediately after the declaration of the unit name if present, and indented to the correct level, the interpreter recognizes these as a special type of comment called a _doctring_ (documentation string).  Spyder automatically puts a mostly-empty docstring at the top of each new file.  Docstrings are used to summarize the purpose and usage of the code that follows.

<pre>
def adding_function(x, y):
"""This function adds two numbers together and returns the result"""

    z = x + y
    return z

</pre>
or

<pre>
"""
This script does a bunch of simple math operations
Date: 5/18/2020
Author: John Doe
"""

x = 1
y = 2

z = x + y
n = z - 10
v = n * 3

counter = 0

for i in z:
    count += 1
</pre>

### Exercises

<details>
<summary>Exercise 1</summary>
<p>Type into your choice of Spyder's interpreter pane or a JupyterLab cell the following assignments.
<pre>
<code>
x=17.0
Xs=11.0
num_1=10
num_2=14
</code>
</pre>
Use expression evaluation to look at the results of the next lines. In JupyterLab each expression must be in its own cell. In the Spyer interpreter pane it will evaluate each expression when you go to the next line.
<pre>
<code>
x
Xs/x
Xs//x
Xs/x+x
Xs/(x+x)
x/num_1
num_1/num_2
num_2/num_1
</code>
</pre>
</details>

<details>
<summary>Exercise 2</summary>
Use expression evaluation to examine the results of the following:
<pre>
<code>
4+2*3
(4+2)*3
20/4*5
20/(4*5)
.1+.2
5//2
5//-2
11//3
11.4//3.5
11%3
11.4%3.5 #?
11.4-(11.4//3.5)*3.5
</code>
</pre>
</details>

<details>
<summary>Exercise 3</summary>
Examine the results of the following:
<pre>
<code>
a=11.0; b=9.0; c=45.0 n=3
print(a &gt b)
print(a &lt b and c==n)
print(a &lt b or c==n)
print(a &gt b or c==n and a &lt b)
print((a &gt b or c==n) and a &lt b)
is_greater=a &gt b
print(is_greater,type(is_greater))
</code>
</pre>
</details>

---

{{< series-buttons overview="/categories/summer-education-series-programming-in-python/" prev="/lesson/ses-python-intro/welcome/" next="/lesson/ses-python-intro/loops/" >}}
