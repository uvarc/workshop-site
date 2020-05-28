---
title: "6. Functions, Modules and Classes"
author: "Karsten Siller"
date: 2020-05-15
categories: ["Summer Education Series: Programming in Python"]
toc: true
---

# Functions

Functions are self-contained units of code.  They enable us to isolate chunks of code into small packages.

Functions break down the programming into a series of well-defined tasks.  This makes code easier to read, debug, and maintain.  Functions also reduce "cut and paste" errors.  If a section of code does something more than once, it should be replaced with a function.

## Arguments

Like mathematical functions, programming functions (usually) take _arguments_.  In computer-science language the variable that represents an argument in the function definition is often called a _parameter_ or a _dummy variable_.  

* Functions must be _called_ by name or they do nothing.  Their code is static until it is invoked by a _caller_.  The interpreter must have encountered the function definition before it can be called; interpreters cannot move upward in a file.  
* In strict usage the sequence of variables may be called the _argument list_ in the caller and the _parameter list_ in the function definition; however, these terms tend to be used interchangeably.  Arguments are said to be _passed_ from the caller to the function.  
* The function _returns_ a value, which replaces the function's name after it has been executed.  In Python functions must always return a value; if the programmer does not specify one, Python returns the special value `None`.  A function may return exactly one item, but that quantity may be a compound data structure such as a list or tuple, so it is possible to return multiple values from a function.

Best practice is to place all the functions you will use at the top of the file, right after the main docstring.  Functions may have a docstring themselves.  This is particularly important if the function is lengthy or complicated.

## Python Syntax

* The beginning of a function is specified with the keyword `def` (define) followed by the name of the function.  The function name _must_ be followed by parentheses whether any arguments are passed or not.  
* The `def` keyword begins a code block, so a colon is required.  All statements in the body of the function must be indented.  
* The docstring must immediately follow the `def` line and be indented one level.  Recall that docstrings are enclosed in triple double quotes (`"""My documentation"""`).  Values are returned with the `return` statement.  The `return` causes an immediate exit from the function; no further statements will be executed.

<a name="func_example"></a>
**Examples**
```
def sum_vals(x,y,z):
    """Computes the sum of its input values"""
    return x+y+z

def make_list(x,y,z):
   """Makes a new list"""
    new_list = [x,y,z]
    return new_list

def sum_diff(x,y):
    """Returns the sum and difference of two values"""
    return x+y,x-y
```

Notice the use of tuple packing in the third example.  An equally valid, but not commonly used, last line could be `return (x+y,x-y)`.

## Dummy Parameters

The names of the variables in a function's parameter list are called dummies because they are placeholders.  The function can be called with any variable names in the caller.

```
xx = 1.
yy = 2.
zz = 3.
sum_vals(xx,yy,zz)
sum_vals(zz,xx,yy)
sum_diff(xx,yy,zz)
sum_diff(zz,xx,yy)
make_list(xx,zz,yy)
make_list(yy,xx,zz)
```

The arguments in the lists in both caller and callee must agree in _number_ and in _type_.  There is a one-to-one correspondence between positional arguments in the caller and the callee so there must be exactly one in the caller for each in the callee.  In Python there is more freedom in the types but whatever happens to the variable in the function must make sense for the type that is passed to it.  For example, the `+` operator in `sum_vals` is defined for integers, floats, and strings (as well as for some other types) so it is valid to pass those types to the function, but they cannot be mixed.  An illegal operation on the type actually passed will cause the interpreter to stop with an _exception_.  

## Optional and Keyword Arguments

Arguments whose values are determined from their ordering in the parameter list are called _positional_ variables.  Python supports _optional_ and _keyword_ arguments as well.  Optional arguments are assigned a default value in the parameter list of the function definition.  If an optional argument is not present in the argument list passed by the caller, it takes on its default value; otherwise it is positional.

```
def func(x,y=0,w=3):
    return x+y-w
```

We can call this function with

```
c = func(x)
c = func(x,yy)
c = func(x,yy,zz)
```

In this example the optional arguments are passed by position as usual.  Optional arguments may also be passed by _keyword_, not position.  Any optional/keyword arguments must __follow__ any and all positional arguments in the list; except for that restriction their order does not matter and some may be omitted.

