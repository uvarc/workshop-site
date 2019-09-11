---
title: "Introduction to Programming in Python"
author: "Katherine Holcomb"
# date: 2019-09-114T10:00:00-00:00
categories: ["Python Programming"]
toc: true
---

# Introduction to Python

## Setting up Your Environment

The Anaconda environment from [Anaconda Inc.](https://anaconda.com) is widely used because it bundles a Python interpreter, most of the popular packages, and development environments. It is cross platform and freely available. Download and install the Anaconda Distribution product appropriate for your operating system (Windows, Mac OSX, or Linux).  There are two somewhat incompatible versions of Python; version 2.7 is deprecated but still fairly widely used.  Version 3 is the supported version.  We will use Python 3 but if you know you need to use Python 2.7, you can download that instead.  Anaconda even makes it relatively easy to install both versions.

Once you have installed Anaconda, find the Navigator application.  You should see a workspace similar to the screenshot, with several options for working environments, some of which are not installed.  We will use Spyder and Jupyterlab, which should already be installed.  If not, click the button to install the package.

### JupyterLab

![AnacondaNavigator](/images/python/AnacondaNavigator.png)

We will start with Jupyterlab.  Launching it will cause a tab to open in your Web browser. Select the Jupyterlab icon.  It may take a while to start.  When it opens, you will see a list of your files on the left and three icons to select the mode.  Jupyterlab incorporates a Jupyter notebook server as well as a plain Python console and a simple text editor.  We want to start a Jupyter notebook so click on the top tile.

![JupyterLabSetup](/images/python/JupyterLabSetup.png)

A textbox will open.

![JupyterLabInput](/images/python/JupyterLabInput.png)

Your notebook is untitled.  Open the File menu and click Rename.  Name your notebook hello.ipynb then click the Rename button.

![JupyterLabRename](/imags/python/JupyterLabRename.png)

#### Cells

The blank line with the blinking cursor is a cell.  You can type code into the cell.  After the `In[]` prompt type `print("Hello")`
To execute the cell click the arrowhead, or type the `shift+enter` keys together.

#### Your First Program

If you are using Python 2.7 please begin all your programs with the line
`from __future__ import print_function`
The symbols surrounding `future` are double underscores.

Type the following lines into a cell.

```
Numerals=list(range(1,11))
print(Numerals[3])
print(Numerals[:3])
print(Numerals[3:])
print(Numerals[4:6])
```

Run this cell.  Is the result what you expected?

Now add lines

```
Numerals.extend(list(range(11,21)))
Numerals[3]=11
del Numerals[4]
print(Numerals)
len(Numerals)
```

##### Some Strings

In a new cell Type

```
greeting="Hello World"
hello=greeting[0:5]
greeting2=hello+" there"
output=greeting2+"\n"*2
```

The symbol `\n` stands for "new line."  Run this cell.  In a new cell type

```
output
```

Run cell.  then

```
print(output)
```

When your are working directly at the interpreter, you can type a variable and it will print the value.  This is called _expression evaluation_.  Using the `print` function observes any formatting.

#### Text Editor

JupyterLab includes a simple text editor you can use to create files.  In the upper left of your JupyterLab tab, click `+` to start the launcher. Choose the text editor. Type

```
def hello():
    print("Hello")
    return None
hello()
```

Be sure to indent lines exactly as shown, and to return completely to the margin for `hello()`. Select your text. From the Editor menu select Language.  Scroll (far) down to Python.  You will now enable syntax coloring for this file.  From the File menu choose Save As. Name the file `hello_func.py`  By default, files will be saved into the folder in which JupyberLab is working. The default is your "User" directory.  After saving the file, return to your Jupyter notebook page and type

```
import hello_func
```

Then run the cell.

#### Exporting

You can export embedded text in your notebook into a script.  First make sure your notebook has a name.  If you have not named your current notebook yet, call it `first_script.ipynb`.  From the Notebook menu find Export To->Executable Script.  Save the script in the usual way from your browser.  If it is in `Downloads` move it to a location of your choice.  You can make a new directory for your Python scripts if you wish.

### Spyder

Now we will switch to Spyder.  Spyder is an Integrated Development Environment, or __IDE__, aimed at Python.  It is well suited to developing longer, more modular programs.  To start it, return to the Anaconda Navigator and click on its tile.  It may take a while to open (watch the lower left of the Navigator).  Once it starts, you will see a layout with an editor pane on the left, an explorer pane at the top right, and an iPython console on the lower right.  This arrangement can be customized but we will use the default for our examples. Type code into the editor.  The explorer window can show files, variable values, and other useful information.  The iPython console is a frontend to the Python interpreter itself.  It is comparable to a cell in JupyterLab.

![Spyder](/images/python/Spyder.png)

If you are using Python 2.7, add the `future` line immediately after the triple-quoted section.

If you type

```
print("Hello World")
```

into the editor pane, it is a script and you must run it in order for the command to be carried out.  Click the green arrow to run the current script.

You can also type commands directly into the iPython console.  Just as with JupyterLab, if you type an expression its value will be printed.

```
In  [1]: x=5
In  [2]: y=7
In  [3]: x+y
Out [3]: 12
```

This is not the case for expressions typed into the editor pane.

```
x=5
y=7
x+y
```

We will see nothing if we run this as a script.  You must add a `print` command to see any output as well as running the script.

In the iPython console we can also use up-down arrow keys to screen in our commands, and right-left arrows to edit them.

#### Example

We can see some of these features in action by creating a simple plot. after the green triple quotes in an "untitled" editor tab, type

```
import matplotlib.pylab as plt
```

First we see a yellow triangle, indicating a syntax problem -- in this case, `plt` is imported but not used.  We ignore this warning since we will be using it.  As we type

```
x=plt.
```

we see the editor show us our choices from the pylab _package_. We can select one or keep typing.  We type

```
x=plt.linsp
```

to narrow it down further.  That leads us to

```
x=plt.linspace
```

The editor then pops up a box with the arguments required by linspace.  Finally we type inside the parentheses

```
-1.*plt.pi,plt.pi,100
```

for a final result of

```
x=plt.linspace(-1.*plt.pi,plt.pi,100)
```

After this we type

```
y=plt.sin(x)
plt.plot(x,y)
```

You must save a file before you can run it.  Go the File menu, Save As, and name it `sine.py`  Use the project folder you created earlier.  When we run this code, we see the plot appear embedded in the iPython window.  We can right-click on the image to bring up a menu that allows us to save the plot.

![SpyderSine](/images/python/SpyderSine.png)

#### The Variable Explorer

The Variable Explorer allows us to show the values of variables in our programs.  It is particularly helpful for looking at a group of values (an array). We can change the number of decimal places printed by clicking `Format` and typing in an expression of the `%3f` for three decimal places.  The Variable Explorer also includes icons for saving, refreshing, or importing data to our workspace.

To clear all values in the workspace, type at the iPython console

```
%reset
```

Now re-run your since-plotting code and observe how the variables acquire values.

#### Plotting in JupyterLab

In JupyterLab, open a new notebook with the `+` icon.  From the Files sidebar, navigate to your projects folder.  Double-click on the `sine.py` file to open it in the text editor.  Cut and paste the text into one or more cells in JupyterLab.  Run the cell(s).  What happens?

You need to add a line

```
plt.show()
```

Put this into a new cell and run it.  In the upper cell change `sin` to `cos`.  In the Notebook menu select `Run All Cells`

## Variables, Expressions, and Statements

### Variables

Variables in a computer program are not quite like mathematical variables.  They are placeholders for _locations in memory_.  Memory values consists of a sequence of binary digits (bits) that can be `0` or `1`, so all numbers are represented internally in __base 2__.  A standard called IEEE 754 defines the way decimal numbers are represented as base-2 numbers with a specific, and finite, number of bits for each value.  In most computer languages the number of bits per number can be 32 or 64, with some languages allowing 128-bit representations.  Eight bits is a _byte_, another frequently used unit in computing.

Names of variables are chosen by the programmer.  Python is case sensitive, so `myVariable` is not the same as `Myvariable` which in turn is not the same as `MyVariable`.  With some exceptions, however, the programmer should avoid assigning names that differ only by case since human readers can overlook such differences.

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

Floating-point numbers are represented internally by a variant of scientific notation, to base 2, with one bit for the sign and the rest for the mantissa and the exponent.  In most languages there are two types of floating-point numbers, single precision and double precision.  Single precision numbers are 32 bits long in total.  Double precision numbers occupy 64 bits.  Most of the time a Python floating-point variable is double precision.  Only in a few packages, mainly NumPy, is a single-precision floating-point number available.

A double-precision floating-point number has an exponent range, in base 10, of approximately 10<sup>-308</sup> to 10<sup>308</sup> and a decimal precision of about 15-16 digits.  The first thing to note is that this is _finite_.  The number of mathematical real numbers is infinite, and they must all be represented by the finite number of floating-point values.  It should be obvious, then, that infinitely many real numbers will map to the same floating-point number.  It also follows that only integers or terminating rational numbers can be exactly represented at all.  All other numbers are approximated.  Some numbers that are terminating in base 10 are not terminating in base 2 and vice versa.  Floating-point numbers do not obey all the rules of mathematical real numbers; in particular, they are commutative (so a+b = b+a) but are not necessarily associative (i.e. a + (b+c) may not equal (a + b) + c) and they are generally not distributive (so a x (b-c) is not necessarily equal to a x b-a x c).  For most work these properties of floating-point numbers do not matter, but for some types of scientific programs this behavior can be important.

The floating-point standard also defines special values INF (and -INF) and NAN.  INF or -INF means the absolute value of the number is too large to be represented.  NAN stands for "Not a Number" and is returned when a program attempts to perform a mathematically illegal operation, such as dividing by zero.  It is also frequently used in some Python packages to represent missing data.

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

<details>
<summary>Exercise 1</summary>
<p>Type into your choice of Spyder's interpreter pane or a JupyterLab cell the following assignments.
<pre>
<code>
x=17.
Xs=11.
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

the interpreter must follow a set of rules to evaluate each operation.  Python, as well as most other programming language, carries out the operations from left to right by the priority assigned to each operator.  In Python the ranking for arithmetic operators is, from first to last, \*\*, then (\* /) have equal rank, followed by (+ -) also with equal rank.  So in the expression above, the interpeter first evaluates x\*z, then w/y, then adds those two results together, and finally adds v.  If you want a different grouping you must use parentheses. For example, you may want to add y and v before dividing.

```
x*z-w/(y+v)
```

The interpreter will never be confused about the order in which it will evaluate an expression, but humans can often become confused.  It is better to include more parentheses than needed than to have too few, in order to keep your meaning clear both to the interpreter and your reader.

The Boolean operators have their own precedence rules. Highest to lowest are `not`, then `and`, then `or`.

All comparison operators have the same precedence relative to each other.  All comparison operators outrank all Boolean operators.

<details>
<summary>Exercise 3</summary>
Examine the results of the following:
<pre>
<code>
a=11.; b=9.; c=45. n=3
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

#### Code Blocks

Statements can be grouped into _blocks_ that function logically as a single statement.  In Python these blocks are indicated by the _indentation level_. You may indent each block by however many spaces you wish (3 or 4 is usually recommended), but each block level must be indented by exactly the same number.  Do not use tabs.

Many editors, including Spyder, will automatically indent the next statement to the same level as the previous one.  You escape to an outer level with the backspace or some other key.  Spyder also provides _Indent_ and _Unindent_ options in its Edit menu.  These are extremely convenient for Python since you need only select lines, then click indent or unindent to create or move a code block level.

Examples

```
def func(z):
    x=99.
    y=1.
    return (x+y)/z

if x==20:
   x=99
   if (x>=30):
       for i in range(x):
           j=i+x
```

#### Comments

Comments are statements or partial statements inserted for the benefit of human readers of the program.  Comments are ignored by the interpreter.  In Python ordinary comments begin with a hash mark (or octothorpe) #.  All symbols from the hash mark to the end of the line are ignored.

Examples

* \#The following line of code computes a number
  z=a\*b+c
* f=open("input.dat","r")  #open file for reading

#### Docstrings

A special type of string literal is surrounded by triple double quotes """a""". When placed at the top of a unit of code, immediately after the declaration of the unit name if present, and indented to the correct level, the interpreter recognizes these as a special type of comment called a _doctring_ (documentation string).  Spyder automatically puts a mostly-empty docstring at the top of each new file.  Docstrings are used to summarize the purpose and usage of the code that follows.

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

The "condition" must be an expression that evaluates to True or False; that is, it must be a Boolean variable or expression.  Boolean expressions are formed from other types of variables with conditional operators.

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

One of the most fundamental processes in a computer program is to repeat statements many (perhaps many, many, many) times.  Computers never run out of patience.

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
for i in range(10):
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
Write a loop that will sum the first N integers.  Hint: you will need a variable called an <em>accumulator</em> whose value starts outside the loop at 0.
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

## Lists

Lists are one of the most important data types in Python.  They are flexible and easy to use. Lists are ordered collections of objects.  Each element of the list can be of any type, including another list.  Lists are _ordered_ which means that each element can be referenced by an integer _index_.

Lists are dynamically sized and they are __mutable__.  Unlike most variables in Python, they must be declared in some manner before they can be used.

* Empty List
  * L=\[]
* Return a new list from a built-in function
  * L=list(range(12))
    This returns a list of integers 0,1,..11

As for all ordered types in Python, the indices start at 0.  The upper bound in any range is the limit we _do not_ reach.

#### List Elements

To access a particular element by its index, we enclose the index value in square brackets.

```
L[2]
```

Lists are mutable so individual elements can be changed.

```
myL=[1,2,3]
myL[1]=4
print(myL)
```

Sublists are obtained must like substrings.  They are often called _slices_.

```
subL=L[1:3]
```

Here the colon is again the range operator.  Always remember that the upper bound is excluded, so this slice is elements 1 and 2, which are the second and third elements.

```
subL=L[2:]
```

This extracts elements from the third to the last.

```
subL=L[:3]
```

This extracts the elements from the beginning to the third element (index number 2).

A stride can also be specified

```
subL=L[1:7:2]
```

This extracts elements 1, 3, and 5.

#### Changing Lists

* Initialize
  * L=\[]
* Initialize a list of known size (the value can be a variable but must have a value when this statement is executed)
  * L1=[0]\*N
* Append an element to a list
  * L1.append("Graham")
* Extend a list with another list
  * L1.extend(["Michael","Terry"])

Appending adds the argument as the new last element exactly as it appears. It takes any type.  Extending requires a list as its argument.  It concatenates that list at the end of the original one.  It is is equivalent to

* L=[1,2,3]+[4,5,6]
* insert an element
  * L.insert(i,item)
  * This inserts `item` before element `i`. To add an item at the beginning of the list, use
    * L.insert(0,item)

Shortening lists:

* Delete an element by its indext
  * del L[i]
* Delete the first occurrence of a particular element
  * L.remove(item)
  * The `item` must match exactly or an error occurs.
* Remove and return an element
  * item=L.pop(\\&lt;i>)
  * The angle brackets indicate an optional argument.  If it is absent the _last_ element is returned.  If it is present that value is returned.
    * lastVal=L.pop()
    * A_val=L.pop(2)
  * Keep in mind that pop shortens the list.

Much more can be done with lists.

* Length
  * lenL=len(L)
* Maximum or minimum value of the items (if they are the same type)
  * max(L) min(L)
* Membership test (returns Boolean)
  * item in list
* Index of first time item occurs
  * myIndex=L.index(item)
* Number of times item occurs
  * numItem=L.count(item)
* Sort a list (when possible) in place (overwrites the original)
  * L.sort()
* Return a sorted list to a new list
  * Lsorted=sorted(L)
* Reverse the list in place (overwrites)
  * L.reverse()
* There is no direct function to reverse and return another list, so we use this handy trick
  * Lreversed=L\[::-1]
* In Python 3, `reversed(L)` returns an _iterator_ and not a list, but you may use 
  * Lreversed=list(reversed(L))

<details>
<summary>Exercise 8</summary>
<pre>
<p>
Type
<code>
numList=list(range(10))
</code>
Print the length of the list.
Change the fourth element to 11.
Extend the list with L=[20,30,40]
Print the index of the item 9
Remove that item from the list.
Printe the current length of the list.
Sort the list and then reverse the sorted version.
</p>
</pre>
</p>
</details>

Copying lists:

```
A=[1,2,3,4]
B=A
print(A)
B[2]=9
print(a)
```

B is just an alias (a "nickname") for A.  If B changes so does A.  __This is true for all mutable types.__ Slicing notation creates a _view_ that can make a copy if the entire list is included.

```
C=A[:]
C[1]=11
print(A)
print(C)
```

An alternative is to explicitly use the list constructor function:

```
D=list(A)
```

## Tuples

A tuple is a Python ordered sequence object that is similar to a list but is __immutable__.  Tuples are indicated by parentheses (round brackets). Like all ordered sequences, we can refer to individual elements with [n] and slices with [lb:ub].  As for all other ordered sequences, numbering of elements starts at 0 and the upper bound of a range is excluded.

Creation
  T=tuple((1,2,3))
Length
  len(T)
Concatenation (as for strings, must assign to a new variable)
  T3=T+T2
Membership
  3 in T
Iteration
  for i in T: print(i)

Although the tuple is immutable, any mutable _elements_ can be changed.

```
myList=list()
t=(myList,myList)
myList.append(1)
print(t)
myList.append(2)
print(t)
```

Since they are immutable, tuples have fewer defined operations than lists.  They can be indexed and slices like lists.

```
T=(1,2,3)
T2=T[1:]
```

One important set of operations on tuples is packing and unpacking.  If the context is unambiguous, the parentheses are not required.

```
T=1,2,3
print(type(T))
x,y,z=T
print(x,y,z)
```

Occasionally we need a tuple with one element.  This is not the same thing as a single variable so we must distinguish them.  A tuple with one element _must_ be declared like (E,) -- the comma is required.

#### Lists or Tuples?

A tuple should be used whenever the structure should not be dynamically changed or resized.  

Tuples are preferred over lists for returning multiple values from functions.  

Tuples are often used for heterogenous data, i.e. elements of different types.  List elements are typically homogeneous (all the same type) though this is not a requirement.

### Strings

The string type is widely used in Python.  A __string__ consists of a sequence of characters.  It is a compound type and immutable.  Individual characters are represented either by the ASCII standard (1 byte per character) or Unicode (2-4 bytes per character).  Strings that are to be treated as unicode are type `unicode` rather than string, but otherwise behave similarly.  The representation of a character as a sequence of bits is called the _encoding_.  The default encoding may depend on the operating system but in newer Python versions is usually a standard called _utf-8_.  UTF-8 can represent over one hundred thousand characters and can embed different scripts within the same text file.

The length of a string can be dynamically determined when the script is run, but once set, it is fixed because strings are immutable. The string variable can be overwritten, however.

String literals are indicated by double quotes "a".

```
Line_1="The first line of a file\\n"
```

The `\n` symbol represents a new line and is treated as a single character.  The length of the above string is 25; spaces and the newline count.

If a string literal is surrounded by triple double quotes """s""" it is verbatim, including newlines typed.

```
s="""This string is a
     multiline quote."""
```

If evaluated as an expression, the string will show the newline.  If the print function is used, it will print exactly as typed.

### String Operators

Python supplies many string operators and functions.  Among the most commonly used are

* concatenation
  * s1 + s2
* number of characters
  * len(string)
* type conversion from numerical type to string
  * str(f)
* type conversion from string to numerical type.  This must be possible according to the interpreter's rules for the numbers.  In particular, the string "3." does not represent an integer.
  * float(s)
* raw string: no characters are taken to be special characters.  Sometimes particularly useful on Windows. Either `r` or `R` can be used.
  * r'This is a string \\ with no special characters \\n'

<details>
<summary>Exercise 9</summary>
<pre>
<code>
s1="Today \n is a new day."
s2=r"Today \n is a new day."
print(s1)
print(s2)
</code>
<p>
Define variables <code>x=21.0, n=30, s="My new string."</code>.
Convert <code>n</code> into a float and store the results into a new variable <code>y</code>
Set a variable <code>the_answer</code> containing the literal string "42." (be sure to include the period). Type
<code>
z=int(the_answer)
</code>
What happened? Try
<code>
z=float(the_answer)
</code>
</pre>
</p>
</details>

#### String Comparison Operators

String comparisons use the familiar symbols but _lexical_ ordering.  This can result in some surprises if the strings represent numbers.  Never forget that strings are a completely different type from the numbers they may seem to represent!  Equality also requires exact equality, including spaces, matching cases, etc. 

* Equality 
  * ==
* Lexically greater than or lexically greater than or equal
  * \> >=
* Lexically less than or lexically less than or equal 
  * &lt; &lt;= 

Example

```
s1="This is a string."
s2="That is a string."
s3="This is a string"  #no period
print(s1==s3)
print(s1<=s2)
```

<details>
<summary>Exercise 10</summary>
<pre>
<p>
<code>
number_1="10"
number_2="2"
print(number_1 &lt number_2)
</code>
</pre>
</p>
</details>

#### Substrings

Although a particular string variable is immutable, it is possible to extract substrings from it.

```
sub_string=string[0:3]
```

In this context the colon (:) is called the _range operator_.  For all ordered types, Python counts _from zero_.  So the first character is numbered 0, the second is 1, and so forth.  The upper bound is always _exclusive_ in Python. Thus the sub_string consists of characters 0, 1, and 2.

Since strings are immutable we cannot assign values to a substring; that is, they cannot appear on the left-hand sign of an assignment = statement.

<details>
<summary>Exercise 11</summary>
Type into the Spyder interpreter pane or a JupyterLab notebook.  Remember that in Jupyter each evaluation expression should be run in its own cell.
<pre>
<code>
title="This is a string."
subtitle="This is another string."
len(title)
title+":"+subtitle
newtitle=title+" : "+subtitle
len(newtitle)
newtitle[2:4]="at"  #Error-why?
x=19.58
print("The value of x is {:f}".format(x))
</code>
</pre>
</details>

### More Advanced String Handling

One of Python's strong points is its ability to do many things well, so both numerical and textual analysis can be done with the same language.  We will look at some of the many ways we can manipulate strings in Python.  It is important to distinguish between string _functions_, which take a string as an argument, e.g. `sfunc(mystring)`, and string _methods_ that follow the string variable, e.g. `mystr.amethod()`.  Both perform operations on the string.  Later, when we have studied classes, we will better understand why the syntax differs.

#### Categorization

Several methods are available to determine whether a string represents letters or may be text.  They apply to the entire string.

* isalpha, isdigit, isalnum
  * is alphabetic, is a number, is alphanumeric (combination of numbers and other characters)
    * mystr.isalpha()
* isupper, islower, istitle
  * is uppercase, is lowercase, is "title case" (first letter of each word capitalized, all others lower case)
    * mystr.isupper()

#### Manipulating Case

* Switch to all uppercase
  * upper
    * mystr.upper()
* Switch to all lowercase
  * lower 
    * mystr.lower()
* Convert to title case 
  * title 
    * mystr.title()
* Swap cases 
  * swapcase
    * mystr.swapcase()

#### Searching and Tests

* Find a character or substring.  Returns location of _first_ occurrence only.
  * find(s)
    * returns -1 if it does not find the substring 
    * mystr.find(s)
  * rfind(s)
    * searches right to left
* index(s)
  * throws an exception if the substring is not found 
    * mystr.index(s)
  * rindex(s)
    * searches right to left
* count(s)
  * Counts the number of occurrences of substring s.  Case sensitive.
    * mystr.count(s)

#### Modifying and Filling

* Remove characters from beginning and end (empty parentheses remove spaces and tabs). The angle brackets indicate an option and are not typed
  * mystr.strip(\\&lt;;chars>)
    * mystr.rstrip(\\<chars>), string.lstrip(\\&lt;chars>)
* Replace substring a with b
  * mystr.replace(a,b)
* Expand tabs 
  * The default is 8 spaces per tab.  If a different number is required, pass it in the parentheses.
  * mystr.expandtabs()  #8 spaces 
  * mystr.expandtabs(4) #4 spaces 
* Justify in a field of width n spaces 
  * mystr.rjust(n), mystr.ljust(n)
* Center in a field of n spaces 
  * mystr.center(n)
* Fill spaces with zeros in field of width n (mainly used for numbers)
  * mystr.zfill(n)

#### Splitting and Joining

* Split on string `s`.  Most usually splits on a character.  Splits on whitespace (spaces and tabs) when the delimiter isn't specified.  Returns a list with the delimiter removed, and each separated string an element of the list.
  * split(\\&lt;s>)
    * mystr.split()
    * mystr.split(',')
* Split on newlines.  Returns a list of the lines, with newline characters stripped.
  * mystr.splitlines()
* Join a list of strings with a string (usually a single character).  This is the inverse of split.  The syntax is peculiar, for Python.
  * \\&lt;s>.join(list)
    * "".join(strlist)
      * joins a list with no spaces or other characters between
    * ",".join(strlist)
      * joins a list with commas between

#### String Module

All of the string operators and methods are available in the base Python installation.  However, there is a package `string` which contains some useful string literals.

```
import string 
string.ascii_letters
string.ascii_lowercase 
string.ascii_uppercase 
string.digits 
string.hexdigits 
string.octdigits 
string.punctuation   #(depends on the locale)
string.printable 
string.whitespace    #space, tab, linefeed, return, formfeed, and vertical tab.
```

## Dictionaries

So far the compound types we have studied have been _ordered_.  We access elements by integer _indices_ numbered from 0 to N-1, where N is the total number of elements.  Dictionaries, in contrast, are _unordered_.  Elements are accessed by a _key_ which may be of any immutable type. If a tuple is used as a key, no elements of the tuple may be mutable.  Keys must be _unique_ (no duplication)

The key corresponds to a _value_ which may be of any type, including mutable types such as lists. The dictionary consists of all key-value pairs.  Dictionaries themselves are _mutable_ and may be of any length up to the limits of the system.  Dictionaries can be nested, i.e. the value may itself be a dictionary.

Dictionaries are denoted by curly braces (){}).  A key-value pair is separated by a colon (:).

