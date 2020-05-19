---
title: "8. Pandas, Matplotlib, Seaborn"
author: "Erich Purpur"
date: 2020-05-11
categories: ["Summer Education Series: Programming in Python"]
toc: true
---

# Pandas

Pandas is a python data anlysis library. It was developed to bring a portion of the statistical capabilities of R into python. Pandas creates a table or spreadsheet-like view of the data, arranged in rows and columns. You can then manipulate the data in nearly unlimited ways.

Pandas introduces the Series and Dataframe objects to represtnt data, incorporating MatPlotLib and many features of NumPy in to these objects to simplify data representation, analysis, and plotting. Pandas works with the [statsmodel](http://www.statsmodels.org/stable/index.html) and [scikit-learn](https://scikit-learn.org/stable/) packages for data modeling. Pandas supports data alignment, missing data, pivoting, groupng, merging, joining datasets, and many other features.

## Series

Pandas series are 1 Dimensional objects and can contain any type of data. Think of a series as a single row or column in a pandas dataframe. 

The Series data structure consists of an index plus data. It is similar to a dictionary with the differences that

- the size is fixed
- requesting a non-existent index results in a Key Error (no dynamic creation)

## Dataframe

The most important data structure in Pandas is the Dataframe. It can be conceptualized as a representation of a spreadsheet. Dataframes are two-dimensional. Each column has a name, which can be read from the headers of a spreadsheet, rows are numbered, and datatypes may be different in different columns. Alternatively, a Dataframe may be regarded as a dictionary with values that can be lists, Ndarrays, dictionaries, or Series.Note: it is convention (not required but common practice) to call pandas 'pd' and a dataframe as 'df'.

```
import pandas as pd 
  
grade_book = pd.DataFrame({"Name":["Jim Dandy","Betty Boop","Minnie Moocher","Joe Friday","Teddy Salad"],
	"Year":[2,4,1,2,3],"Grade":[85.4,91.7,73.2,82.3,98.5]})

print(grade_book)

```

Your result will look like this:

| Name           | Year | Grade |
| -------------- | ---- | ----- |
| Jim Dandy      | 2    | 85.4  |
| Betty Boop     | 4    | 91.7  |
| Minnie Moocher | 1    | 73.2  |
| Joe Friday     | 2    | 82.3  |
| Teddy Salad    | 3    | 98.5  |


We can access individual columns by name.  If the name of the column is a valid Python variable name then we may use it as an attribute; otherwise we must refer to it as we would to a dictionary key. These individual columns are _series_ objects.

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

You can also access the rows of a dataframe based on their index. These individual rows are _series_ objects. Because pandas rows are indexed, you can call rows by index, just as you would in list or a string.
```
grade_book[2:4]   #returns just rows with index between 2 and 4 (just rows index 2,3. Remeber that slicing excludes top boundary!)

```

You can use .iloc to achieve the same result. Remeber, iloc selects rows based on their index.
```
grade_book.iloc[[2,3]]
```

.loc is a little more interesting. Though it seems a bit verbose, loc allows you to access row indexes based on the value of a column. 

```
second_years = grade_book.loc[grade_book['Year'] == 2]
```
The result of this is all the students who are in year 2, and all the other columns information about them.

One more example.
```
good_grades = grade_book.loc[grade_book['Grade'] > 90]
```

You should read this from the inside out. Start with grade_book['Grade'] > 90.  This selects student's whose grade is higher than 90 in the Grade column. Then, grade_book.iloc surrounds that statement. This means, pandas is selecting the rows of the students whose grades are higher than 90. These statements can get very complex. 



## Reading Files

Pandas easily reads files in CSV (comma separated values) and other formats. In the case of CSVs, the separator does not have to be a comma, but anything else must be specified through the `sep` keyword argument.

Suppose we have a file `weather.txt` containing weather data over a year for one site.  It is in comma-separated form with exactly one line of column headers.

```
wdata=pd.read_csv('weather.txt')
```

The `read_csv` function stores the column headers as the column names and the rest of the data as the columns in a dataframe object.  To see the data we would type 

```
wdata 
```

## Filtering and grouping

Pandas offers a number of ways to reorganize, group, and extract data.  Conditionals are accepted much as for NumPy arrays 

```
good_grades = grade_book.loc[grade_book['Grade'] > 90]
```

You can add dataframes together

```
good_grades = grade_book.loc[grade_book['Grade'] > 90]

bad_grades = grade_book.loc[grade_book['Grade'] < 80]

best_and_worst_grades = good_grades.append(bad_grades)
```

Groups can be created with `groupby`

```
students_by_year = grade_book.groupby('Year')

for student in students_by_year:
    print(student)

```

We can extract values corresponding to a quantity.  For our grade-book example, we can create a new dataframe for the students who received an "A"

```
grade_book["Letter Grade"]=["B","A","C","B","A"]
top_students = grade_book[grade_book["Letter Grade"]=="A"]
top_students
```

We can create _pivot tables_ to reorganize the data.  Continuing with the grade book, we can make the names into the index and organize by grades.
(For this example the result will have quite a bit of missing data, but a more complete grade book could have more scores.)

```
student_grades = grade_book.pivot(index="Name",columns="Letter Grade",values="Grade")
student_grades
```

## Missing Data

Pandas can easily handle missing data.  Conventionally, we use the IEEE Not A Number (nan) indicator for missing data, since it is easy to check for its presence.  We can also use None; Pandas treats None and NAN as essentially the same thing.  So to check for missing data in our `student_grades` dataframe we can use `isnull()` and `notnull()`, both of which are Boolean functions so will return True or False.

```
student_grades.notnull()
```

We can fill missing values with a quantity.

```
new_grades=student_grades.fillna(0.)
```

Many other options exist.  

## Summary and Exercise

Download the file [pandas_demo.ipynb](/data/pandas_demo.ipynb) and the data files [eighthr.data](/data/eighthr.data) and [eightr.names](/data/eighthr.names). If you are using Windows, check that it does not append ".txt" to the data files.  You may need to open File Explorer, go to View, and check "File name extensions."  Open the notebook in JupyterLab or Jupyter.  Go through the exercises in each cell.


After all this, you might wonder how to visualize your data further. That is where Matplotlib, Seaborn, and many other packages come in. 

# Matplotlib

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

---

# Seaborn

[Seaborn](https://seaborn.pydata.org/index.html) is a package built upon Matplotlib that is targeted to statistical graphics.  Seaborn can be used alone if its defaults are satisfactory, or plots can be enhanced with direct calls to Matplotlib functions.



## Working with Seaborn

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

---