```
z = func(x,w=6,y=2)
val = func(x,w=9)
```

Default values are set only _once_, when the function is first encountered by the interpreter.  Only immutable types should be used as default values.

## Early Returns

The `return` statement exits immediately with no more statements being executed.  A function may contain multiple return statements, but only the first encountered will be executed.  In conjunction with conditionals, the function can thus return early.

```
def sum_vals(x,y,z):
    """A stupid function."""
    if (x==0 and y==0 and z==0):
        return -1
    return x+y+z
```

In this example, an `else` clause is not required because there is no subsequent use of the results.  Also note that the conditional as it as written affects the types that will be valid within the function.

## Variable Passing

Python passes variables in a manner called _assignment_. This means that if an argument is mutable and it is changed in the function, it __will change__ in the caller.  If it is _immutable_ it will not be changed even if the function changes its value; a local copy will be made within the function block.  If a function changes one of its parameters that is called a __side effect__.


## Variable Scope

The __scope__ of a variable is the range over which it has a defined value.  In Python, the scope is the code block in which the variable is first referenced.  Therefore a calling program may have a variable `x`, a function may also have a variable `x`, and if `x` is not an argument to the function then it will be distinct in the two units.  Variables defined above a `def` are global to the functions below it in the same file; that is, they are _in scope_ in the entire file.

When working in the interpreter (including running codes through Spyder repeatedly in the same kernal), the interpreter stores all variables with global scope into a workspace.  It may be desirable to reset these variables for new runs.  In an iPython console you can type

```
%reset 
```

to clear the workspace.   

## Modules

Modules are fundamental to the programming model of Python.  Modules are programming units that (should) consist of _related_ variables and functions that form a coherent block of _data_+_procedures_ (functions).  They are an extension of the concept of packaging code that we have already studied with functions.

In Python every file you write is a module.  The name of themodule is the file name without the exension.  Every Python file must end in `.py` regardless of your operating system, so if you write a file `mycode.py` the corresponding module is `mycode`.  If you are using Jupyter you will need to export your code into a script in order to create a new module (Notebook tab -> Export to -> Executable Script).

Modules that are not run as the main program must be _imported_ for its contents to be accessible.  When a module is imported, it is compiled to a special representation called __bytecode__.  A new file of the same base name with the suffix `.pyc` will be created.  

Many modules and packages (collections of modules) are available through a base Python installation.  Anaconda provides dozens more, with others available for installation through the Environments tab of the Navigator.  We have already seen a handful of these built-in modules.  


### Packages in PyPI and Conda

