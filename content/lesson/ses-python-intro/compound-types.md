---
title: "4. Lists, Tuples, Sets and Dictionaries"
author: "Karsten Siller"
date: 2020-05-11
categories: ["Summer Education Series: Programming in Python"]
toc: true
---

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
