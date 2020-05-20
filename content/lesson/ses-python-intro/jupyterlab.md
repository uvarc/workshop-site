---
title: "Jupyter Lab"
author: "Karsten Siller"
date: 2020-05-15
categories: ["Summer Education Series: Programming in Python"]
toc: true
---

![AnacondaNavigator](/images/python/AnacondaNavigator.png)

We will start with Jupyterlab.  Launching it will cause a tab to open in your Web browser. Select the Jupyterlab icon.  It may take a while to start.  When it opens, you will see a list of your files on the left and three icons to select the mode.  Jupyterlab incorporates a Jupyter notebook server as well as a plain Python console and a simple text editor.  We want to start a Jupyter notebook so click on the top tile. If this doesn't mean anything to you, don't worry. While we will mostly be using Spyder for the rest of the course. JupyterLab and Jupyter Notebooks serve many functions, one of which is to provide clean, easy to read code. The code is live, meaning you can modify it. When you run a "cell" the output is some visual representation of your data. This can be text, graphics, visuals, etc. 

The Jupyter Notebook enables users to create and share documents that combine live code with narrative text, mathematical equations, visualizations, interactive controls, and other rich output. It also provides building blocks for interactive computing with data: a file browser, terminals, and a text editor.

![JupyterLabSetup](/images/python/JupyterLabSetup.png)

A textbox will open.

![JupyterLabInput](/images/python/JupyterLabInput.png)

Your notebook is untitled.  Open the File menu and click Rename.  Name your notebook hello.ipynb then click the Rename button.

![JupyterLabRename](/imags/python/JupyterLabRename.png)

### Cells

The blank line with the blinking cursor is a cell.  You can type code into the cell.  After the `In[]` prompt type `print("Hello")`
To execute the cell click the arrowhead, or type the `shift+enter` keys together.

### Your First Program

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

### Text Editor

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

### Plotting in JupyterLab

In a new cell, copy and paste the following. Then run the cell(s).  What happens?

You need to add a line

```
import matplotlib.pylab as plt

x = plt.linspace(-1.*plt.pi,plt.pi,100)
y = plt.sin(x)
plt.plot(x,y)

plt.show()
```

Put this into a new cell and run it.  In the upper cell change `sin` to `cos`.  In the Notebook menu select `Run All Cells`

### Exporting

You can export embedded text in your notebook into a script.  First make sure your notebook has a name.  If you have not named your current notebook yet, call it `first_script.ipynb`.  From the Notebook menu find Export To->Executable Script.  Save the script in the usual way from your browser.  If it is in `Downloads` move it to a location of your choice.  You can make a new directory for your Python scripts if you wish.


{{< series-buttons overview="/categories/summer-education-series-programming-in-python/" prev="/lesson/ses-python-intro/io/" next="/lesson/ses-python-intro/numpy-scipy/" >}}