The process for installing and updating your Python packages provided by Anaconda is described [here](/lesson/ses-python-intro/welcome#updating-packages-in-anaconda).  Once a package is installed, either from official repository or as local module, you are ready to import it in your scripts.


```
import math 
import matplotlib.pyplot
```

### Importing Modules

When we import a module we bring in its __namespace__.  A namespace is an environment that holds a group of identifiers, such as variable and function names.  In Python the namespaces take the name of the module in which they are defined.  Namespaces can be renamed when the module is imported, but __not__ afterward.

With a simple import statement we must refer to the module's components with its native namespace.

```
import math 
import os 
import numpy 

z = math.sqrt(x)
home_dir = os.getenv("HOME")
A = numpy.zeros(200)
```

We can select only certain components with `from`, for example:

```
from modulename import func1, func2
```

Now only `func1` and `func2` can be used, and we do _not_ precede their names with the native namespace when calling them.

```
z = func1(x,y)
w = a+b*func2(z)
```

To import __all__ symbols without a prefix use

```
from modulename import *
```

This statement imports all names that do not begin with a single underscore (\_) and makes them accessible without being preceded by the module name.

We can also rename individual symbols

```
from math import sqrt as squareroot
w = squareroot(10.)
```

One of the most commonly used versions of import changes the name of the namespace, typically to something simpler.

```
imoprt numpy as np
import pandas as pd

z = np.zeros(200)
data = pd.read_csv("my_data"file)
```

### Main Modules

When you run a script directly through the interpreter, such as by using the Run arrow in Spyder, it is in the "main" namespace.  Your module can also be imported into the interpreter or into another module.  It will still execute everything in the module, including requests for input and the like, unless you create a conditional branch `if __name__== '__main__':` and place all code you want to execute only when run directly after this conditional.  


{{< callout >}}

<b>Remember:</b> Every module in Python has a special attribute called <code>__name__</code>. The value of <code>__name__</code>  attribute is set to <code>'__main__'</code>  when module run as main program. Otherwise, the value of <code>__name__</code>  is set to contain the name of the module.

{{< /callout >}}

```
if __name__== '__main__':
    do_work
```

It is customary to include code for the main namespace into a function named `main()`.  

```
def main():
    do_work

if __name__ == '__main__':
    main()
```

**Example**:

```
from math import sqrt

def MySqrt(x):    
    """Babylonian method to calculate sqrt."""    
    my_sqrt = x/2.    
    tol = 1.e-12
    s0 = 0    
    while abs(my_sqrt-s0)>tol:        
        s0 = my_sqrt        
        my_sqrt = 0.5*(my_sqrt+x/my_sqrt)    
    return my_sqrt

def main():
    N = 10  
    for x in range(1,N+1):        
        print(f"x={x:.3e}, sqrt(x)={sqrt(x):.3e}, MySqrt(x)={MySqrt(x):.7e}")

if __name__ == '__main__':
    main()
```

---

# Advanced Topics

## Functional Programming

Functional programming is a paradigm in which all aspects of the program are expressed as functions, there are no mutable variables, and there are no side effects.  In true functional programming languages such as Haskell, a function is a _first class data structure_.  It can be a _l-value_, which means that the function can appear on the left-hand side of an assignment like a variable in "imperative" langauges.  Functions in this style can also take functions as their arguments.  Python is not a functional language but has some constructs that provide a few of the features of such languages.

Functional programming makes use of "anonymous" or _lambda_ functions.  In Python we can use a __lambda expression__ to evaluate a function without giving it an explicit definition.  Lambdas must be expressible as a single expression; no statements are allowed.  A tuple of the variable names follows the `lambda` keyword, then a colon, and finally the expression of the variables.

```
fsquared = lambda x:x**2
fsquared(4)
import math
fhypot = lambda x,y:math.sqrt(x**2+y**2)
fhypot(3,7)
```

One of the most common applications of lambda expressions is to the built-in functions map and filter, with reduce built in to Python 2.7 and available through functools in Python 3.

* `map` 
  * first argument is a function, second argument is a sequence
  * applies the function to each element of the sequence and returns a new list (Python 2.7) or iterator (Python 3)
  * L1=map(square,S)          #Python 2.7
  * L1=list(map(square,S))    #Python 3
* `reduce` 
  * first argument must be a function that takes two inputs and returns a single input of the same type
  * total=reduce(sum,s)   #Python 2.7
  * import functools; total=functools.reduce(sum,s) #Python 3
* `filter`
  * first argument is a function that returns True or False.  
  * applies the function to each element of the sequence and returns a new sequence (Python 2.7) or iterator (Python 3)
  * L2=filter(func,s)  #Python 2.7
  * L2=list(filter(func,s)) #Python 3

Examples with lambda expressions (Python 3):
```
import functools
V = [-1,0,1,2,3,4,5]
L = list(map(lambda x:x**2, V))
R = functools.reduce(lambda x,y:x+y, V)
F = list(filter(lambda x:x>0, V))
```

## List Comprehensions

A list comprehension collapses a loop over a list and, optionally, an if clause.  It can replace at least some functionals like `map` and `filter` if the desired result is a list.

```
squares = [x**2 for x in range(10)]
```

This is equivalent to

```
for x in range(10):
    squares.append(x**2)
```

With an option conditional it becomes

```
positives = [math.sqrt(x) for x in range(-10,11) if x>0]
```

This is equivalent to

```
for x in range(-10,11):
    if x>0:
        positives.append(math.sqrt(x))
```

List comprehensions are nearly always __much__ faster than the equivalent loop.

## Classes

 A __class__ is a generalized, programmer-defined data type that can contain multiple variables under one name, as well as functions that work on the data represented by those variables.  The data and functions are said to be _encapsulated_ in the class.  These programmer-defined types are the foundation of _object-oriented programming_.  Python is an object-oriented language even though most programmers mostly used classes written by others, so it is useful to understand the basics.  

 An "object" is a concept; the class is its most common representation as code.  Strictly speaking, an object must contain both data (variables) and procedures (functions) and it must be possible to declare variables of its type.  Declaring a variable of a class is called _instantiation_ and each variable is called an _instance_ of the object/class.  This is a key difference between a class and module; as we have seen, a module also contains variables and functions, but no variables can be declared of its type.

 Variables and functions defined in a class are collectively called __members__ of the class.  The variables are usually called __attributes__ while the functions are called __methods__.  The methods describe the _interface_ to the class.  Attributes and methods are accessed through the instances of the class.  As long as the interface is not changed, we can make whatever changes to the class that may be required, and other code that uses the class will not be affected. 

 Classes may have two special methods called __constructors__ and __destructors__.  Constructors are called when a new instance is created and perform whatever setup work is needed.  If the language supports a destructor, it removes an instance and releases the memory it occupies.


 We have already been using classes in our Python program, since all data types (including the apparently "primitive" types) are actually classes. In Python syntax, an instance is separated from its methods by a period.  So when we invoke

```
L = [1,2,3,4]
```

we have invoked a constructor (in an unusual format) for the list class.  When we subsequently type

```
L.append(5)
```

we are calling the _append_ method on the _instance_ L of the _class_ list to add an element at the end of the list represented by `L`.

### Syntax

Classes are always defined in a module.  Frequently only the class is in the module, though this is not required.  The keyword is `class`.  The class body, including its docstring, is indented starting one level from the margin.  Classes without methods are possible in Python, but normally the class will at least contain a constructor.  Instances are defined with

```
new_inst = MyClass()
```

Calling the class by name in the form of a function automatically invokes the constructor.  If there is no constructor, this creates an empty instance.

As for modules, any variables defined outside of and above the methods are _global_ to the class. All methods can see them.

Example  

```
class MyClass:
    """This is my class"""
    i = 12345
    # init is surrounded by double underscores
    def __init__(self,x,y):
        self.x = x
        self.y = y

    def reset(self,x,y):
        self.x = x
        self.y = y

    def addit(self,z):
        return MyClass.i+self.y-z
```

The first line defines the class name.  The next line is the docstring.  After that we define and initialize a variable that is global to the class.  The first method is the constructor.  The ultimate class constructor is always named \_\_init\_\_ (two underscores).  The first argument to init, and to all methods in Python, is the _instance variable_.  The next two arguments to the constructor are actually passed from the caller.  They are used to initialize the two attributes `x` and `y`.  Notice that `self.x` and `x` are completely different variables; similarly for `self.y` and `y`.

Next is a method that acts only upon the instance.  Note that it does _not_ return the instance.  Instance variables are never returned from a method of their own class.  Traditionally None is returned (explicitly or by default).  Finally, we have a function that performs a computation using a class attribute, and returns the result to the caller.  The global variable `i` is referenced with the class name, not with self, because it is a _class variable_ and not an attribute of an instance.

### Self

The first argument to all class methods _must_ be the instance variable, which is a placeholder for the instance on which the method was invoked.    This variable is always called `self`.  Unlike some other object-oriented languages such as C++, the instance variable must always be explicitly present in the argument list. It is not used when we invoke the method, but is understood.

```
thing = MyClass(x,y)
thing.reset(w,z)
```

### Constructor

The constructor \_\_\_init\_\_ is invoked when a new instance is declared.  It need not take any arguments from the caller at all, though it will always include `self` in its parameter list.  Any attributes to be declared should be set to some default value in the constructor.

In the interpreter you can create new attributes dynamically; they will not, however, be preserved in your class module.

```
x = MyClass(11.,13.)
x.counter = 1
print(x.counter,x.i,x.reset(12,15))
```

### Data Hiding

In stricter object-oriented languages, class data may be _public_ or _private_.  Public members are directly accessible from an instance.  Private attributes can only be accessed through methods.  Private methods can only be accessed by other methods.  This is to prevent outside code from changing the attributes, or the results of methods, without a "message" to the class instance being sent.  Python does not enforce this but does have a mechanism for "hiding" some members.

All symbols beginning, but not ending, in two underscores are not accessible through an instance.  They can only be utilized through a method.  Symbols beginning with a single underscore are understood to be part of the _implementation_ and not the interface.  Outside code must not rely on them and should rarely to never use them directly.

Example 

```
class MyClass:
    """This is my class"""
    _i = 12345
    # init is surrounded by double underscores
    def __init__(self,x,y):
        self.x = x
        self.y = y

    def reset(self,x,y):
        self.x = x
        self.y = y

    def __redo(self)  #double underscore
        self.x = 10.
        self.y = 20.

    def addit(self,z):
        return MyClass.i+self.y-z
```

This makes a difference. 

```
ac = MyClass(19.,20.)
ac.addit(30.)
ac._i
ac.__redo()
```

The last line will result in an AttributeError: MyClass instance has no attribute `__redo`.

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
          self.__u = 11.
          self.x = x

      def set_u(self,u):
          self.__u = u

      def get_u(self):
          return self.__u

secret = PrivateStuff(9.)
that_u = secret.get_u()
print(that_u)
```
**Output:**
```
11.0
```

Let's use the setter method and update a field:
```
secret.set_u(12.)
print(secret.get_u())
```
**Output:**
```
12.0
```

### Class Methods

Class methods access the _class_ variables rather than the _instance_ variables.  This may seem obscure, but class methods are fairly widely used to create _alternate constructors_.  For example, suppose we wish to load values into an instance, but in some cases we want to read those from a file.  We are now faced with something of a chicken-or-egg situation; we need the constructor to create the instance, but if we don't already have the values we can't call the constructor.  We do not wish to write a function outside the class since we want to keep everything encapsulated.  A class method solves this problem.  

To mark a class method we use `@classmethod` ahead of the `def` statement.  Statements beginning with the `@` symbol are called __decorators__ and have other uses.

Here is a code snippet for our example:

<pre>
class pData:

    def __init__(self,x,y,z,t)
        set_values

    @classmethod
    def fromfile(cls,filename)
        read_values_from_filename
        return cls(x,y,z,t)

aDataPoint = pData.fromfile(inputfile)
</pre>

The alternate constructor must return the new instance in order to invoke the constructor.

---
# Exercises
 
<details>
<summary>Exercise 13 - Example Functions</summary>
<p>
If you have not already done so, type in the three functions from the <a href="#func_example">first examples</a>.  Run the cell or script.  Then type into the interpeter
<pre>
sum_vals(1,2,3)
sum_vals(1.2,3.4,4.5)
sum_vals("1","2","3")
make_list(1.,11.,3.)
make_list([1.,11.],3.,4.)
sum_diff(3,4)
s_3 = sum_vals(8,8,10)
s_3
</pre>
</details>

<details>
<summary>Exercise 14 - Another Function</summary>
<p>
Experiment with the following code (leave in or comment out x=100)
<p>
<pre>
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
</pre>
</p>
</details>

<details>
<summary>Exercise 15 - Main block</summary>
Type in the example.  Save it into a file called `rooter.py`.  Type in and save a file `testmain.py`
<pre>
import rooter
sqrtrt = rooter.MySqrt(11.0)
print(sqrtrt)
</pre>
First run rooter.py as a standalone script, then run testmain.py.  What's the difference?
</p>
</details>

**Advanced:**

<details>
<summary>Exercise 16 - List Comprehension</summary>
<p>
Assuming Python 3
<pre>
import functools
z = lambda x,y:x\*\*2-y
z(4,5)
vals=[1,2,3,4,5]
squares=list(map(lambda x:x**2,vals))
squares
sumsq=functools.reduce(lambda x,y:x\*\*2+y\*\*2,vals)
sumsq
small=list(filter(lambda x:x<20,squares))
</pre>
Write an equivalent list comprehension for the map and filter statements.
</p>
</details>

<details>
<summary>Exercise 17 - Class and Module</summary>
Type in the example class.  Save it into a file called `mymodule.py`.  Run the file or cell.  In your interpreter window or a new cell, type
<pre>
from mymodule import MyClass
mc=MyClass(12,14)
x=12
print(x,mc.x)
mc.reset(19,11)
print(x,mc.x)
a=mc.addit(13)
print(a)
</pre>
</details>


---

{{< series-buttons overview="/categories/summer-education-series-programming-in-python/" prev="/lesson/ses-python-intro/io/" next="/lesson/ses-python-intro/numpy-scipy/" >}}
