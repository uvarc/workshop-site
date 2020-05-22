---
title: "5. Input/Output and Exception Handling"
author: "Karsten Siller"
date: 2020-05-16
categories: ["Summer Education Series: Programming in Python"]
toc: true
---

# Input/Output

Programs are not very useful if they cannot communicate their results.  They are also not terribly useful if they cannot change their controlling parameters to compute different results.

It is best to make your program read its input parameters, rather than embedding them (hard-coding) them into the program body.  You may want to change the parameters later or run it for many different sets of parameters.  You may give your program to somebody else who will have to modify it.  Always assume your program may later be used for a slightly different purpose, whether by someone else or by you.

## Console Input

The console is a text interface for input to and output from the computer.  In Spyder, the iPython window itself can serve as a console.  In Jupyterlab the output console is indicated by lines marked with `Out []` whereas a reference to an input console will open a textbox. 

To read input from the console we use the `input()` function (Python 3+).  In Python 2.7 the equivalent is `raw_input()`.  Any string within the parentheses is optional and, if present, if will be printed to prompt the user.  The input from the user is captured as a string and returned; it must be stored for any subsequent use.

{{< callout >}}
The <code>input</code> (<code>raw_input</code>) function <b>always</b> returns a string.  If you need to use the values as any other type, you must perform the conversion yourself.
{{< /callout >}}

**Example:**
```
weight = input("Enter your weight in pounds:")
print(type(weight))
weight = float(input("Enter your weight in pounds:"))
print(type(weight))
```

Output:
```
```
## Console Output

We have already been using the `print` function.  Let us now examine it in more detail.

The `print` function

* always inserts a space between its arguments
* always adds a newline character unless the optional `end` argument is added.
```  
print(var,end="")
```

Messages can be added in between variables.

```
h=1.45;
w=62.
print("Your BMI is",w/ht**2)
```

### Formatted Output

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

### Formatting with f-Strings

For Python 3.6 and up the _formatted string literal_ or f-string was introduced.  These can be used to create formatted output easily.

**Example:**
```
import math
n = 12
print(f"Pi to {n} places is {math.pi:.{n}f}")
```
The first line imports the `math` package which we use here to get access to the Pi constant `math.pi`.  You will learn more about imports in the [Function, Modules, and Classes](/lesson/ses-python-intro/functions/) section. 

The third line defines an f-string which evaluates the contents of the curly braces when the program is run.  That means that expressions can be used inside the curly braces.

**Output:**
```
Pi to 12 places is 3.141592653590
```

Let's change the number of decimal place to display:
```
print(f"Pi to {n//3} places is {math.pi:.{n//3}f}")
```
**Output:**
```
Pi to 4 places is 3.1416
```
In this example, the integer division (`//`) is required because the result of the expression must be an integer.

If quotation marks are needed inside an f-string (such as for a dictionary key) they must be single quotes.  In addition, the backslash () cannot be a character within an f-string, so if a character such as the newline (\\n) is needed, it must be assigned to a variable.

---

# File IO

Most of the time we read or write from a file rather than from the console.  File input/output can be complicated in Python and we will later see some built-in means of reading particular types of files, particularly comma-separated-values (CSV) text files.

Before anything can be done with a file we must _open_ it.  This attaches the file name to the program through some form of _file descriptor_, which is like an identifier for the file.  Once opened we do not refer to the file by its name anymore, but only via the identifier.

## Opening a File

We open a file and associate an identifier with it by means of the `open` statement.

```
fp = open("filename")
fin = open("filename","r")
fout = open("filename","w")
```

The default is read-only.  Adding the `r` makes this explicit.  To open for writing only, add the `w`.  This overwrites the file if it already exists.  To append to an existing file, use `a` in place of `w`.  Both `w` and `a` will create the file if it does not exist.  To open for both reading and writing, use `r+`; in this case the file must exist.  To open it for reading and writing even if it does not exist, use `w+`.

## Reading from a File

The standard read commands in Python read _only strings_.  Even if the input values are intended to be numbers, they are read in as strings.  Any conversions must be done by the programmer.

Reading commands

* `f.read()`: Reads the entire file identified by `f` into one large string
* `f.readline()`: Reads a single line (including the newline character) from the file `f`
* `f.readlines()`: Reads all the lines into a list, one line per list element.  Newlines are included.

We have several options to handle the strings when reading directly from a file.  One option is to use read, then split all the lines on the "\\n" character

```
fin = open("filename","r")
the_file = fin.read()
file_list = the_file.split("\r\n")
```

We can now process through the list using a loop.  Note that we use `\r\n` to make sure we accommodate Windows, Mac OSX, and Linux operating systems.  

Yet another option is to use a Python idiom in which we iterate through the file using the file identifier.  Suppose we have a file with comma-separated values.  We can read the data with

```
fin = open("filename")
for line in fin:
    data = line.rstrip("\r\n").split(",")
```

In the example above, we have not done anything to store the values of the data, so each time through the `data` variable will be overwritten and the previous values lost.  How we handle this will depend on the file and what should be done to its contents.  One common approach is to declare lists to hold the values in advance, then append as we go.

