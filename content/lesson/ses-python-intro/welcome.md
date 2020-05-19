---
title: "1. Welcome and Getting Started"
author: "Karsten Siller"
date: 2020-05-11
categories: ["Summer Education Series: Programming in Python"]
toc: true
---

# Workshop Overview

This workshop will allow students to go from beginner to basic proficiency in the Python language. Students should be able to commit to attend both morning and afternoon sessions both days for the greatest benefit.

**Prerequisite:** None.

## Table of Contents

**Day 1**

1. [Welcome and Getting Started](/lesson/ses-python-intro/welcome)
2. [Variables, Expressions and Statements](/lesson/ses-python-intro/variables)
3. [Conditionals and Loops](/lesson/ses-python-intro/loops)
4. [Lists, Tuples, Sets and Dictionaries](/lesson/ses-python-intro/compound-types)
5. [Input/Output and Exception Handling](/lesson/ses-python-intro/io)

**Day 2**

6. [Functions, Modules and Classes](/lesson/ses-python-intro/functions)
7. [Numpy and SciPy](/lesson/ses-python-intro/numpy-scipy)
8. [Matplotlib, Seaborn, Pandas](/lesson/ses-python-intro/matplotlib-pandas)
9. [Jupyter Lab](/lesson/ses-python-intro/jupyterlab)
10. [Conclusion & Resources](/lesson/ses-python-intro/resources)

---

# Introduction to Python

{{< callout >}}
"Python is an interpreted, interactive, object-oriented programming language. It incorporates modules, exceptions, dynamic typing, very high level dynamic data types, and classes. Python combines remarkable power with very clear syntax. It has interfaces to many system calls and libraries, as well as to various window systems, and is extensible in C or C++. It is also usable as an extension language for applications that need a programmable interface. Finally, Python is portable: it runs on many Unix variants, on the Mac, and on Windows 2000 and later."  -- from <a  href="https://docs.python.org/3/faq/general.html#what-is-python">docs.python.org</a>
{{< /callout >}}

---

# Setting up Your Environment

The Anaconda environment from [Anaconda Inc.](https://anaconda.org) is widely used because it bundles a Python interpreter, most of the popular packages, and development environments. It is cross platform and freely available. There are two somewhat incompatible versions of Python; __version 2.7__ is deprecated but still fairly widely used.  __Version 3__ is the supported version.  We will use Python 3 but if you know you need to use Python 2.7, you can download that instead.  Anaconda even makes it relatively easy to install both versions.

1. Visit the [Anaconda Download website](https://www.anaconda.com/products/individual), click on the __Download__ button and download the installer for Python 3 for your operating system (Windows, Mac OSX, or Linux). We recommend to use the graphical installer for ease of use.

2. Launch the downloaded installer, follow the onscreen prompts and install the Anaconda distribution on your local hard drive.

## Navigator

Once you have installed Anaconda, find the Navigator application.  You should see a workspace similar to the screenshot, with several options for working environments, some of which are not installed.  We will use Spyder and Jupyterlab, which should already be installed.  If not, click the button to install the package.

![Navigator]()

## Spyder

Now we will switch to Spyder.  Spyder is an Integrated Development Environment, or __IDE__, aimed at Python.  It is well suited for developing longer, more modular programs.  To start it, return to the Anaconda Navigator and click on its tile.  It may take a while to open (watch the lower left of the Navigator).  Once it starts, you will see a layout with an editor pane on the left, an explorer pane at the top right, and an iPython console on the lower right.  This arrangement can be customized but we will use the default for our examples. Type code into the editor.  The explorer window can show files, variable values, and other useful information.  The iPython console is a frontend to the Python interpreter itself.  It is comparable to a cell in JupyterLab.

![Spyder](/images/python/Spyder.png)

If you are using Python 2.7, add the `future` line immediately after the triple-quoted section.

If you type

```
print("Hello World")
```

into the editor pane, it is a script and you must run it in order for the command to be carried out.  Click the green arrow to run the current script.

You can also type commands directly into the iPython console.  Just as with JupyterLab, if you type an expression its value will be printed. You might wonder, why would I type commands directly into the iPython console? There are many reasons, but know that when you run your code either in the editor or console, new variables and objects are created and now living in the memory of your computer. These new variables are now immediately accessible by python. This is significant because sometimes it can take a while to run your code. If you realize you made a mistake in your code or want to test something on the fly, editing and re-running your script from the editor can be very time consuming. If you run a script and then want to modify, test, experiment with your data, you can do so much more quickly coding directly into the console.

Type the following directly into the console.

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

### Example

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

### The Variable Explorer

The Variable Explorer allows us to show the values of variables in our programs.  It is particularly helpful for looking at a group of values (an array). We can change the number of decimal places printed by clicking `Format` and typing in an expression of the `%3f` for three decimal places.  The Variable Explorer also includes icons for saving, refreshing, or importing data to our workspace.

To clear all values in the workspace, type at the iPython console

```
%reset
```

Now re-run your since-plotting code and observe how the variables acquire values.

---

#### The Variable Explorer

The Variable Explorer allows us to show the values of variables in our programs.  It is particularly helpful for looking at a group of values (an array). We can change the number of decimal places printed by clicking `Format` and typing in an expression of the `%3f` for three decimal places.  The Variable Explorer also includes icons for saving, refreshing, or importing data to our workspace.

To clear all values in the workspace, type at the iPython console

```
%reset
```

Now re-run your since-plotting code and observe how the variables acquire values.

## Updating Packages in Anaconda

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