### Creating Dictionaries

* Declaring an empty dictionary
  * D={}
  * Note the similarity to an empty list, but we use curly braces.
* Enumerating the key-value pairs
  * D={'Alice':'2341', 'Beth':'9102', 'Cecil':'3258'}
  * Another option to create a dictionary with initial entries
    * D=dict([('Alice','2341'),('Beth','9102'),('Cecil','3258')])
* Adding an entry
  * D['Dan']='5837'
  * If the key 'Dan' is not present, it will be created and the specified value assigned.  If it is present already in the dictionary, the value will be replaced.

### Dictionary Operations

* Length of the Dictionary
  * len(D)
  * The length is the number of key-value pairs, i.e. the number of keys.
* Delete the key-value entry
  * del D[k]
* Delete all entries
  * D.clear()
* Generate an iterator of keys 
  * keys=list(D.keys())
  * Omit the list constructor if all you need is an interator.
    * for k in D.keys():
    * In a `for` loop the keys() can be omitted:
      * for k in D:
* Generate an iterator of values
  * D.values()
* Analogous to `enumerate` for lists, we may use `items` to loop through a dictionary and obtain both the key and value
  * for k,v in D.items():

Quiz:

What is the difference between

```
data=[]
data[0]=12
data[1]=4
```

and 

