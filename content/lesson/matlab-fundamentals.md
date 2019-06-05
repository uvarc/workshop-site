---
title: "MATLAB Fundamentals"
author: "Christina Gancayco"
# date: 2019-06-03T21:13:14-05:00
categories: ["MATLAB Programming"]
weight: 1
draft: false
---

<p class="lead">MATLAB is mathematical computing software that combines an easy-to-use desktop environment
with a powerful programming language. MATLAB can be used for data analytics and visualization, 
signal and image processing, and a wide variety of other numerical applications.</p>

## Table of Contents
* [Getting Started](#getting-started)
* [1. The Command Window](#command-window)
* [2. Variables and the MATLAB Workspace](#variables-and-matlab-workspace)
* [3. Scripts and the MATLAB Editor](#scripts-and-matlab-editor)
* [4. Clearing the Workspace and Command Window](#clearing-workspace-and-command-window)
* [5. Getting Help in MATLAB](#getting-help)
* [6. Vectors and Matrices](#vectors-and-matrices)
* [**Problem Set 1**](#problem-set-1)
* [7. Indexing into and Modifying Arrays](#indexing-and-modifying-arrays)
* [8. Logical Arrays](#logical-arrays)
* [9. Array Calculations](#array-calculations)
* [10. Plotting](#plotting)
* [11. Writing a Script and Version Control](#writing-scripts-and-version-control)
* [**Review Project 1**](#review-project-1)
* [12. Decision Trees (If Statements)](#decision-trees)
* [13. For Loops](#for-loops)
* [14. While Loops](#while-loops)
* [**Problem Set 2**](#problem-set-2)
* [15. Writing Functions](#writing-functions)
* [16. Troubleshooting Errors](#troubleshooting-errors)
* [More Practice](#more-practice)


## <a name="getting-started">Getting Started</a>

### Using MATLAB Online
The easiest way to get started is to jump right in! With a current UVa email address, 
you can start using MATLAB online at the following link: [https://matlab.mathworks.com/](https://matlab.mathworks.com/).
You may need to create a Mathworks account using your UVa email before you are able to log in. 
You will be able to save all of your work online and download your files to your computer for future use.

### Install MATLAB on Your Computer
To install MATLAB on your personal machine, you can download the MATLAB installer here: 
[https://www.mathworks.com/downloads/web_downloads/select_release](https://www.mathworks.com/downloads/web_downloads/select_release)
You will need to create a Mathworks account to access the installation files for download.


## <a name="command-window">1. The Command Window</a>
The command window is where you tell MATLAB what to do. Let's try telling MATLAB to do some 
basic math.

In MATLAB, the following symbols are used for mathematical operations:

| Symbol | Operation      |
| :----: | :---           |
| +      | Addition       |
| -      | Subtraction    |
| *      | Multiplication |
| /      | Division       |
| ^      | Exponent       |

**Note**: MATLAB follows the order of operations!

Let's calculate 1 + 2 with MATLAB. In the command window after the **>>**, type `1+2`
and press the **Enter/Return** key on your keyboard.

`1+2`

Feel free to try some other mathematical operations and see what you get!

## <a name="variables-and-matlab-workspace">2. Variables and the MATLAB Workspace</a>

You'll notice that each time you run a command, the output is preceded by `ans = `.
In this case, `ans` is a variable in which MATLAB is storing the answer to your calculation.


Every time you run a new command, `ans` gets overwritten with the new output. To preserve 
outputs, we can assign them to new variables.

Try running `x = 5` in the command window.


Instead of `ans = `, `5` is now preceded by `x = `. If you look in your workspace you will 
now see two variables, `ans` and `x`. The MATLAB workspace is where you can keep track of all 
the variables that currently exist in the MATLAB environment.

> **Variable Name Rules**

> 1. Must start with a letter
2. Can only contain letters, numbers, and underscores.
3. Variable names are case-sensitive (myVar is not the same as myvar).
4. Variable names take precedence over function names.

In MATLAB, the equals sign `=` does not truly mean "equals". `=` means you are assigning 
the value on the right to the variable name on left.


## <a name="scripts-and-matlab-editor">3. Scripts and the MATLAB Editor</a>

When running commands in the command window, you can typically only execute one line of code 
at a time. Scripts are files where we can write multiple lines of code that can be executed 
all at once. Scripts are great for reproducibility and sharing code.

To start writing a script, click the **New Script** button in the top left corner of your 
toolbar. This will open a new blank script in the MATLAB Editor.

When writing scripts, it can be helpful to include comments. These are lines in our script 
that are not executed as code. Comments in MATLAB are preceded by the percent sign `%`.

Here we can begin writing our code. Let's write a script that assigns the value of `2+3` to 
the variable `X`, the value of `2` to the variable `Y`, and the sum of `X` and `Y` to the 
variable `Z`.

```
X = 2+3
Y = 2
Z = X + Y
```

Now we need to save our script. Click the **floppy disk** icon and you will be prompted to 
give your script a name. MATLAB scripts have a **.m** file extension.

Now let's run our script! There are two ways we can do this:

1. Click the **green play button** in the toolbar.
2. Type the name of your script (without the **.m** extension) in the Command Window and 
press the **Enter/Return** key.

You should see all your new variables, `X`, `Y`, and `Z` in the workspace now, as well as all 
our old variables.

## <a name="clearing-workspace-and-command-window">4. Clearing the Workspace and Command Window</a>

You'll notice after we run our script that all of our variables, new and old, now exist in 
the workspace. To remove everything from our workspace, we can use the `clear` command. Go ahead 
and try it now.

Even though all our variables have been cleared, we can still see all of the commands we previously 
ran in the command window. To clear the command window, we can use the `clc` command.

## <a name="getting-help">5. Getting Help in MATLAB</a>

One of the awesome things about MATLAB is that they have thorough documentation for all their 
functions and features. There are multiple ways you can learn more about a command. Let's find 
out more about MATLAB's `pi` command.

1. Type `help pi` in the command window.
2. Type `doc pi` in the command window.
3. Type `pi` in the **Search Documentation** bar in the top right corner of the toolbar.

All of these are valid methods for getting help with MATLAB.

## <a name="vectors-and-matrices">6. Vectors and Matrices</a>

**Arrays** are variables that hold one or more values. Depending on the dimensions of your 
array, it could fall into one of three categories.

<img src="/images/matlab-img1.png" style="height:50%;width:50%"></img>

We have already worked with scalars, so let's try working with vectors.

### Creating Vectors

To manually create a vector, we can put the values we want in square brackets.

Here is an example of a row vector with 4 elements.

```
myRow = [2 4 6 8]
```


Try creating a row vector called `x` containing the elements `1`, `5`, `11`, and `97`.

```
x = [1 5 11 97]
```

To create a column vector, we simply separate the elements of our array with semicolons `;`.

```
myCol = [1; 3; 5; 7]
```

Try creating a column vector called `y` containing the values `4`, `9`, and `8`.

```
y = [4; 9; 8]
```

We can also perform calculations directly within our array.

```
myCalcs = [0*3 1*3 2*3 3*3]
```


Try creating a row vector containing the values `2^2`, `3^3`, and `4^4`. 

```
[2^2 3^3 4^4]
```

If you want to transpose your row vector to convert it to a column vector (or vice versa), 
simply add an apostrophe `'` to the end of your vector.

```
v = [1 2 3 4]
vT = v'
```


Try transposing one of the vectors we already created!

### Creating Matrices
To create a matrix, we combine the syntax for row and column vectors.

```
myMat = [1 2; 3 4; 5 6]
```


Try creating a 2 x 3 matrix (2 rows, 3 columns) that contains `10`, `11`, `12` in the first 
row and `13`, `14`, `15` in the second row.

```
[10 11 12; 13 14 15]
```

### Creating Evenly-Spaced Vectors

If we wanted a row vector containing the values `1` through `25`, that would be very tedious 
to enter by hand. There are two methods by which we can create evenly-spaced vectors.

**1. Colon Operator `:`**

We can use the colon operator when we know the starting value, the end value, and the 
increments by which we want to space our vector.

**2. `linspace`**

We can use `linspace` command when we know the start and end values, and we know how many 
elements we want in the vector.

<img src="/images/matlab-img2.png" style="height:75%;width:75%"></img>

Let's try a couple examples.

First, let's create a vector `u` that starts at `0`, ends at `48`, by increments of `4`.

```
u = 0:4:48
```

Now, let's create a vector `v` that starts at `1`, ends at `300`, with 100 evenly-spaced 
elements.

```
v = linspace(1,300,100)
```

### Concatenating Arrays
We can combine arrays using the same syntax that we use for creating row/column vectors and 
matrices.

**Horizontal Concatenation**

<img src="/images/matlab-img3.png" style="height:50%;width:50%"></img>


**Vertical Concatenation**

<img src="/images/matlab-img4.png" style="height:50%;width:50%"></img>

Let's try a couple examples of concatenating vectors and matrices.

1. Create 2 row vectors: `x1` which contains the values `1` through `5` evenly-spaced by 
increments of 1; and `x2` which contains 5 evenly-spaced values from `100` to `101`.

```
x1 = 1:5
x2 = linspace(100,101,5)
```

2. Vertically concatenate `x1` and `x2` and assign the result to the variable `X`.

```
X = [x1; x2]
```

3. Create 2 column vectors: `y1` which contains the values `10` and `11`; and `y2` which 
contains the values `14` and `15`.

```
y1 = [10; 11]
y2 = [14; 15]
```

4. Horizontally concatenate `y1` and `y2` and assign the result to the variable `Y`.

```
Y = [y1 y2]
```

5. Horizontally concatenate `X` and `Y` and assign the result to the variable `Z`.

```
Z = [X Y]
```


### Array Creation Functions
There are several functions we can use to create arrays so we don't have to do so manually.

1. `ones(m,n)`: creates an m-by-n array where each element has a value of `1`.
(Note: `m` is the number of rows; `n` is the number of columns)

2. `zeros(m,n)`: creates an m-by-n array where each element has a value of `0`.

3. `rand(m,n)`: creates an m-by-n array of uniformly distributed random numbers within the 
interval (0,1).

## <a name="problem-set-1">Problem Set 1</a>

Try these problems on your own, utilizing the concepts we learned above. The solution script can be 
downloaded [here][/files/matlab_fundamentals_ps1.m].

1. Calculate the results of the following:

<img src="/images/OrderOfOps.png"></img>

2. Create a row vector named `odds` containing odd values from `1` to `15`.

3. Create a row vector containing values from `20` to `10` in increments of `-1`.

4. Create a column vector containing 20 evenly spaced values between `100` and `105`.

5. Create a 3-by-4 matrix `m1` containing ones.

6. Create a 3-by-2 matrix `m2` containing zeros.

7. Create a row vector `m3` containing 6 random numbers between 0 and 1.

8. Horizontally concatenate `m1` and `m2`, and vertically concatenate the result with `m3`. 
Assign the final result to the variable `M`.

## <a name="indexing-and-modifying-arrays">7. Indexing into and Modifying Arrays</a>
Arrays can be quite large, and sometimes we only want to work with a subset of the data. 
We can use indexing to extract the data we want.

An **index** refers to the location of an element in an array. For example, the index of the 
first element in an array is `1`.

### Accessing a Single Element in a Vector

Let's create a vector `x` containing 30 linearly spaced values between 0 and 1. We can stop MATLAB 
from printing the output of this command to the Command Window by adding a semicolon `;` to 
the end. We can still see the output of this command in the workspace, but it helps keep our 
Command Window tidy.

```
x = linspace(0,1,30);
```

If we double-click `x` in our workspace, MATLAB will open `x` in the Variable Editor so we 
can see all the values.

Now let's access the third value in `x` and assign the result to the variable `x3`. 
We can access a particular element by listing the index within parentheses after the 
variable name.

```
x3 = x(3)
```

We can double-check our result by looking at `x` in the Variable Editor.

Try accessing the tenth value in `x` and save the result in a variable `x10`.

```
x10 = x(10)
```

### Accessing Multiple Elements in a Vector

We can access a range or slice of values in a vector using the color operator `:`.

We can access the first three elements of `x` using the following command:

```
z = x(1:3)
```

Try accessing the tenth through fifteenth elements of `x` and save the result to the 
variable `y`.

```
y = x(10:15)
```

### Modifying a Single Value in a Vector

We can modify a single value in our vector using the same syntax we use to access a single 
element.

```
x(1) = 3
```

Try changing the second value of `x` to have a value `1`.

```
x(2) = 1;
```

### Indexing Using Variables and Keywords

Instead of using a number as an index, we can index using a variable that contains a 
number.

```
a = 5
xa = x(a)
```

Try creating a variable `idx` that has a value of `5*4`. Use `idx` to index into the vector 
`x`. Assign the result to the variable `xi`.

```
idx = 5*4
xi = x(idx)
```

Suppose we don't know how many elements our array has, but we **do** know that we want to 
extract the last element of the array. We can use the keyword `end` to index into our array.

Let's retrieve the last element of `x` and save the result to a variable `xn`.

```
xn = x(end)
```

## <a name="logical-arrays">8. Logical Arrays</a>

In MATLAB, we can use **relational operators** such as `>`, `<`, `>=`, `<=`, `==` (is equal to), 
and `~=` (does not equal) to compare two values. The result of a comparison is a logical array.

**Logical arrays** are arrays that contain values of `true` and `false`, which can be represented 
numerically as `1` and `0` respectively.

Let's try a couple examples.

Let's see if `pi` is greater than `3`.

```
pi > 3
```


Now let's see if `pi` is greater than `4`, and save the result to the variable `test`.

```
test = pi > 4
```


Reminder: We are able to assign the result of `pi > 4` because `=` does not mean "equal to"!
`=` is an assignment operator.

We can also use **logical operators** such as `&` (AND) and `|` (OR) to combine 
relational operations.

Let's combine check that `pi` is less than `4` and greater than `3`.

```
t = pi < 4 & pi > 3
```

### Logical Arrays with Multiple Elements

We can also use relational operators to compare each element of a vector or matrix with a 
scalar.

```
v = [-5 0 5];
vPos = v > 0
```


We can also do an element-by-element comparison of two arrays. The result will be a logical 
array the same size as the input arrays.

Let's create two 2-by-2 matrices `x` and `y` that contain random numbers between `0` and `1`.
Let's see which values of `x` are greater than `y` and save the result to the variable `z`.

```
x = rand(2)
y = rand(2)
z = x > y
```


### Counting True Values in a Logical Array

We can use the functions `any` or `nnz` (**N**umber of **N**on-**Z**ero elements) to count 
the number of `true` or `1` values in our logical arrays.

Let's see how many ones are in our logical array `z` from the previous example.

```
any(z)
```

`nnz` yields the same result.

```
nnz(z)
```

We can use the `all` function to determine if all of the values in a logical array are true.

```
all(z)
```

We can use the `find` function to get the indices (locations) of the true values in a logical array.

Let's create a vector `v` that contains 20 evenly-spaced values from `10` to `20`.

```
v = 10:20
```

Let's create a logical vector `v_gt15` that is the result of the comparison `v` greater 
than `15`.

```
v_gt15 = v > 15;
```

Now let's use the `find` function to get the indices of the true elements in `v_gt15`.
Assign the result to the variable `idx`.

```
idx = find(v_gt15)
```


### Logical Indexing

Like when we indexed using a range of values, we can also index using logical arrays. When 
we index an array `A` with a logical array `b`, we get the values from `A` that have corresponding 
values of `true` in `b`.

Let's use our vector `v` and logical vector `v_gt15` from the previous example to play with 
logical indexing.

Let's extract all the values of `v` that are greater than `15` and save the resulting values 
to the variable `v_big`.

```
v_big = v(v_gt15)
```


If we didn't have `v_gt15`, we could also put our relational operation directly in the 
parentheses.

```
v_big = v(v > 15)
```


We can also use logical indexing to modify an array. Let's replace all the values of `v` 
that are less than or equal to `13` with a value of `0`.

```
v(v <= 13) = 0
```



## <a name="array-calculations">9. Array Calculations</a>

### Element-wise Addition and Subtraction

Just like with scalars, we can perform mathematical operations on arrays containing multiple 
elements.

Let's create a 3-by-2 matrix `M` containing only values of `1`.

```
M = ones(3,2)
```

Now let's add `1` to each of the values in `M` so that we have a matrix containing only 
values of `2`. Assign this matrix to a variable `M2`.

```
M2 = M + 1
```


If we have two arrays of the same size, we can do element-wise addition and subtraction.

Let's add `M` and `M2` together and assign the result to the variable `M3`.

```
M3 = M + M2
```


### Element-wise Multiplication, Division, and Powers

MATLAB stands for **MAT**rix **LAB**orabory, and is particularly great at matrix operations 
such as matrix multiplication and division. However, sometimes we merely want to perform 
these operations on an element-wise level. To do so, we add `.` in front of the mathematical 
operator we want to use.

Let's create a matrix `M6` that is the product of `M2` and `M3`.

```
M6 = M2 .* M3
```


We can raise each element of `M6` to the power of `4` by applying the dot exponent operator 
`.^`.

```
M6 .^ 4
```


### Matrix Multiplication

We can perform true matrix multiplication by using the `*`, `/`, and `^` operators without 
the dot operator `.` in front of them.

Let's create two matrices: `A`, a 3x2 matrix containing random values between `0` and `1`, and 
`B`, a 2x4 matrix containing random values between `0` and `1`. Multiply `A` and `B` and 
assign the result to the variable `C`.

```
A = rand(3,2);
B = rand(2,4);
C = A * B
```

### Calculating Statistics on Vectors

MATLAB provides many functions for calculating statistics on array data. Some of the most 
common functions include `min`, `max`, `mean`, and `median`.

Let's create a row vector `d` that contains `20` random integers between `1` and `100`. You 
can use the `randi` function to generate this vector. (Use the MATLAB help functions to learn 
more about `randi`)

```
d = randi(100, 1, 20)
```


Now let's calculate the mean of the values in `d` using the `mean` function. Assign the 
result to the variable `d_mean`.

```
d_mean = mean(d)
```


We can determine the smallest value in our vector by using the `min` command.

```
d_min = min(d)
```


We can determine the minimum or maximum value of a vector AND also get the location of that 
value within the vector.

```
[d_max, idx] = max(d)
```


### Calculating Statistics on Matrices

We can also calculate these same statistics on matrices. Let's create a 6-by-3 matrix `M` 
containing random integers between `1` and `30`.

```
M = randi(30, 6, 3)
```

Now let's apply the `mean` function to `M` and save the result to the variable `M_mean`.

```
M_mean = mean(M)
```

The resulting `M_mean` is a 1x3 row vector containing the means for each column of `M`. By 
default, the statistics functions calculate the stat for each column of a 2-dimensional matrix.

Try finding the `median` of each column of `M` and assign the result to the variable `M_median`.

```
M_median = median(M)
```


If you want to calculate statistics across rows, you can use the optional second argument 
`dim` of these functions. By default, MATLAB calculates stats across columns so typically 
you don't not need to set `dim` to `1` if you want this type of results.

<img src="/images/matlab-img5.png" style="height:50%;width:50%"></img>

Let's try calculating the mean value for each row of `M` and save it to the variable `M_Rmean`.

```
M_Rmean = mean(M,2)
```


If we want the mean of all values of `M` we can use the `colon` operator to specify we want 
to include all values.

```
M_TotMean = mean(M(:))
```


Using a single `:` as our index, we are telling MATLAB we want to access all the values.


## <a name="plotting">10. Plotting</a>

MATLAB provides several simple functions for visualizing our data. In this tutorial we will 
go over how to use the `plot` command.

Let's `clear` our workspace and use `clc` to clear our command window.

MATLAB has a lot of built-in datasets that we can play with. Let's import the `edinburgh_marriages` 
dataset into MATLAB now.

```
load edinburgh_marriages
```

(Note: `edinburgh_marriages` is a MAT-file. The full filename is `edinburgh_marriages.mat`. 
MAT-files are a MATLAB filetype that can save your variables and other data types together 
in a single file)

Let's take a look at our Variable Explorer. We should now have two variables, `Year` and `M`. 
Both variables are column vectors with 111 elements each.

We can plot the number of marriages `M` per `Year` using the `plot` command. The first 
argument of `plot` is our x-axis data, and the second argument is our y-axis data.

```
plot(Year, M)
```

<img src="/images/matlab-img6.png" style="height:50%;width:50%"></img>

We can customize our plot by adding inputs to the third argument of our `plot` command.

<img src="/images/matlab-img7.png" style="height:50%;width:50%"></img>
<img src="/images/matlab-img8.png" style="height:50%;width:50%"></img>
<img src="/images/matlab-img9.png" style="height:50%;width:50%"></img>

Let's plot `M` vs. `Year` using red point markers.

```
plot(Year, M, 'r.')
```

<img src="/images/matlab-img10.png" style="height:50%;width:50%"></img>

We can also add a title to our plot using the `title` function.

```
title('Edinburgh Marriages')
```

<img src="/images/matlab-img11.png" style="height:50%;width:50%"></img>

We place our desired title within single quotation marks `'`. This denotes that our title is 
a string, and not a variable called Edinburgh Marriages. Strings are a type of data and 
are typically not meant to be analyzed numerically. We will discuss different data types more in the 
MATLAB Programming Techniques tutorial.

## <a name="writing-scripts-and-version-control">11. Writing a Script and Version Control</a>

Scripts are ways we can record our lines of code so that we can reliably reproduce our 
analyses. Scripts also allow us to edit our code interactively without having to run it 
every time.

Often we make numerous changes to a script, and these changes are often made over several 
sessions and different saved versions of our file. What if we want to access code that we 
wrote in an earlier version of our file? We can use MATLAB's built-in Version Control features 
to accomplish this.

1. Let's create a new script called `testScript.m` and add a line that assigns the value of 
`10` to the variable `x`. Make sure you save this file!

```
x = 10
```

2. Now let's add a line that assigns the value of `29` to `y`. After doing this, save your 
script again.

```
x = 10
y = 29
```

3. Now change the value of `x` to `5`. Save your script one last time.

```
x = 5
y = 29
```

4. Click the **File Versions** tab in your MATLAB toolbar. It should be the right-most tab.


5. Click the **Older** button in the top-left corner. As you continue to click the button, 
you will see older versions of our current script. You can click the **Restore as Latest** 
to revert back to an older version of your current script (this does not get rid of any versions 
you may have created). You can copy code from older versions as well.



## <a name="review-project-1">Review Project 1</a>

### Women's 200m Backstroke

We are going to write a script that performs end-to-end data analysis and visualization 
using times from the 2016 Olympic women's backstroke finals. The solution script to this review 
project can be downloaded [here](/files/matlab_fundamentals_rp1.m).
We will be working with three variables:

* `time`: an 8x4 matrix containing the times of eight swimmers (rows) at 50, 100, 150, and 
200 meter marks (columns)

* `name`: an 8x1 cell array containing the last swimmers' last names

* `country`: an 8x1 cell array containing each swimmer's country code

We will touch more on cell arrays in the MATLAB Programming Techniques tutorial. **Cell arrays** are 
a type of array where each element corresponds to a cell. Each cell can contain a scalar, string, 
or even another array of multiple elements! (Think of how cells in Excel can contain different 
types of data--this is very similar.)

> Objectives

> 1. Load the data contained in `backstroke.mat`.
2. Concatenate a column of zeros to the beginning of the variable `time`. This will represent 
each swimmer's starting time (time at "0 meter mark").
3. Create a single plot of each swimmer's times vs. distance. You will need to create a vector 
containing distances from `0` to `200` in `50` meter increments. This plot should have any style of 
marker at each data point, with solid lines connecting each point. **Hint**: if your y-axis 
data contains multiple rows, the `plot` function will treat each row as a separate dataset.
4. Add a legend using the swimmers' names contained in the cell array `name`. Look up how 
to use the `legend` function to add a legend to your plot.
5. Subtract `time` from the fastest (i.e. minimum) time at each distance. Plot the result vs. 
distance in a new figure, using a marker at each data point and solid lines. Add a legend to the plot 
using the country codes in `country`. **Hint**: by default if you use the `plot` function multiple 
times, your figure will be overwritten each time. Use the `figure` command to open a new figure 
window for your new plot.

You may find it helpful to use comments `%` in your script so you can keep track of what each 
line does. You can also you comments to outline the various steps you need to complete.

## <a name="decision-trees">12. Decision Trees (If/ElseIf/Else Statements)</a>

**Decision trees** are a programming construct we can use to execute particular lines of 
code when a certain condition is met.

Let's start off with basic `if` statements.

### `if` statement

<img src="/images/matlab-img12.png" style="height:30%;width:30%"></img>

Let's create a script that assigns the value `3` to a variable `B` if `A` is positive.

```
clear

A = 1;

if A > 0    
    B = 3;    
end
```

Try running the script using different values for `A`. Check your workspace to see whether 
`B` has been created!

### `if`-`else` statement

What if we want to run one line of code if our initial condition is met, but a different 
line of code if that condition is false? We can build upon our `if` statement and add an 
`else` statement.

<img src="/images/matlab-img13.png" style="height:50%;width:50%"></img>

Let's modify our script so that if `A` is NOT positive, we give `B` a value of `-99`.

```
clear

A = 1;

if A > 0
    B = 3;   
else
    B = -99;
end
```

Try running the script using different values for `A`. Check your workspace to see how the 
value of `B` changes.

### `if`-`elseif`-`else` statement

What if there is code we want to run if an alternative condition is met? We can continue to
build upon a our current decision tree and add an `elseif` statement.

<img src="/images/matlab-img14.png" style="height:50%;width:50%"></img>

Let's modify our script so that if `A` equals `0`, `B` will be assigned a value of `0`.

```
clear

A = 1;

if A > 0
    B = 3;   
elseif A == 0
    B = 0;
else
    B = -99;
end
```

Try running the script again using different values for `A`. Check your workspace to see how the 
value of `B` changes.

## <a name="for-loops">13. For Loops</a>

Suppose we have some code that we want to execute using a bunch of different values. Rather 
than writing out extremely similar blocks of code for each of these different values, we 
can write a single block of code and use a `for` loop to **iterate** over the different input 
values.

<img src="/images/matlab-img15.png" style="height:50%;width:50%"></img>

Let's start with a simple example of where a `for` loop could come in handy. Let's create 
a script that will display all the values of the vector `x` (at indices `1`, `2`, `3`, and `4`).

```
clear
clc

x = 10:10:40;


disp(x(1))
disp(x(2))
disp(x(3))
disp(x(4))
```

This code isn't too tedious to write because `x` only has four elements--but what if `x` contained 
100 values? That would be a lot of lines of code. We can use the `for` loop so that we only 
have to write the `disp` command once, but still have it execute for each of the indices.

```
clear
clc

x = 10:10:40;

for idx = 1:4
    disp(x(idx))
end
```

What if we didn't know how many elements are in `x`? What would we use as the last index 
in our iterator? We could use the `length` or `numel` functions, which tell us how many 
elements are in a vector.

```
clear
clc

x = 2:2:30; 

for idx = 1:length(x)
    disp(x(idx))
end
```


## <a name="while-loops">14. While Loops</a>

**While loops** are combine the conditionals of `if` statements with the iterativeness of 
`for` loops. Code within `while` loops is executed until a condition is no longer met.

<img src="/images/matlab-img16.png" style="height:50%;width:50%"></img>

Let's create a while loop that will continue to add 1 to the variable `x` until `x` is greater 
than or equal to `10`. Let's also display the value of `x` during each iteration of the `for` loop.

```
clear
clc

x = 0;

while x < 10
    disp(x)
    x = x + 1;
end
```

When we run this script, the values 0 through 9 are displayed in our command window. 10 is 
not printed to the command window because the `while` loop stops when `x` is no longer less 
than 10.

What if we forgot to add `1` to `x` during each iteration of the `while` loop?

```
clear
clc

x = 0;

while x < 10
    disp(x)
end
```

If we don't add anything to `x`, its value remains `0`. `0` is always less than `10`, so 
`while` loop would run forever!

If you ever encounter an infinite loop, you can press **Ctrl + C** on your keyboard to stop 
it. In fact, you can use **Ctrl + C** to stop the execution of any code--not just `while` loops!

## <a name="review-project-2">Review Project 2</a>

### The Price is Right!

Let's do an exercise to practice using common programming constructs. The solution script to 
this problem can be downloaded [here](/files/matlab_fundamentals_rp2.m).

Let's create a simple "Price is Right" game.

> Gameplay
> 1. MATLAB will randomly generate an integer between 1 and 100. This value will be the 
`price`.
2. MATLAB will ask the user to `guess` the value of `price`. **Hint**: use the `input` function to 
assign an interactive user value to a variable.
3. The game will continue until the user's `guess` matches the `price`.
4. If the user's `guess` is lower than the `price`, display a message saying "Too low!" **Hint**: 
You can use the `disp` function to display strings (words or numbers within single quotes `''`).
5. If the user's `guess` is higher than the `price`, display a message saying "Too high!"
6. If the user's `guess` matches the `price`, display a message saying "You win!"


## <a name="writing-functions">15. Writing Functions</a>

Suppose there are several functions or lines of code that we want to run repeatedly but with 
different inputs? We could have a script in which we edit the input variable every time we 
want to run it, but opening, modifying, and saving the script can be time-consuming--especially 
for more complex code.

Functions are tools we can use to take input(s), execute code, and produce output(s). When we 
create a function, this is referred to as **defining** the function. If we use a function, this is 
referred to as **calling** the function.

<img src="/images/matlab-img17.png" style="height:50%;width:50%"></img>

### Defining a Function

Let's try defining our own function. This function will take an input vector and output the 
mean, median, and mode.

First let's start by creating a new script. The only code in this script will be the code 
defining our function.

We will start off by defining our function and its name. We will call this function `avgCalc`.

```
function avgCalc
```

The input to `avgCalc` is a vector. We will call this vector `myVec`.

```
function avgCalc(myVec)
```

Now let's define our desired outputs. We will call them `myMean`, `myMedian`, and `myMode`.

```
function [myMean, myMedian, myMode] = avgCalc(myVec)
```

Let's save our function so far to a file. Like scripts, MATLAB function files have a .m 
extension. **IMPORTANT: function files must have the same name as the function they define!**
We will save our function as `avgCalc.m`.

Now we will add the code we want `avgCalc` to execute. We want the function to calculate the 
three different types of averages for our input vector `myVec`.

```
function [myMean, myMedian, myMode] = avgCalc(myVec)

    myMean = mean(myVec);
    myMedian = median(myVec);
    myMode = mode(myVec);
```
Once you've added these lines, go ahead and save the changes to your function.


### Calling a Function

Now let's try calling our function to quickly calculate these averages for a variety of vectors.
We can call our function in the command line or in a script. 

Let's open a new script and create a bunch of vectors of varying sizes containing different values.

```
clear
clc

x = rand(10,1);
y = randi(100, 20, 1);
z = zeros(50,1);
```

Now let's use `avgCalc` to calculate the mean, median, and mode for each of them. When we 
call our function, we replace the names of the function's input and output variables 
with the variable names we actually want to use.


```
clear
clc

x = rand(10,1);
y = randi(100, 20, 1);
z = zeros(50,1);

[x_mean, x_median, x_mode] = avgCalc(x);
[y_mean, y_median, y_mode] = avgCalc(y);
[z_mean, z_median, z_mode] = avgCalc(z);
```

What would have taken 9 lines of code to write (3 average calculations for each of the 3 
vectors) is now reduced to 3 lines of code!

## <a name="troubleshooting-errors">16. Troubleshooting Errors</a>

Oftentimes we accidentally include a typo, or bug, in our code that causes our code to break. 
When we try to run buggy code, MATLAB will print an error to the command window.

<img src="/images/matlab-img18.png" style="height:50%;width:50%"></img>

Never fear! Error messages are our friends--they can help us find our mistake. Error messages 
can sometimes tell us the exact line where our error lies, and they can also sometimes tell us how 
to fix it. However, if you are unsure of what your error message is telling you, you can typically post 
questions about it to discussion forums such as [MATLAB Central](https://www.mathworks.com/matlabcentral/) or 
[Stack Overflow](https://stackoverflow.com/questions/tagged/matlab) and receive an answer within a few 
hours. Sometimes you don't even have to post your question--a lot of times someone has asked it 
before and you can find the answer just by entering your error message in a search engine!

The MATLAB Editor is very intelligent and can detect common bugs such as unmatched brackets 
or parentheses in your code before you even run it. Buggy lines in your script will be marked 
with a red line in the side bar. When you hover your mouse pointer over that red line, a pop-up 
window will appear containing more information about your error.

<img src="/images/matlab-img19.png" style="height:50%;width:50%"></img>


## <a name="more-practice">More Practice</a>

All of this tutorial's lessons were drawn from the MATLAB Fundamentals Course available on the  
[MATLAB academy](https://matlabacademy.mathworks.com/) website. This course typically takes 
3 days to complete and contains much more material and provides more exercises than this 
tutorial. Feel free to learn and practice more of the topics that apply to you, and UVaRC 
will be here to help!