```
fin = open("filename")
x=[]
y=[]
fin.readline()
for line in fin:
    data = line.rstrip("\r\n").split(",")
    x.append(float(data[0]))
    y.append(float(data[2]))
```

When we have completed this loop x will contain the values from the first column and y will contain values from the third column.  In this example we are not interested in the other columns.  We also convert on the fly to float.  This example assumes that our data file has one line of text header, which we use `readline` to skip.

We will not go into much detail about reading files since we will later cover packages that offer more convenient ways to read the most common formats.  

## Writing Files

To write a file it must have been opened appropriately.  We can use print with the addition of a `file=` argument.

```
f = open("myfile")
print("Format string {:f} {:f}".format(x,y),file=f)
```

Corresponding to `read` there is a `write`.  It writes _one_ string to the specified file 

```
fout = open("outfile","w")
fout.write(s)
```

The string can contain newline markers `\n` but `write` will not insert them.  They must be positioned explicitly.

Corresponding to `readlines` there is a `writelines` method:

```
fout = open("outfile","w")
fout.writelines(seq)
```

Here `seq` is a sequence, usually a list of strings.  

{{< callout >}}
The <code>writelines</code> will not add any end-of-line markers so as with write, they must be appended to every string in the sequence where a linebreak is desired.
{{< /callout >}}

## Closing Files

When you have completed all operations on a file you should close it.

```
fin.close()
fout.close()
```

Files will be automatically closed when your script terminates, but best practice is to close them all yourself as soon as you are done with it.  You _must_ close a file if you intend to open it later in a different mode.  You cannot reopen a file using an active file descriptor.  You must first close it.


---

# Exceptions

Many situations can result in an error.  

* An attempt to read a file that isn't present. 
* An attempt to cast a string to a number when the string does not represent a number. 
* An index out of bounds. 
* A key requested that is not in the dictionary.

All these conditions (and many more) are called __exceptions__.  If you do not handle them, the interpreter will, and it will just stop the program with some error message.  We can prepare for failure by _catching_ exceptions ourselves.

## Catching Exceptions

The interpreter _throws_ an exception so we can _catch_ it.  We can do this with a `try except` block.  

```
try:
    fin=open("datafile.csv","r")
except IOError:
    print("Unable to open file.")
```

{{< callout >}}
Note the colon <code>:</code> characters at the end of lines 1 and 3 followed by line indentations that define new code blocks. Note that the <code>try</code> and <code>except</code> statements have the same indentation level.
{{</ callout >}}

The example above stops on the named exception `IOError` which catches any errors with the file input/output operations.  Any other exception will not be caught.  It is not necessary to name exceptions; the following will be executed for any exception.

```
try: 
    something
except: 
    print("Error")
```

More processing is usually required, of course.

The interpreter provides a large number of built-in exceptions.  Some of the more commonly encountered are:

* EOFError
* IOError
* KeyboardInterrupt
* IndexError
* IKeyError
* NameError
* NotImplementedError
* TypeError
* ValueError
* ZeroDivisionError

Review the official documentation for a [complete list of exception types](https://docs.python.org/3.7/tutorial/errors.html).
  
You can provide more than one `except` for the same `try`

```
try:
   input = int(input("Please enter an integer:"))
except EOFError:
  print("You did not enter anything")
except ValueError:
  print("You did not enter an integer")
```

If you wish to do something particular when the `try` passes, use `else`

```
try:
    fout = open("outputfile.csv","w")
except IOError:
    print("Unable to open file")
else:
    print("File successfully opened")
```

If you have code that should be executed whether the condition passes or failes use `finally`

```
try:
   fin = datafile.read()
except IOError:
   print("Unable to read ",datafile)
finally:
   fin.close()
```

You cannot use an `else` in any `try` clause with a `finally`.

## With/As

If properly supported, the `with` and `as` operators can replace the `try/except/finally` block.  This is probably most widely used with files.  The following will close the file whether the operation was successful or not.

```
with open('myfile','w') as f:
    for n in range(len(mylines)):
        mystring="whatever"
        f.write(mystring+'\n')
```

---

# Exercises

<details>
<summary>Exercise 12 - Console IO</summary>
<p>
Use Spyder to write a <em>complete</em> program to compute BMI from weight and height input from a user.  First request the user's choice of units.  We have not spent much time with strings yet so you may use a digit to indicate the user's choice. Then request weight and height.  Remember that you will need to convert from strings.  Compute the BMI using the appropriate units and print the result to the console.   
</p>
</details>

<details>
<summary>Exercise 13 - File IO</summary>
<p>
1. Open a file <code>data.txt</code> in write mode.  Write to the file three columns of numbers separated by commas.  These columns should be <code>n</code>, <code>n<sup>2</code> and <code>n<sup>3</code> for <code>n</code> going from 1 to 20.  

2. Read back the file.  Store each variable into a list.  Use these values to compute and print <code>a+bn+cn<sup>2</sup>+dn<sup>3</sup></code> for <code>a=1.</code>, <code>b=2.4</code>, <code>c=5.8</code>, <code>d=0.7</code>.

3. Print the results for each n you have.
</p>
</details>

---

{{< series-buttons overview="/categories/summer-education-series-programming-in-python/" prev="/lesson/ses-python-intro/compound-types/" next="/lesson/ses-python-intro/functions/" >}}