```
data={}
data[0]=12
data[1]=4
```

Are both correct? Is either correct?

#### More Key Handling Methods

D[key] alone results in an error if the key is not in the dictionary.  If you must attempt a lookup and do not know whether the key is present, use `get` instead.  

```
D.get(key)
```

This returns None by default if the key is not found.  It can be set to return a value with an optional argument.

```
D.get(key,0)
```

The `in` operator may also be used 

```
if key in D
```

or

```
if key not in D
```

depending on what you want to do.

<details>
<summary>Exercise 12</summary>
<pre>
<p>
Type into Spyder or Jupyterlab and run
<code>
capitals={"Alabama":"Montgomery"}
capitals\["Alaska"\]="Juneau"
capitals\["Arizona"\]="Little Rock"
print(capitals.keys())
print("Virginia" in capitals)
print("Arkansas" in capitals)
newstate="Connecticut"
newcapital="Hartford"
if newstate not in capitals:
    capitals[newstate]=newcapital
for key in capitals:
    print("The capital of",key,"is",capitals[key])
</code>
</p>
</pre>
</p>
</details>

## Sets

Sets are another _unordered_ type.  No element of a set may be duplicated.  The set is mutable but all elements must be immutable.

Create the set with the set() function.  Empty parentheses will not work because those are used for an empty tuple (which will thus remain empty).

A frequent application of sets is to eliminate duplicates.

```
L=[0,0,1,4,8,8,10]
M=list(set(L))
print(M)
```

Since sets are unordered, the order of `L` is not guaranteed to be preserved.

### Set Operations

* Add an element to set s
  * s.add(item)
* Extend with a sequence 
  * s.update(t)
