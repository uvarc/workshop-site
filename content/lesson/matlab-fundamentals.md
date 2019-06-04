---
title: "MATLAB Fundamentals"
author: "Christina Gancayco"
# date: 2019-06-03T21:13:14-05:00
categories: ["MATLAB Programming"]
weight: 1
draft: true
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
* [15. Data Analysis](#data-analysis)
* [16. Writing Functions](#writing-functions)
* [17. Troubleshooting Errors](#troubleshooting-errors)
* [**Review Project 2**](#review-project-2)


<!-- matlab logo-->


## <a name="getting-started">Getting Started</a>

### Using MATLAB Online
The easiest way to get started is to jump right in! With a current UVa email address, 
you can start using MATLAB online at the following link: [https://matlab.mathworks.com/](https://matlab.mathworks.com/).
You may need to create a Mathworks account before you are able to log in. You will be able to 
save all of your work online and download them to your computer for future use.

### Install MATLAB on Your Computer
To install MATLAB on your personal machine, you can download the MATLAB installer here: 
[https://www.mathworks.com/downloads/web_downloads/select_release](https://www.mathworks.com/downloads/web_downloads/select_release)


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

<!--screenshot here-->



Feel free to try some other mathematical operations and see what you get!

## <a name="variables-and-matlab-workspace">2. Variables and the MATLAB Workspace</a>

You'll notice that each time you run a command, the output is preceded by `ans = `.
In this case, `ans` is a variable in which MATLAB is storing the answer to your calculation.


Every time you run a new command, `ans` gets overwritten with the new output. To preserve 
outputs, we can assign them to new variables.

Try running `x = 5` in the command window.

<!--screenshot here-->

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

Let's try an example.

Let's assign the value of `3*5` to the variable `y`. You should see `y` with a value of `15` 
in your workspace.


## <a name="scripts-and-matlab-editor">3. Scripts and the MATLAB Editor</a>

When running commands in the command window, you can typically only execute one line of code 
at a time. Scripts are files where we can write multiple lines of code that can be executed 
all at once. Scripts are great for reproducibility and sharing code.

To start writing a script, click the **New Script** button in the top left corner of your 
toolbar. This will open a new blank script in the MATLAB Editor.

<!--screen shot-->

When writing scripts, it can be helpful to include comments. These are lines in our script 
that are not executed as code. Comments in MATLAB are preceded by the percent sign `%`.

Here we can begin writing our code. Let's write a script that assigns the value of `2+3` to 
the variable `X`, the value of `2` to the variable `Y`, and the sum of `X` and `Y` to the 
variable `Z`.

<!--screen shot-->

Now we need to save our script. Click the **floppy disk** icon and you will be prompted to 
give your script a name. MATLAB scripts have a **.m** file extension.

<!--screen shot-->

Now let's run our script! There are two ways we can do this:

1. Click the **green play button** in the toolbar.
<!--screen shot-->
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

<!-- screenshot here-->

We have already worked with scalars, so let's try working with vectors.

### Creating Vectors

To manually create a vector, we can put the values we want in square brackets.

Here is an example of a row vector with 4 elements.

`myRow = [2 4 6 8]`

<!-- screenshot here-->

Try creating a row vector called `x` containing the elements `1`, `5`, `11`, and `97`.

<!--screenshot here-->

To create a column vector, we simply separate the elements of our array with semicolons `;`.

`myCol = [1; 3; 5; 7]`

<!-- screenshot here-->

Try creating a column vector called `y` containing the values `4`, `9`, and `8`.

<!--screenshot-->

We can also perform calculations directly within our array.

`myCalcs = [0*3 1*3 2*3 3*3]`

<!-- screenshot here-->

Try creating a row vector containing the values `2^2`, `3^3`, and `4^4`. 

<!-- screenshot here-->

If you want to transpose your row vector to convert it to a column vector (or vice versa), 
simply add an apostrophe `'` to the end of your vector.

```v = [1 2 3 4]
vT = v'```

<!-- screenshot here-->

Try transposing one of the vectors we already created!

### Creating Matrices
To create a matrix, we combine the syntax for row and column vectors.

`myMat = [1 2; 3 4; 5 6]`

<!-- screenshot-->

Try creating a 2 x 3 matrix (2 rows, 3 columns) that contains `10`, `11`, `12` in the first 
row and `13`, `14`, `15` in the second row.

<!-- screen shot-->

### Creating Evenly-Spaced Vectors

If we wanted a row vector containing the values `1` through `25`, that would be very tedious 
to enter by hand. There are two methods by which we can create evenly-spaced vectors.

**1. Colon Operator `:`**

We can use the colon operator when we know the starting value, the end value, and the 
increments by which we want to space our vector.

**2. `linspace`**

We can use `linspace` command when we know the start and end values, and we know how many 
elements we want in the vector.

<!-- screenshot-->

Let's try a couple examples.

First, let's create a vector `u` that starts at `0`, ends at `48`, by increments of `4`.

<!-- screenshot-->

Now, let's create a vector `v` that starts at `1`, ends at `300`, with 100 evenly-spaced 
elements.

<!-- screenshot-->

### Concatenating Arrays
We can combine arrays using the same syntax that we use for creating row/column vectors and 
matrices.

**Horizontal Concatenation**
<!-- screenshot -->


**Vertical Concatenation**

<!--screenshot -->

Let's try a couple examples of concatenating vectors and matrices.

1. Create 2 row vectors: `x1` which contains the values `1` through `5` evenly-spaced by 
increments of 1; and `x2` which contains 5 evenly-spaced values from `100` to `101`.

<!-- screen shot-->

2. Vertically concatenate `x1` and `x2` and assign the result to the variable `X`.

<!--screen shot-->

3. Create 2 column vectors: `y1` which contains the values `10` and `11`; and `y2` which 
contains the values `14` and `15`.

<!--screenshot-->

4. Horizontally concatenate `y1` and `y2` and assign the result to the variable `Y`.

<!--screenshot-->

5. Horizontally concatenate `X` and `Y` and assign the result to the variable `Z`.

<!--screenshot-->


### Array Creation Functions
There are several functions we can use to create arrays so we don't have to do so manually.

1. `ones(m,n)`: creates an m-by-n array where each element has a value of `1`.
(Note: `m` is the number of rows; `n` is the number of columns)

2. `zeros(m,n)`: creates an m-by-n array where each element has a value of `0`.

3. `rand(m,n)`: creates an m-by-n array of uniformly distributed random numbers within the 
interval (0,1).

## <a name="problem-set-1">Problem Set 1</a>

Try these problems on your own, utilizing the concepts we learned above. Solutions can be 
found (here)[link to solutions].

1. Calculate the results of the following:
<!--screenshot-->

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

`x = linspace(0,1,30);`

If we double-click `x` in our workspace, MATLAB will open `x` in the Variable Editor so we 
can see all the values.

Now let's access the third value in `x` and assign the result to the variable `x3`. 
We can access a particular element by listing the index within parentheses after the 
variable name.

`x3 = x(3)`

We can double-check our result by looking at `x` in the Variable Editor.

Try accessing the tenth value in `x` and save the result in a variable `x10`.

`x10 = x(10)`

### Accessing Multiple Elements in a Vector

We can access a range or slice of values in a vector using the color operator `:`.

We can access the first three elements of `x` using the following command:

`z = x(1:3)`

<!--screenshot-->

Try accessing the tenth through fifteenth elements of `x` and save the result to the 
variable `y`.

`y = x(10:15)`

### Modifying a Single Value in a Vector

We can modify a single value in our vector using the same syntax we use to access a single 
element.

`x(1) = 3`

Try changing the second value of `x` to have a value `1`.

`x(2) = 1;`

### Indexing Using Variables and Keywords

Instead of using a number as an index, we can index using a variable that contains a 
number.

```a = 5
xa = x(a)```

Try creating a variable `idx` that has a value of `5*4`. Use `idx` to index into the vector 
`x`. Assign the result to the variable `xi`.

```idx = 5*4
xi = x(idx)```

Suppose we don't know how many elements our array has, but we **do** know that we want to 
extract the last element of the array. We can use the keyword `end` to index into our array.

Let's retrieve the last element of `x` and save the result to a variable `xn`.

`xn = x(end)`

## <a name="logical-arrays">8. Logical Arrays</a>

## <a name="array-calculations">9. Array Calculations</a>




## <a name="plotting">10. Plotting</a>


## <a name="writing-scripts-and-version-control">11. Writing a Script and Version Control</a>




## <a name="review-project-1">Review Project 1</a>



## <a name="decision-trees">12. Decision Trees (If Statements)</a>

## <a name="for-loops">13. For Loops</a>

## <a name="while-loops">14. While Loops</a>


## <a name="problem-set-2">Problem Set 2</a>

## <a name="data-analysis">15. Data Analysis</a>


## <a name="writing-functions">16. Writing Functions</a>


## <a name="troubleshooting-errors">17. Troubleshooting Errors</a>


## <a name="review-project-2">Review Project 2</a>