* Remove an item (will fail silently if the item isn't present)
  * s.discard(item)
* Remove with an exception if the item isn't is_present 
  * s.remove(item)

The `in` operator works even though, strictly speaking, sets are not sequences.

```
item in s
```

Sets attempt to reproduce most of the properties of mathematical sets.  

* Test for subset (a set is a subset of itself)
  * s2.issubset(s1) or s2&lt;=s1
* Test for superset (similarly, a set is its own superset)
  * s1.issuperset(s2) or s2>=s1
* Intersection
  * s1.intersection(s2) or s1&s2
* Union -- the | symbol is a pipe 
  * s1.union(s2) or s1|s2
* Symmetric difference (elements in one or the other but not both)
  * s1.symmetric_difference(s2) or s1^s2
* Set difference (elements in s1 but not in s2)
  * s1.difference(s2) or s1-s2

<details>
<summary>Exercise 13</summary>
<pre>
<p>
Type at the interpeter 
<code>
s=set()
s.update("California")
print(s)
</code>
What happened?  Lesson: be careful with strings since they are sequences.
<code>
states={"Alabama","Arkansas","California","California"}
</code>
Initialization with curly braces has been valid since Python 2.6.  Since there are no key-value pairs it will not be construed as a dictionary.
<code>
print(states)
states2=set()
states2.add("California")
states2.add("Colorado")
states2.add("Oregon")
states-states2
states&states2
states^states2
states|states2
</code>
</pre>
</details>

## Input/Output

Programs are not very useful if they cannot communicate their results.  They are also not terribly useful if they cannot change their controlling parameters to compute different results.

It is best to make your program read its input parameters, rather than embedding them (hard-coding) them into the program body.  You may want to change the parameters later or run it for many different sets of parameters.  You may give your program to somebody else who will have to modify it.  Always assume your program may later be used for a slightly different purpose, whether by someone else or by you.

### Console Input

The console is a text interface for input to and output from the computer.  In Spyder, the iPython window itself can serve as a console.  In Jupyterlab the output console is indicated by lines marked with `Out []` whereas a reference to an input console will open a textbox. 

To read input from the console we use the `input()` function (Python 3+).  In Python 2.7 the equivalent is `raw_input()`.  Any string within the parentheses is optional and, if present, if will be printed to prompt the user.  The input from the user is captured as a string and returned; it must be stored for any subsequent use.

The input (raw_input) function returns \_only_ a string.  If you need to use the values as any other type, you must perform the conversion yourself.
Example:

```
weight=input("Enter your weight in pounds:")
print(type(weight))
weight=float(input("Enter your weight in pounds:"))
print(type(weight))
```

### Console Output

We have already been using the `print` function.  Let us now examine it in more detail.

The print function

* always inserts a space between its arguments
* always adds a newline character unless the `end` argument is added.
  * print(var,end="")

Messages can be added in between variables.

```
h=1.45;
w=62.
print("Your BMI is",w/ht**2)
```

<details>
<summary>Exercise 14</summary>
<pre>
<p>
Use Spyder to write a <em>complete</em> program to compute BMI from weight and height input from a user.  First request the user's choice of units.  We have not spent much time with strings yet so you may use a digit to indicate the user's choice. Then request weight and height.  Remember that you will need to convert from strings.  Compute the BMI using the appropriate units and print the result to the console.   
</p>
</pre>
</p>
</details>

#### Formatted Output

So far we have only considered _list-directed_ input/output.  We leave it to the interpreter to format.  However, we often want or need more control over the format.  For this we define __format strings__.

Formats are indicated by a pattern

```
F.wf
F.wg
F.we
```

F is the field width (total number of columns occupied), w is the number of digits to the right of the decimal point; these must be substituted by numbers. The letters f, g, and e are called _format codes_ and indicate floating-point (decimal point) format, general format (interpreter decides f or e), and exponential notation.  If we do not specify w for numbers, the default is 6 decimal digits printed.  If we specify the number of digits the interpreter will _round_ the result; if unspecified it will _truncate_.

Examples:

* Use exactly 15 spaces with 8 decimal places 
  * 15.8f
* Let the interpreter decide the total field width but use 8 decimal places 
  * .8f
* Print a float as an integer (this will truncate, not round, the decimal places)
  * 0f
* Print in scientific notation with three decimal places
  * .3e

Strings are specified with the letter `s`. They do not take a field width but can be adjusted or zero padded by using more advanced operations on the string to be printed.

Integers are specified by `d` (this stands for decimal, as in base-10 number) with an optional field width.  If the field width is wider than the integer, it will be padded with blanks by default.  If it is narrower it will be ignored.  If omitted the intepreter will use the width of the integer.  

To pad with zeros, write the zero in front of the width specifier.

Examples:

```
5d
05d
```

### Formatters

To construct our formatted output we use _format strings_, also called _formatters_.  We insert curly braces as placeholders for variables in the finished string.  Format codes go inside the braces following a colon.

* print("The value of pi is approximately {:.6f}".format(math.pi))
* print("Pi to {:d} digits is {:.12f}".format(n,math.pi)

We have left the space to the left of the colon blank, but it represents the order of the arguments to `format`.  Thus the second example is equivalent to

* print("Pi to {0:d} digits is {1:.12f}".format(n,math.pi))

This means we can rearrange the output if we wish.

* print("Pi is {1:.12f} to {0:d} digits".format(n,math.pi))

Empty curly braces result in default formatting and ordering.  In this situation one could use list-directed formatting as well, but using a formatter enables more control over layout and spacing.

* print("I have {} books to read by {}".format(12,"tomorrow"))

<details>
<summary>Exercise 15</summary>
<pre>
<p>
Type at the interpeter 
<code>
import math
</code>
Practice printing math.pi
- Print without any formatting
- Print using the default f format
- Print to 5 decimal places 
- Print the integer part 
- For at least one of the above, add a message
- Print the number of digits to at least 6 spaces and pad with zeros
- Print the number with a message that specifies the number of digits, where the number of digits is also to be printed.
</p>
</pre>
</p>
</details>
</p>

Even more sophisticated formatting is possible.  In the above examples, when printing pi the value of `n` had to be 12 or my output would be inconsistent.  In newer Python versions we can make the width a variable.

* print("Pi to {} digits is .{dec}f}".format(math.pi,dec=n))

#### Formatting with f-Strings

For Python 3.6 and up the _formatted string literal_ or f-string was introduced.  These can be used to create formatted output easily.

Example

```
n=12
print(f"Pi to {n} places is {math.pi:.{n}f}")
```

The f-string evaluates the contents of the curly braces when the program is run.  That means that expressions can be used inside the curly braces.

```
print(f"Pi to {n//3} places is {math.pi:.{n//3}f}")
```

In this example, the integer division is required because the result of the expression must be an integer.

If quotation marks are needed inside an f-string (such as for a dictionary key) they must be single quotes.  In addition, the backslash () cannot be a character within an f-string, so if a character such as the newline (\\n) is needed, it must be assigned to a variable.

## File IO

Most of the time we read or write from a file rather than from the console.  File input/output can be complicated in Python and we will later see some built-in means of reading particular types of files, particularly comma-separated-values (CSV) text files.

Before anything can be done with a file we must _open_ it.  This attaches the file name to the program through some form of _file descriptor_, which is like an identifier for the file.  Once opened we do not refer to the file by its name anymore, but only via the ID.

### Opening a File

We open a file and associate an identifier with it by means of the `open` statement.

```
fp=open("filename")
fin=open("filename","r")
fout=open("filename","w")
```

The default is read-only.  Adding the `r` makes this explicit.  To open for writing only, add the `w`.  This overwrites the file if it already exists.  To append to an existing file, use `a` in place of `w`.  Both `w` and `a` will create the file if it does not exist.  To open for both reading and writing, use `r+`; in this case the file must exist.  To open it for reading and writing even if it does not exist, use `w+`.

### Reading from a File

The standard read commands in Python read _only strings_.  Even if the input values are intended to be numbers, they are read in as strings.  Any conversions must be done by the programmer.

Reading commands

* f.read()
  * Reads the entire file identified by `f` into one large string
* f.readline()
  * Reads a single line (including the newline character) from the file `f`
* f.readlines() 
  * Reads all the lines into a list, one line per list element.  Newlines are included.

We have several options to handle the strings when reading directly from a file.  One option is to use read, then split all the lines on the "\\n" character

```
fin=open("filename","r")
the_file=fin.read()
file_list=the_file.split("\r\n")
```

We can now process through the list using a loop.  Note that we use `\r\n` to make sure we accommodate Windows, Mac OSX, and Linux operating systems.  

Yet another option is to use a Python idiom in which we iterate through the file using the file identifier.  Suppose we have a file with comma-separated values.  We can read the data with

```
fin=open("filename")
for line in fin:
    data=line.rstrip("\r\n").split(",")
```

In the example above, we have not done anything to store the values of the data, so each time through the `data` variable will be overwritten and the previous values lost.  How we handle this will depend on the file and what should be done to its contents.  One common approach is to declare lists to hold the values in advance, then append as we go.

```
fin=open("filename")
x=[]
y=[]
fin.readline()
for line in fin:
    data=line.rstrip("\r\n").split(",")
    x.append(float(data[0]))
    y.append(float(data[2]))
```

When we have completed this loop x will contain the values from the first column and y will contain values from the third column.  In this example we are not interested in the other columns.  We also convert on the fly to float.  This example assumes that our data file has one line of text header, which we use `readline` to skip.

We will not go into much detail about reading files since we will later cover packages that offer more convenient ways to read the most common formats.  

### Writing Files

To write a file it must have been opened appropriately.  We can use print with the addition of a `file=` argument.

```
f=open("myfile")
print("Format string {:f} {:f}".format(x,y),file=f)
```

Corresponding to `read` there is a `write`.  It writes _one_ string to the specified file 

```
fout=open("outfile","w")
fout.write(s)
```

The string can contain newline markers `\n` but `write` will not insert them.  They must be positioned explicitly.

Corresponding to `readlines` there is a `writelines`

```
fout=open("outfile","w")
fout.writelines(seq)
```

here `seq` is a sequence, usually a list of strings.  The `writelines` will not add any end-of-line markers so as with write, they must be appended to every string in the sequence where a linebreak is desired.

### Closing Files

When you have completed all operations on a file you should close it.

```
fin.close()
fout.close()
```

Files will be automatically closed when your script terminates, but best practice is to close them all yourself as soon as you are done with it.  You _must_ close a file if you intend to open it later in a different mode.  You cannot reopen a file using an active file descriptor.  You must first close it.

<details>
<summary>Exercise 16</summary>
<pre>
<p>
Open a file 
<code>
data.txt 
</code>
in write mode.  Write to the file three columns of numbers separated by commas.  These columns should be
<code>
n n**2 n**3
</code>
for n going from 1 to 20.  
Read back the file.  Store each variable into a list.  Use these values to compute and print 
<code>
a+bn+cn<sup>2</sup>+dn<sup>3</sup>
</code>
for 
<code>
a=1., b=2.4, c=5.8, d=0.7
</code>
Print the results for each n you have.
</p>
</pre>
</details>

## Exceptions

Many situations can result in an error.  

* An attempt to read a file that isn't present 
* A attempt to cast a string to a number when the string does not represent a number 
* An index out of bounds 
* A key requested is not in the dictionary 

All these conditions (and many more) are called __exceptions__.  If you do not handle them, the interpreter will, and it will just stop with some error message.  We can prepare for failure by _catching_ exceptions ourselves.

### Catching Exceptions

The interpreter _throws_ an exception so we can _catch_ it.  We can do this with a `try except` block.  

```
try:
    fin=open("datafile.csv","r")
except IOError:
    print("Unable to open file.")
```

This stops on the named exception `IOError`.  Any other exception will not be caught.  It is not necessary to name exceptions; the following will be executed for any exception.

```
try: 
    something
except: 
    print("Error")
```

More processing is usually required, of course.

The interpreter provides a large number of built-in exceptions.  (See the documentation for a complete list.)  Some of the more commonly encountered are 
\_EOFError
\_IOError
\_KeyboardInterrupt
\_IndexError
IKeyError
\_NameError
\_NotImplementedError
\_TypeError
\_ValueError
\*ZeroDivisionError

You can provide more than one `except` for the same `try`

```
try:
   input=int(input("Please enter an integer:"))
except EOFError:
  print("You did not enter anything")
except ValueError:
  print("You did not enter an integer")
```

If you wish to do something particular when the `try` passes, use `else`

```
try:
    fout=open("outputfile.csv","w")
except IOError:
    print("Unable to open file")
else:
    print("File successfully opened")
```

If you have code that should be executed whether the condition passes or failes use `finally`

```
try:
   fin=datafile.read()
except IOError:
   print("Unable to read ",datafile)
finally:
   fin.close()
```

You cannot use an `else` in any `try` clause with a `finally`.

#### With/As

If properly supported, the `with` and `as` operators can replace the `try/except/finally` block.  This is probably most widely used with files.  The following will close the file whether the operation was successful or not.

```
with open('myfile','w') as f:
    for n in range(len(mylines)):
        mystring="whatever"
        f.write(mystring+'\n')
```

## Functions

Functions are self-contained units of code.  They enable us to isolate chunks of code into small packages.

Functions break down the programming into a series of well-defined tasks.  This makes code easier to read, debug, and maintain.  Functions also reduce "cut and paste" errors.  If a section of code does something more than once, it should be replaced with a function.

### Arguments

Like mathematical functions, programming functions (usually) take _arguments_.  In computer-science language the variable that represents an argument in the function definition is often called a _parameter_ or a _dummy variable_.  Functions must be _called_ by name or they do nothing.  Their code is static until it is invoked by a _caller_.  The interpreter must have encountered the function definition before it can be called; interpreters cannot move upward in a file.  In addition, invoking a function causes its name to take on the return value, but in Python functions are not equivalent to variables -- that value will not be stored anywhere.  It must be explicitly assigned, used in an expression, or printed for the result to be captured.

In strict usage the sequence of variables may be called the _argument list_ in the caller and the _parameter list_ in the function definition; however, these terms tend to be used interchangeably.  Arguments are said to be _passed_ from the caller to the function.  The function _returns_ a value, which replaces the function's name after it has been executed.  In Python functions must always return a value; if the programmer does not specify one, Python returns the special value `None`.  A function may return exactly one item, but that quantity may be a compound data structure such as a list or tuple, so it is possible to return multiple values from a function.

Best practice is to place all the functions you will use at the top of the file, right after the main docstring.  Functions may have a docstring themselves.  This is particularly important if the function is lengthy or complicated.

### Python Syntax

The keyword is `def` (define) followed by the name of the function.  The function name _must_ be followed by parentheses whether any arguments are passed or not.  The `def` keyword begins a code block, so a colon is required.  All statements in the body of the function must be indented.  The docstring must immediately follow the `def` line and be indented one level.  Recall that docstrings are enclosed in triple double quotes ("""string""").  Values are returned with the `return` statement.  The `return` causes an immediate exit from the function; no further statements will be executed.

Examples 

```
def sum_vals(x,y,z):
    "Computes the sum of its input values"
    return x+y+z

def make_list(x,y,z):
   "Makes a new list"
    new_list=[x,y,z]
    return new_list

def sum_diff(x,y):
    "Returns the sum and difference of two values"
    return x+y,x-y
```

Notice the use of tuple packing in the third example.  An equally valid, but not commonly used, last line could be `return (x+y,x-y)`.

<details>
<summary>Exercise 17</summary>
<pre>
<p>
If you have not already done so, type in the three functions from the example.  Run the cell or script.  Then type into the interpeter
<code>
sum_vals(1,2,3)
sum_vals(1.2,3.4,4.5)
sum_vals("1","2","3")
make_list(1.,11.,3.)
make_list([1.,11.],3.,4.)
sum_diff(3,4)
s_3=sum_vals(8,8,10)
s_3
</code>
</p>
</pre>
</p>
</details>

#### Dummy Parameters

The names of the variables in a function's parameter list are called dummies because they are placeholders.  The function can be called with any variable names in the caller.

```
xx=1.; yy=2.; zz=3.
sum_vals(xx,yy,zz)
sum_vals(zz,xx,yy)
sum_diff(xx,yy,zz)
sum_diff(zz,xx,yy)
make_list(xx,zz,yy)
make_list(yy,xx,zz)
```

The arguments in the lists in both caller and callee must agree in _number_ and in _type_.  There is a one-to-one correspondence between positional arguments in the caller and the callee so there must be exactly one in the caller for each in the callee.  In Python there is more freedom in the types but whatever happens to the variable in the function must make sense for the type that is passed to it.  For example, the `+` operator in `sum_vals` is defined for integers, floats, and strings (as well as for some other types) so it is valid to pass those types to the function, but they cannot be mixed.  An illegal operation on the type actually passed will cause the interpreter to stop with an _exception_.  

<details>
<summary>Exercise 18</summary>
<pre>
<p>
Convert your program from Exercise 14 to use a function to compute the BMI.
</pre>
</p>
</details>

### Optional and Keyword Arguments

Arguments whose values are determined from their ordering in the parameter list are called _positional_ variables.  Python supports _optional_ and _keyword_ arguments as well.  Opetional arguments are assigned a default value in the parameter list of the function definition.  If an optional argument is not present in the argument list passed by the caller, it takes on its default value; otherwise it is positional.

```
def func(x,y=0,w=3):
    return x+y-w
```

We can call this function with

```
c=func(x)
c=func(x,yy)
c=func(x,yy,zz)
```

In this example the optional arguments are passed by position as usual.  Optional arguments may also be passed by _keyword_, not position.  Any optional/keyword arguments must __follow__ any and all positional arguments in the list; except for that restriction their order does not matter and some may be omitted.

```
z=func(x,w=6,y=2)
val=func(x,w=9)
```

Default values are set only _once_, when the function is first encountered by the interpreter.  Only immutable types should be used as default values.

### Early Returns

The `return` statement exits immediately with no more statements being executed.  A function may contain multiple return statements, but only the first encountered will be executed.  In conjunction with conditionals, the function can thus return early.

```
def sum_vals(x,y,z):
    """A stupid function."""
    if (x==0 and y==0 and z==0):
        return -1
    return x+y+z
```

In this example, an `else` clause is not required because there is no subsequent use of the results.  Also note that the conditional as it as written affects the types that will be valid within the function.

### Variable Passing

Python passes variables in a manner called _assignment_. This means that if an argument is mutable and it is changed in the function, it __will change__ in the caller.  If it is _immutable_ it will not be changed even if the function changes its value; a local copy will be made within the function block.  If a function changes one of its parameters that is called a __side effect__.

<details>
<summary>Exercise 19</summary>
<pre>
<p>
<code>
def side_effect(L,x):
    L.append(x)
    return None 
L=[1,2,3,4]
side_effect(L,11)
print(L)
print(side_effect(L,99))
</code>
What is printed in the last line and why?  What is <code>L</code> now?
</p>
</pre>
</p>
</details>

### Variable Scope

The __scope__ of a variable is the range over which it has a definted value.  In Python, the scope is the code block in which the variable is first referenced.  Therefore a calling program may have a variable `x`, a function may also have a variable `x`, and if `x` is not an argument to the function then it will be distinct in the two units.  Variables defined above a `def` are global to the functions below it in the same file; that is, they are _in scope_ in the entire file.

When working in the interpreter (including running codes through Spyder repeatedly in the same kernal), the interpreter stores all variables with global scope into a workspace.  It may be desirable to reset these variables for new runs.  In an iPython console you can type

```
%reset 
```

to clear the workspace.  In Jupyterlab go to the URL bar and add `?reset` at the end, _viz_

```
http://localhost:8888/lab?reset 
```

<details>
<summary>Exercise 20</summary>
<pre>
Experiment with the following code (leave in or comment out x=100)
<p>
<code>
def set_x(x):
    print(x)
    x=100
    while x>0:
        x+=1
        if x>10000: break 
        if x<100: continue 
        x+=20
    return x
x=1
z=set_x(x)
print(x); print(z)
</code>
</p>
</pre>
</p>
</details>

## Functional Programming

Functional programming is a paradigm in which all aspects of the program are expressed as functions, there are no mutable variables, and there are no side effects.  In true functional programming languages such as Haskell, a function is a _first class data structure_.  It can be a _l-value_, which means that the function can appear on the left-hand side of an assignment like a variable in "imperative" langauges.  Functions in this style can also take functions as their arguments.  Python is not a functional language but has some constructs that provide a few of the features of such languages.

Functional programming makes use of "anonymous" or _lambda_ functions.  In Python we can use a __lambda expression__ to evaluate a function without giving it an explicit definition.  Lambdas must be expressible as a single expression; no statements are allowed.  A tuple of the variable names follows the `lambda` keyword, then a colon, and finally the expression of the variables.

```
fsquared=lambda x:x**2
fsquared(4)
import math
fhypot=lambda x,y:math.sqrt(x**2+y**2)
fhypot(3,7)
```

One of the most common applications of lambda expressions is to the built-in functions map and filter, with reduce built in to Python 2.7 and available through functools in Python 3.

* map 
  * first argument is a function, second argument is a sequence
  * applies the function to each element of the sequence and returns a new list (Python 2.7) or iterator (Python 3)
  * L1=map(square,S)          #Python 2.7
  * L1=list(map(square,S))    #Python 3
* reduce 
  * first argument must be a function that takes two inputs and returns a single input of the same type
  * total=reduce(sum,s)   #Python 2.7
  * import functools; total=functools.reduce(sum,s) #Python 3
* filter
  * first argument is a function that returns True or False.  
  * applies the function to each element of the sequence and returns a new sequence (Python 2.7) or iterator (Python 3)
  * L2=filter(func,s)  #Python 2.7
  * L2=list(filter(func,s)) #Python 3

Examples with lambda expressions (assumes Python 2.7):

```
V=[-1,0,1,2,3,4,5]
L=list(map(lambda x:x**2, V))
R=functools.reduce(lambda x,y:x+y, V)
F=list(filter(lambda x:x>0, V))
```

## List Comprehensions

A list comprehension collapses a loop over a list and, optionally, an if clause.  It can replace at least some functionals like `map` and `filter` if the desired result is a list.

```
squares=[x**2 for x in range(10)]
```

This is equivalent to

```
for x in range(10):
    squares.append(x**2)
```

With an option conditional it becomes

```
positives=[math.sqrt(x) for x in range(-10,11) if x>0]
```

This is equivalent to

```
for x in range(-10,11):
    if x>0:
        positives.append(math.sqrt(x))
```

List comprehensions are nearly always __much__ faster than the equivalent loop.

<details>
<summary>Exercise 21</summary>
<p>
<pre>
Assuming Python 3
<code>
import functools
z=lambda x,y:x**2-y
z(4,5)
vals=[1,2,3,4,5]
squares=list(map(lambda x:x**2,vals))
squares
sumsq=functools.reduce(lambda x,y:x\*\*2+y\*\*2,vals)
sumsq
small=list(filter(lambda x:x<20,squares))
</code>
</p>
<p>
Write an equivalent list comprehension for the map and filter statements.
</p>
</pre>
</details>

## Modules

Modules are fundamental to the programming model of Python.  Modules are programming units that (should) consist of _related_ variables and functions that form a coherent block of _data_+_procedures_ (functions).  They are an extension of the concept of packaging code that we have already studied with functions.

In Python every file you write is a module.  The name of themodule is the file name without the exension.  Every Python file must end in `.py` regardless of your operating system, so if you write a file `mycode.py` the corresponding module is `mycode`.  If you are using Jupyter you will need to export your code into a script in order to create a new module (Notebook tab -> Export to -> Executable Script).

Modules that are not run as the main program must be _imported_ for its contents to be accessible.  When a module is imported, it is compiled to a special representation called __bytecode__.  A new file of the same base name with the suffix `.pyc` will be created.  

Many modules and packages (collections of modules) are available through a base Python installation.  Anaconda provides dozens more, with others available for installation through the Environments tab of the Navigator.  We have already seen a handful of these built-in modules.  

```
import math 
import matplotlib.pyplot
```

When we import a module we bring in its __namespace__.  A namespace is an environment that holds a group of identifiers, such as variable and function names.  In Python the namespaces take the name of the module in which they are defined.  Namespaces can be renamed when the module is imported, but __not__ afterward.

### Importing Modules

With a simple import statement we must refer to the module's components with its native namespace.

```
import math 
import os 
import numpy 

z=math.sqrt(x)
home_dir=os.getenv("HOME")
A=numpy.zeros(200)
```

We can select only certain components with `from`

```
from modulename import func1, func2
```

Now only func1 and func2 can be used, and we do \_not\* precede their names with the native namespace.

```
z=func1(x,y)
w=a+b*func2(z)
```

To import __all__ symbols without a prefix use

```
from modulename import *
```

This statement imports all names that do not begin with a single underscore (\_) and makes them accessible without being preceded by the module name.

We can also rename individual symbols

```
from math import sqrt as squareroot
w=squareroot(10.)
```

One of the most commonly used versions of import changes the name of the namespace, typically to something simpler.

```
imoprt numpy as np
import pandas as pd

z=np.zeros(200)
data=pd.read_csv("my_data"file)
```

### Main Modules

When you run a script directly through the interpreter, such as by using the Run arrow in Spyder, it is in the "main" namespace.  Your module can also be imported into the interpreter or into another module.  It will still execute everything in the module, including requests for inpout and the like, unless you use the special variables \_\_name\_\_ and \_\_main\_\_ (two underscores on each side).  If you use \_\_main\_\_ you can place all code you want to execute only when run directly after a conditional.  

```
if __name__==__main__:
    do_work
```

It is customary to include code for the main namespace into a function named `main()`.  

```
def main():
    do_work

if __name__==__main__:
    main()
```

Example

```
#from __future__ import print_function, division #Python 2.7
from math import sqrt

def MySqrt(x):    
    """Babylonian method."""    
    my_sqrt=x/2.    
    tol=1.e-12    
    while abs(my_sqrt-s0)>tol:        
        s0=my_sqrt        
        my_sqrt=0.5*(my_sqrt+x/my_sqrt)    
    return my_sqrt

def relerr(x1,x2):    
    return abs((x2-x1)/x2)

def main():
    print("{:s}{:s}{:s}".format("x".center(20),"sqrt".center(10),"rel_error".rjust(14)))    
    N=5    
    for i in range(-N,N+1):        
        x=10.0**(-i)        
        print("{:14.3e}{:14.3e}{:15.7e}".format(x,sqrt(x),relerr(MySqrt(x),sqrt(x))))

if __name__==__main__:
    main()
```

<details>
<summary>Exercise 22</summary>
<pre>
Type in the example.  Save it into a file called `rooter.py`.  Type in and save a file `testmain.py`
<p>
<code>
import rooter
sqrtrt=rooter.MySqrt(11.0)
print(sqrtrt)
</code>
</p>
<p>
First run rooter.py as a standalone script, then run testmain.py.  What's the difference?
</p>
</pre>
</p>
</details>

## Classes

 A __class__ is a generalized, programmer-defined data type that can contain multiple variables under one name, as well as functions that work on the data represented by those variables.  The data and functions are said to be _encapsulated_ in the class.  These programmer-defined types are the foundation of _object-oriented programming_.  Python is an object-oriented language even though most programmers mostly used classes written by others, so it is useful to understand the basics.  

### Objects and Classes

 An "object" is a concept; the class is its most common representation as code.  Strictly speaking, an object must contain both data (variables) and procedures (functions) and it must be possible to declare variables of its type.  Declaring a variable of a class is called _instantiation_ and each variable is called an _instance_ of the object/class.  This is a key difference between a class and module; as we have seen, a module also contains variables and functions, but no variables can be declared of its type.

 Variables and functions defined in a class are collectively called __members__ of the class.  The variables are usually called __attributes__ while the functions are called __methods__.  The methods describe the _interface_ to the class.  Attributes and methods are accessed through the instances of the class.  As long as the interface is not changed, we can make whatever changes to the class that may be required, and other code that uses the class will not be affected. 

 Classes may have two special methods called __constructors__ and __destructors__.  Constructors are called when a new instance is created and perform whatever setup work is needed.  If the language supports a destructor, it removes an instance and releases the memory it occupies.

## Classes in Python

 We have already been using classes in our Python program, since all data types (including the apparently "primitive" types) are actually classes. In Python syntax, an instance is separated from its methods by a period.  So when we invoke

```
L=[1,2,3,4]
```

we have invoked a constructor (in an unusual format) for the list class.  When we subsequently type

```
L.append(5)
```

we are calling the _append_ method on the _instance_ L of the _class_ list to add an element at the end of the list represented by `L`.

### Syntax

Classes are always defined in a module.  Frequently only the class is in the module, though this is not required.  The keyword is `class`.  The class body, including its docstring, is indented starting one level from the margin.  Classes without methods are possible in Python, but normally the class will at least contain a constructor.  Instances are defined with

```
new_inst=MyClass()
```

Calling the class by name in the form of a function automatically invokes the constructor.  If there is no constructor, this creates an empty instance.

As for modules, any variables defined outside of and above the methods are _global_ to the class. All methods can see them.

Example  

```
class MyClass:
    """This is my class"""
    i=12345
    #init is surrounded by double underscores
    def __init__(self,x,y):
        self.x=x
        self.y=y

    def reset(self,x,y):
        self.x=x
        self.y=y

    def addit(self,z):
        return MyClass.i+self.y-z
```

The first line defines the class name.  The next line is the docstring.  After that we define and initialize a variable that is global to the class.  The first method is the constructor.  The ultimate class constructor is always named \_\_init\_\_ (two underscores).  The first argument to init, and to all methods in Python, is the _instance variable_.  The next two arguments to the constructor are actually passed from the caller.  They are used to initialize the two attributes `x` and `y`.  Notice that `self.x` and `x` are completely different variables; similarly for `self.y` and `y`.

Next is a method that acts only upon the instance.  Note that it does _not_ return the instance.  Instance variables are never returned from a method of their own class.  Traditionally None is returned (explicitly or by default).  Finally, we have a function that performs a computation using a class attribute, and returns the result to the caller.  The global variable `i` is referenced with the class name, not with self, because it is a _class variable_ and not an attribute of an instance.

### Self

The first argument to all class methods _must_ be the instance variable, which is a placeholder for the instance on which the method was invoked.    This variable is always called `self`.  Unlike some other object-oriented languages such as C++, the instance variable must always be explicitly present in the argument list. It is not used when we invoke the method, but is understood.

```
thing=MyClass(x,y)
thing.reset(w,z)
```

### Constructor

The constructor \_\_\_init\_\_ is invoked when a new instance is declared.  It need not take any arguments from the caller at all, though it will always include `self` in its parameter list.  Any attributes to be declared should be set to some default value in the constructor.

<details>
<summary>Exercise 23</summary>
<pre>
Type in the example class.  Save it into a file called `mymodule.py`.  Run the file or cell.  In your interpreter window or a new cell, type
<p>
<code>
from mymodule import MyClass
mc=MyClass(12,14)
x=12
print(x,mc.x)
mc.reset(19,11)
print(x,mc.x)
a=mc.addit(13)
print(a)
</code>
</pre>
</details>

In the interpreter you can create new attributes dynamically; they will not, however, be preserved in your class module.

```
x=MyClass(11.,13.)
x.counter=1
print(x.counter,x.i,x.reset(12,15))
```

### Data Hiding

In stricter object-oriented languages, class data may be _public_ or _private_.  Public members are directly accessible from an instance.  Private attributes can only be accessed through methods.  Private methods can only be accessed by other methods.  This is to prevent outside code from changing the attributes, or the results of methods, without a "message" to the class instance being sent.  Python does not enforce this but does have a mechanism for "hiding" some members.

All symbols beginning, but not ending, in two underscores are not accessible through an instance.  They can only be utilized through a method.  Symbols beginning with a single underscore are understood to be part of the _implementation_ and not the interface.  Outside code must not rely on them and should rarely to never use them directly.

Example 

```
class MyClass:
    """This is my class"""
    _i=12345
    #init is surrounded by double underscores
    def __init__(self,x,y):
        self.x=x
        self.y=y

    def reset(self,x,y):
        self.x=x
        self.y=y

    def __redo(self)  #double underscore
        self.x=10.
        self.y=20.

    def addit(self,z):
        return MyClass.i+self.y-z
```

This makes a difference. 

```
ac=MyClass(19.,20.)
ac.addit(30.)
ac._i
ac.__redo()
```

The last line will result in an AttributeError: MyClass instance has no attribute '\_\_redo'.

However, it is not absolute

```
ac._MyClass__redo()   #impolite!
print(ac.x,ac.y)
```

### Accessors and Mutators

To handle "private" or even just "implementation" variables we use methods.  Accessors ("getters") get the value and return it.  Mutators ("setters") change the value.

```
class PrivateStuff:
      def __init__(self,x):
          self.__u=11.
          self.x=x
      def set_u(self,u):
          self.__u=u
      def get_u(self):
          return self.__u
secret=PrivateStuff(9.)
secret.get_u()
Out []: 11.
secret.set_u(12.)
secret.get_u()
Out []: 12.
```

### Class Methods

Class methods access the _class_ variables rather than the _instance_ variables.  This may seem obscure, but class methods are fairly widely used to create _alternate constructors_.  For example, suppose we wish to load values into an instance, but in some cases we want to read those from a file.  We are now faced with something of a chicken-or-egg situation; we need the constructor to create the instance, but if we don't already have the values we can't call the constructor.  We do not wish to write a function outside the class since we want to keep everything encapsulated.  A class method solves this problem.  

To mark a class method we use `@classmethod` ahead of the `def` statement.  Statements beginning with the `@` symbol are called __decorators__ and have other uses.

Here is a code snippet for our example:

```
class pData:
    def __init__(self,x,y,z,t)
        set_values

    @classmethod
    def fromfile(cls,filename)
        read_values_from_filename
        return cls(x,y,z,t)

aDataPoint=pData.fromfile(inputfile)
```

The alternate constructor must return the new instance in order to invoke the constructor.

## Pickling

Objects may have a more complicated state than the simple variables we have encountered so far.  Saving it correctly could be tedious and error-prone.  Python provides an operation called "pickling" that coverts the state of an instance into a linear stream of bytes that can be stored or read back.

```
import pickle
aclass=MyClass(11)
f=open("myresults.dat","w")
pickle.dump(aclass,f)
```

To restore, use 

```
aclass=pickle.load(f)
```

### Dill

The pickle module is built into Python but it is limited.  It cannot handle several built-in types.  The dill package overcomes these limitations.  For consistency it is even possible to import it as the pickle namespace.

```
import dill as pickle
```

Dill is not included in the base Anaconda must can be installed through _conda_, the Anaconda package manager.  To invoke conda from the Navigator, go to the Environments tab, change the "Installed" dropdown to "Not installed" and wait for the package list to be populated.  Find `dill`, select it (and any other packages you find you might need), then click the green Apply button.

![AnacondaPackageManager](/images/python/AnacondaPackageManager.png)

## NumPy and SciPy

NumPy is not part of the base Python packages.  It is included with Anaconda and can be easily added to other Python installations.  NumPy adds many features important or useful to scientific and numeric computing.  These include

* True multidimensional arrays
* Linear algebra functions
* Fast Fourer Transform (FFT) Functions
* Random number generators 
* Tools for integrating Fortran, C, and C++ libraries.

Essential documentation is at its home [site](https://docs.scipy.org/doc/numpy/index.html).  NumPy is very powerful and our introduction will barely touch on its most important features.

### Arrays

An __array__ is an ordered data structure that contains elements all of the same type. NumPy introduces a new Python data type called the __Ndarray__ (n-dimensional array).  Like all ordered structures in Python, each element is addressed by integer _indices_.  An array has one or more _dimensions_, which NumPy generally calls _axes_.  The _bounds_ are the lowest and highest indexes.  The _rank_ is the number of dimentions.  Arrays should be regarded as fixed size once they are set up. NumPy arrays are _mutable_, so elements may be changed in place.

```
import numpy 
A=numpy.array([1,0,0,0])
lenA=len(A)    #number of rows 
A.size         #number of elements 
A.shape        #tuple of dimensions 
```

Unlike most Python data types, arrays must be initialized before they can be addressed.  Several methods are available.

* Convert from list 
  * A=numpy.array([x,y,z])
* Size and initialize to all zeros.  The dimensions must be in a tuple.  There is no explicit maximum rank, but memory can be rapidly exhausted with large arrays.
  * A=numpy.zeros((10,10))
* Size and initialize to arbitrary contents of memory 
  * A=numpy.empty(100) 
* Size and initialize to ones 
  * A=numpy.ones((2,3,4))
* Identity matrix (NxN but only N is declared)
  * A=numpy.eye(100) 
* Initialize to all zeros, same shape as a pre-existing array 
  * B=numpy.zeros_like(A)

There are other functions that can be used to initialize but these are among the most common.

### Ndarray Types

Python is typed by _inference_, meaning that it uses context to determine type, so normally we do not declare a variable's type, but Ndarrays may and sometimes must be declared with a type.  NumPy supports more types than base Python, including single-precision floating-point (`float32`). Unless otherwise specified, the type will be taken from the type of the initial elements if any are present.  If they are not, the default is float (double precision) but it can be modified with the `dtype` keyword argument to the constructor.

```
import numpy as np
Z=np.zeros((3,4),dtype='complex')
M=np.array([True,True,False,False])
```

Be sure to note the differences between

```
A=np.zeros((10,10))
IM=np.zeros((10,10),dtype='int')
mask=np.zeros((10,10),dtype='bool')
```

We can explicitly declare multidimensional arrays as well.

```
C=np.array([[1,2,3], [4,5,6]], dtype=float)
print(C)
[[ 1.  2.  3.]
 [ 4.  5.  6.]]
```

 However, this is not very practical for large arrays.  If we can declare an array as a linear sequence of numbers, we can use the built-in function `arange`.  The syntax is similar to `range` but it can take arguments of any numerical type, and it returns an Ndarray.

```
V=np.arange(10,30,5)
print(V)
[10 15 20 25]
```

<details>
<summary>Exercise 24</summary>
<pre>
Use the zeros function for the following:
Initialize an array A1 of rank 1 with size 4 and type double.
Initialize an array IU of rank 1 with size 4 and type integer.
Initialze an array M1 of rank 1 with size 4 and type Boolean.
Print each of the arrays you just created.
Initialize a rank-3 array to arbitrary elements.
</p>
</pre>
</p>
</details>

### Array Elements and Slices

 Each element can be addressed by its index or indices.  As for other ordered sequences, numbering starts from zero.  Indices are enclosed in square brackets.  The dimensions are usually enclosed in a single set of square brackets.

```
A[i,j,k]
```

Negative indices count from the last element.

```
V[-1]   #last element
A[0,-2] #first in column 0, next to last in column 1.
```

Subarrays, or slices, are indicated by the colon-separated range operator we have seen several times now.   As usual for Python, the upper bound must be one greater than the intended upper bound, i.e. it is _non-inclusive_.  We can omit lower and upper bounds if they are the edges; `\[lb:\]` extends from `lb` to the last element, while `\[:ub\]` extends from the beginning to `ub-1`.  The entire axis is expressed as `\[:\]`.

```
import numpy
A=numpy.zeros((100,100))
B=A[0:11,:]
C=A[S1:E1,S2:E2]
D=A[:,1]  #second column
```

Pay close attention to negative indices, especially when they are part of a slice specification.

```
V=np.array([0,1,2,3,4])
u=np.arange(25).reshape(5,5)
V[-1]
 4
V[:-1] #note element versus slice
 [0,1,2,3]  
u[:-1,:]
 [[ 0  1  2  3  4]
 [ 5  6  7  8  9]
 [10 11 12 13 14]
 [15 16 17 18 19]]
```

### Axes

NumPy refers to dimensions as axes.  Many NumPy intrinsic functions take an optional axis argument.  

```
a=np.arange(12).reshape(3,4)
print(a.sum())
 66
print(a.sum(0))
 [12 15 18 21]
print(a.sum(1))
 [ 6 22 38]
```

 In sum and similar methods, such as prod, the axis argument is the one to be _summed out_.  In these examples, the first sum uses all elements, resulting in a single value.  In the second two examples, we reduce the rank by one and the shape of the result removes the summed axis.

### Array Attributes

 An Ndarray is a class with attributes that can be accessed.

```
A=np.random.random((10,10))
print(A.shape)
(10,10)
print(A.size)
100
print(A.ndim)
2
print(A.dtype)
dtype('float64')
```

### More Advanced Indexing

 An Ndarray can take as its index an integer or Boolean array.

```
A=np.array([-2.,3.,-8.,
             -11.,12.,12.,45.,19.])
I=np.array([2,4,5])
valid=A>0
print(A[I])
[-8.,12.,12.]
print(A[valid])
[  3.  12.  12.  45.  19.]
```

### Reading and Writing Files

NumPy includes several functions that can simplify reading and writing files.  For files with a simple spreadsheet-like structure, `loadtxt` works well.  The first argument can be either a file name or a file handle.

```
x,y=np.loadtxt(f, delimiter=',', usecols=(0, 2), unpack=True)
v=np.loadtxt(f,delimiter=',',usecols=(1,)) #usecols needs tuple
W=np.loadtxt(fin,skiprows=2)
```

If `unpack` is not specified, `loadtxt` returns the values into a rank-2 array; otherwise it returns the values into a tuple of rank-1 arrays.  Columns may optionally be selected with `usecols`.  Header rows can be ignored with `skiprows`.  Other options are available.

More generally the `genfromtxt` function can be applied.  The `loadtxt` function does not handle files with missing or irregular data, but `genfrom txt` can to an extent.

```
data = np.genfromtxt(infile, delimiter=';', comments='#', skip_footer=1)
```

For a simple data dump and restore we can use the `save` and `load` commands.  The counterpart to `loadtxt` is `savetxt` for saving a rank-1 or rank-2 array.

```
np.savetxt(outfile,A,delimiter=',')
```

The `save` function will dump an  array or pickled object in binary format to a .npy file.

```
np.save(A)
np.savez(A)  #compresses, saves as .npz
```

Its counterpart is `load`

```
A=np.load(f,A)
```

### Array Operations

NumPy provides many functions, including a large selection of mathematical functions, that accept array arguments as well as scalars.  They operate on the arrays _elementwise_.

```
T=numpy.ones(4)
Z=3.0*T+numpy.ones_like(T)
I=numpy.array([1,0,0,0])
A=math.pi*I
B=numpy.sin(A)
C=A/B  #remember: elementwise
```

### Frequently Used NumPy Functions

NumPy provides many built-in functions for array manipulation or mathematical/statistical calculations.

| Array Manipulation | Mathematical Operations    |
| ------------------ | -------------------------- |
| arange             | abs, cos, sin, tan         |
| array              | average, mean, median, std |
| all, any, where    | ceil, floor                |
| compress           | dot                        |
| copy               | sum, product               |
| ones, zeros, empty | min, max                   |
| fromfile, loadtxt  | argmin, argmax             |
| reduce             | nan, isnan                 |
| repeat, reshape    | inf, isinf                 |
| rollaxis, swapaxis | linspace                   |
| transpose          | lstsq                      |

This is just a sample; the full reference can be examined at the [manual](https://docs.scipy.org/doc/numpy/reference/routines.html).

### Ufuncs

Functions that accept both arrays and scalars are called __ufuncs__ for "universal functions".  You can write your own ufuncs easily.  The functions are subject to some restrictions:

* The function must not change its input parameters.  
* The function cannot print anything, or do any other form of IO
* The function cannot exit (stop the run)
* The function must return a single value (no tuples or other compound type)

Functions that adhere to these rules are said to be _pure_.  The prohibition on printing does complicate debugging somewhat.

Example:

```
import numpy as np 

def F2C(T):
    return 5.*(T-32.)/9.

TempsF=np.arange(0.,213.,2.)
TempsC=F2C(TempsF)
print(TempsC)
print(F2C(50.))
```

### Optimization

Python can be quite slow, as is the case for most interpreted languages. Loops are generally the slowest constructs.  NumPy array functions are highly optimized and often can eliminate loops.

Example: the built-in sum over an array or array slice can replace the corresponding loops, and is much faster.

```
s=0
for e in V:
    s+=s+e
```

Use instead

```
s=V.sum()
```

## SciPy

SciPy, the \_sci_entific \_py_thon library, builds on NumPy to provide a set of modules and packages that add functions for data analysis and numerical computations.  These include 

* special functions 
* optimizations 
* linear algebra 
* quadrature (numerical integration)
* interpolation
* signal processing
* basic statistics 

Its homepage at [www.scipy.org](www.scipy.org) has details and documentation.  The SciPy library is part of the "SciPy ecosystem" that also includes NumPy, Sympy, and Pandas.  We will not discuss Sympy but it is a well-developed computer algebra system (CAS) that is also incorporated into several other packages such as SageMath.

### Importing SciPy Packages

Importing from scipy alone brings only the base packages, which provide a fairly minimal set of tools.  Individual packages must be imported expliclty.

```
from scipy import linalg, optimize
```

For a loaded package, type `help(name)` to see a summary of available functions.

```
help(linalg)
```

The SciPy [reference guide](https://docs.scipy.org/doc/scipy/reference/) is an invaluable resource for SciPy usage.

Simple linalg example:

```
import numpy as np
from scipy import linalg
A = np.array([[1, 2], [3, 4]])
b = np.array([[5], [6]])
c=linalg.solve(A, b)
print(c)
```

## Matplotlib

Matplotlib is a Python package that can be used to produce high-quality plots similar to those of MATLAB<sup>TM</sup>.  Its homepage and documentation can be found at [matplotlib.org](https://matplotlib.org).  A full complement of plot types is available, including

* line plots
* scatter plots
* histograms
* bar charts 
* pie charts 
* contour plots

The Matplotlib [gallery](https://matplotlib.org/gallery.html) provides many examples, with downloadable source files.  Many of our examples are taken directly from this site.

Simple example:

```
import numpy as np
import matplotlib.pyplot as plt
x=np.linspace(-4.,4.,401)
y=1./(np.pi*(1.+x**2))
plt.plot(x,y)
plt.show()
```

This results in
![SimplePlot.png](/images/python/SimplePlot.png)

Let us write a more sophisticated example.  This is a scatter plot with points randomly placed according to a normal distribution.

```
import numpy as np
import matplotlib.pyplot as plt
fig = plt.figure()
ax = fig.add_subplot(111)
ax.plot(10*np.random.randn(100),10*np.random.randn\  	(100), 'o')
ax.set_title('Scatter Plot')
plt.show()
```

![ScatterPlot.png](/images/python/ScatterPlot.png)

We can place more sophisticated labeling or multiple plots on a graph with `subplot`

```
import numpy as np 
import matplotlib.pyplot as plt 
x1 = np.linspace(0.0, 5.0) 
x2 = np.linspace(0.0, 2.0) 
y1 = np.cos(2 * np.pi * x1) * np.exp(-x1) 
y2 = np.cos(2 * np.pi * x2) 
plt.subplot(2, 1, 1) 
plt.plot(x1, y1, 'yo-') 
plt.title('A tale of 2 subplots') 
plt.ylabel('Damped oscillation') 
plt.subplot(2, 1, 2) 
plt.plot(x2, y2, 'r.-') 
plt.xlabel('time (s)') 
plt.ylabel('Undamped') 
plt.show()
```

![Subplot.png](/images/python/Subplot.png)

Many other options are available for annotations, legends, and so forth.

More advanced plots are provided.  The following demonstrates streamlines for vector fields, such as fluid flows.

```
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec

w = 3
Y, X = np.mgrid[-w:w:100j, -w:w:100j]
U = -1 - X**2 + Y
V = 1 + X - Y**2
speed = np.sqrt(U**2 + V**2)

fig = plt.figure(figsize=(7, 9))
gs = gridspec.GridSpec(nrows=3, ncols=2, height_ratios=[1, 1, 2])

#  Varying density along a streamline
ax0 = fig.add_subplot(gs[0, 0])
ax0.streamplot(X, Y, U, V, density=[0.5, 1])
ax0.set_title('Varying Density')

# Varying color along a streamline
ax1 = fig.add_subplot(gs[0, 1])
strm = ax1.streamplot(X, Y, U, V, color=U, linewidth=2, cmap='autumn')
fig.colorbar(strm.lines)
ax1.set_title('Varying Color')

#  Varying line width along a streamline
ax2 = fig.add_subplot(gs[1, 0])
lw = 5*speed / speed.max()
ax2.streamplot(X, Y, U, V, density=0.6, color='k', linewidth=lw)
ax2.set_title('Varying Line Width')

# Controlling the starting points of the streamlines
seed_points = np.array([[-2, -1, 0, 1, 2, -1], [-2, -1,  0, 1, 2, 2]])

ax3 = fig.add_subplot(gs[1, 1])
strm = ax3.streamplot(X, Y, U, V, color=U, linewidth=2,
                     cmap='autumn', start_points=seed_points.T)
fig.colorbar(strm.lines)
ax3.set_title('Controlling Starting Points')

# Displaying the starting points with blue symbols.
ax3.plot(seed_points[0], seed_points[1], 'bo')
ax3.set(xlim=(-w, w), ylim=(-w, w))

# Create a mask
mask = np.zeros(U.shape, dtype=bool)
mask[40:60, 40:60] = True
U[:20, :20] = np.nan
U = np.ma.array(U, mask=mask)

ax4 = fig.add_subplot(gs[2:, :])
ax4.streamplot(X, Y, U, V, color='r')
ax4.set_title('Streamplot with Masking')

ax4.imshow(~mask, extent=(-w, w, -w, w), alpha=0.5,
          interpolation='nearest', cmap='gray', aspect='auto')
ax4.set_aspect('equal')

plt.tight_layout()
plt.show()
```

![Streamplotdemo.png](/images/python/Streamplotdemo.png)

Matplotlib can also make histograms, pie charts, and so forth.  These are commonly used with Pandas, and Pandas can access them directly, as we will see.

For higher-dimensional plots we can use `contour`, `contourf`, `surface`, and others.

Contour plot example:

```
import matplotlib
import numpy as np
import matplotlib.cm as cm
import matplotlib.pyplot as plt


delta = 0.025
x = np.arange(-3.0, 3.0, delta)
y = np.arange(-2.0, 2.0, delta)
X, Y = np.meshgrid(x, y)
Z1 = np.exp(-X**2 - Y**2)
Z2 = np.exp(-(X - 1)**2 - (Y - 1)**2)
Z = (Z1 - Z2) * 2
fig, ax = plt.subplots()
CS = ax.contourf(X, Y, Z)
ax.clabel(CS, inline=1, fontsize=10)
ax.set_title('Simplest default with labels')
```

Surface plots require the `mplot3d` package and some additional commands to set views and sometimes lighting.  

```
# This import registers the 3D projection, but is otherwise unused.
from mpl_toolkits.mplot3d import Axes3D  # noqa: F401 unused import

import matplotlib.pyplot as plt
from matplotlib import cm
from matplotlib.ticker import LinearLocator, FormatStrFormatter
import numpy as np


fig = plt.figure()
ax = fig.gca(projection='3d')

# Make data.
X = np.arange(-5, 5, 0.25)
Y = np.arange(-5, 5, 0.25)
X, Y = np.meshgrid(X, Y)
R = np.sqrt(X**2 + Y**2)
Z = np.sin(R)

# Plot the surface.
surf = ax.plot_surface(X, Y, Z, cmap=cm.coolwarm,
                       linewidth=0, antialiased=False)

# Customize the z axis.
ax.set_zlim(-1.01, 1.01)
ax.zaxis.set_major_locator(LinearLocator(10))
ax.zaxis.set_major_formatter(FormatStrFormatter('%.02f'))

# Add a color bar which maps values to colors.
fig.colorbar(surf, shrink=0.5, aspect=5)

plt.show()
```

Recent versions of Matplotlib can apply _style sheets_ to change the overall appearance of plots.  For example, NumPy has modified its default style, but the older one (shown in some of our illustrations) is available as "classic."  Matplotlib can also be styled to imitate the R package `ggplot`.  See the [gallery](https://matplotlib.org/gallery/style_sheets/style_sheets_reference.html#sphx-glr-gallery-style-sheets-style-sheets-reference-py)
for the possibilities.

<details>
<summary>Exercise 25</summary>
<p>
1. Type into your choice of Spyder's interpreter pane or a JupyterLab cell the example plotting codes we have seen so far.  These were all taken from the Matplotlib gallery.
</p>
<p>
2. In the contour plot example, change <code>contour</code> to <code>contourf</code> and observe the difference.
</p>
</pre>
</details>

## Seaborn

[Seaborn](https://seaborn.pydata.org/index.html) is a package built upon Matplotlib that is targeted to statistical graphics.  Seaborn can be used alone if its defaults are satisfactory, or plots can be enhanced with direct calls to Matplotlib functions.

### Updating Packages in Anaconda

Before working with seaborn, check that you have at least version 0.9 installed.  To update packages using the Anaconda Navigator, start Navigator, click Environments, change the dropdown from `Installed` to `Updateable`, then go through and select packages you wish to upgrade by clicking on the checkbox and selecting "Mark for update" from the dropdown.  The checkbox will change to an arrow.  When you select a package, a green `Apply` button and a red `Clear` button will appear at the lower right.  When you have marked all packages you wish to update, click the `Apply` button.  (It may take a while to complete.)

If you are updating many packages it may be better to do it through a command line.  From your computer's applications menu, start the Anaconda Prompt.   To upgrade a package type 

```
conda update package
```

You can also install packages with either the Navigator interface or with the conda command line.

```
conda install newpackage
```

Many more options are available.  Conda can also be used to create "sandboxes" called _conda environments_.  Conda's [user guide](https://conda.io/projects/conda/en/latest/user-guide/index.html) describes conda's capabilities.

![Conda.png](/images/python/Conda.png)

If you have a very large number of packages to update, however, it may be better to uninstall Anaconda and install a new version.

### Working with Seaborn

Seaborn 0.9 or later is needed for the "relationship" plot example below:

```
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
fmri = sns.load_dataset("fmri")
sns.relplot(x="timepoint", y="signal", col="region",
            hue="event", style="event",
            kind="line", data=fmri);
```

![SeabornDemo1.png](/images/python/SeabornDemo1.png)

Many other statistical plots are available including boxplots, violin plots, distribution plots, and so forth.  The next example is a heatmap.

```
import matplotlib.pyplot as plt
import seaborn as sns
sns.set()

# Load the example flights dataset and conver to long-form
flights_long = sns.load_dataset("flights")
flights = flights_long.pivot("month", "year", "passengers")

# Draw a heatmap with the numeric values in each cell
f, ax = plt.subplots(figsize=(9, 6))
sns.heatmap(flights, annot=True, fmt="d", linewidths=.5, ax=ax)
```

![SeabornDemo2.png](/images/python/SeabornDemo2.png)

The call to `sns.set()` imposes the default Seaborn theme to all Matplotlib plots as well as those using Seaborn.  Seaborn provides a number of methods to modify the appearance of its plots as well as Matplotlib plots created while the settings are in scope.  For many examples see their [tuturial](https://seaborn.pydata.org/tutorial/aesthetics.html#aesthetics-tutorial) on styling plots.

## Pandas

[Pandas](pandas.pydata.org) is a Python data analysis library.  It was developed to bring a portion of the statistical capabilities of R into Python.  Pandas accomplishes this by introducing the Series and Dataframe objects to represent data, and incorporating Matplotlib and many features of NumPy into these objects to simplify data representation, analysis, and plotting.  Pandas works with the [statsmodel](http://www.statsmodels.org/stable/index.html) and [scikit-learn](https://scikit-learn.org/stable/) packages for data modeling.  Pandas supports data alignment, missing data, pivoting, grouping, merging and joining of datasets, and many other features for data analysis.

### Series

The Series data structure consists of an index plus data.  It is similar to a dictionary with the differences that 

* the size is fixed
* requesting a non-existent index results in a Key Error (no dynamic creation)

Series objects are one-dimensional and can contain any type.  The indices are treated like row labels.

This simple example loads a Series with normally-distributed random numbers, then prints some of them, prints the basic statistics, and creates a line plot.

```
import numpy as np
import matplotlib.pyplot as plt 
import pandas as pd
randns=pd.Series(np.random.randn(1000))
randns.head()
randns.tail()
randns.describe()
randns.plot()
```

If using Spyder, be sure to print(rands.head()), etc.  

Series can be sliced

```
select=randns[1:41]
```

This slices both the index and the data.  To extract values with specific row numbers, use the `iloc` method (note the square brackets).

```
some_vals=randns[1:41]
one_val=randns.iloc[11]
other_vals=randns.iloc[3:9]
```

Series are conceptually like a single column of a spreadsheet, with any headers omitted.  Values are similar to a NumPy Ndarray and most NumPy methods can be applied to the Series data, provided they are defined on the data type.  Missing data, represented by `np.nan` by default, will be omitted.

However, if the values are needed as an actual Ndarray they must be converted.

```
vals=randns.to_numpy()
```

We can load a Series with a dictionary.

```
scores=pd.Series({'Cougars':11,'Bears':9,'Cubs':8,'Tigers':6})
```

We can still slice it

```
scores[1:3]
```

We can still use `iloc` to extract by row number.  We can also use `loc` to extract by the row name.

```
scores.loc['Cubs']
```

Remember to print if using Spyder, or to run in the interpreter pane.

### Dataframes

The most important data structure in Pandas is the _Dataframe_.  It can be conceptualized as a representation of a spreadsheet.  Dataframes are two-dimensional.  Each column has a name, which can be read from the headers of a spreadsheet, rows are numbered, and datatypes may be different in different columns.  Alternatively, a Dataframe may be regarded as a dictionary with values that can be lists, Ndarrays, dictionaries, or Series.

A grade book is a simple example.

| Name           | Year | Grade |
| -------------- | ---- | ----- |
| Jim Dandy      | 2    | 85.4  |
| Betty Boop     | 4    | 91.7  |
| Minnie Moocher | 1    | 73.2  |
| Joe Friday     | 2    | 82.3  |
| Teddy Salad    | 3    | 98.5  |

We can instantiate a Dataframe by passing its constructor a dictionary.

```
grade_book=pd.DataFrame({"Name":["Jim Dandy","Betty Boop","Minnie Moocher","Joe Friday","Teddy Salad"],
	"Year":[2,4,1,2,3],"Grade":[85.4,91.7,73.2,82.3,98.5]})
```

Now we can apply methods to the `grade_book`.

```
grade_book.describe()
```

We can access individual columns by name.  If the name of the column is a valid Python variable name then we may use it as an attribute; otherwise we must refer to it as we would to a dictionary key.

```
grade_book.Name 
grade_book['Name']
grade_book.Grade.mean()
```

Columns can be deleted

```
grade_book.drop(columns='Year')
```

A new column can be appended (the number of rows must be the same)

```
grade_book["Letter Grade"]=["B","A","C","B","A"]
```

Extract values into an Ndarray 

```
grades=grade_book["Grade"].values 
```

We can directly apply basic Matplotlib commands to Dataframe columns  

```
grade_book.Grade.hist()
grade_book.Grade.plot()
```

### Reading Files

Pandas easily reads files in CSV (comma separated values) format.  The separator does not have to be a comma, but anything else must be specified through the `sep` keyword argument.

Suppose we have a file `weather.txt` containing weather data over a year for one site.  It is in comma-separated form with exactly one line of column headers.

```
wdata=pd.read_csv('weather.txt')
```

The `read_csv` function stores the column headers as the column names and the rest of the data as the columns in a dataframe object.  To see the data we would type 

```
wdata 
```

### Filtering and grouping

Pandas offers a number of ways to reorganize, group, and extract data.  Conditionals are accepted much as for NumPy arrays 

```
freezing_days=wdata[data.max_temp<=0.]
```

Conditionals may be compounded

```
cold_days=wdata[(data.max_temp<=0.) & (data.max_temp>-10.)]
```

Groups can be created with `groupby`

```
temps={}
for cover, cover_data in wdata.groupby("cloud_cover"):
    temps[cover]=cover_data.mean_temp.mean()
```

We can extract values corresponding to a quantity.  For our grade-book example, we can create a new dataframe for the students who received an "A"

```
grade_book["Letter Grade"]=["B","A","C","B","A"]
top_students=grade_book[grade_book["Letter Grade"]=="A"]
top_students
```

We can create _pivot tables_ to reorganize the data.  Continuing with the grade book, we can make the names into the index and organize by grades.
(For this example the result will have quite a bit of missing data, but a more complete grade book could have more scores.)

```
student_grades=grade_book.pivot(index="Name",columns="Letter Grade",values="Grade")
student_grades
```

### Missing Data

Pandas can easily handle missing data.  Conventionally, we use the IEEE Not A Number (nan) indicator for missing data, since it is easy to check for its presence.  We can also use None; Pandas treats None and NAN as essentially the same thing.  So to check for missing data in our `student_grades` dataframe we can use `isnull()` and `notnull()`, both of which are Boolean functions so will return True or False.

```
student_grades.notnull()
```

We can fill missing values with a quantity.

```
new_grades=student_grades.fillna(0.)
```

Many other options exist.  

### Summary and Exercise

Download the file [pandas_demo.ipynb](/data/pandas_demo.ipynb) and the data files [eighthr.data](/data/eighthr.data) and [eightr.names](/data/eighthr.names). If you are using Windows, check that it does not append ".txt" to the data files.  You may need to open File Explorer, go to View, and check "File name extensions."  Open the notebook in JupyterLab or Jupyter.  Go through the exercises in each cell.

## Conclusion

This concludes our overview of programming in Python.  The high popularity of Python has ensured that many online resources are available at all skill levels, from beginners to advanced programmers.  One sample listing is at [Fullstack Python](https://www.fullstackpython.com/best-python-resources.html).  Many online resources emphasize Web programming, but some compilations more specific to sciences and data analytics include [Python for Social Sciences](https://realpython.com/python-for-social-scientists/),[Towards Data Science](https://towardsdatascience.com/a-beginners-guide-to-python-for-data-science-60ef022b7b67), [Python Programming for the Humanities](http://www.karsdorp.io/python-course/) [Python for Scientists and Engineers](https://www.pythonforengineers.com/python-for-scientists-and-engineers/) (this is a free online book), and others. A very good list, if you can get past the 1990's look of the site, is [Python for Scientific Computing](https://indranilsinharoy.com/2013/01/06/python-for-scientific-computing-a-collection-of-resources/).  Note that you may see references to `continuum.io`; this was the original name of the company that now goes by the name of their product, Anaconda.

Happy programming!
