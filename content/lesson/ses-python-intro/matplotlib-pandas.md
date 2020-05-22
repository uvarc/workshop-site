---
title: "8. Pandas, Matplotlib, Seaborn"
author: "Erich Purpur"
date: 2020-05-13
categories: ["Summer Education Series: Programming in Python"]
toc: true
---

# Pandas

Pandas is a python data anlysis library. It was developed to bring a portion of the statistical capabilities of R into python. Pandas creates a table or spreadsheet-like view of the data, arranged in rows and columns. You can then manipulate the data in nearly unlimited ways.

Pandas introduces the Series and Dataframe objects to represent data, incorporating MatPlotLib and many features of NumPy in to these objects to simplify data representation, analysis, and plotting. Pandas works with the [statsmodel](http://www.statsmodels.org/stable/index.html) and [scikit-learn](https://scikit-learn.org/stable/) packages for data modeling. Pandas supports data alignment, missing data, pivoting, groupng, merging, joining datasets, and many other features.

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

You can view the columns headers in several ways.

```
grade_book.columns
grade_book.columns.tolist()
```

Extract values into an Ndarray 

```
grades=grade_book["Grade"].values 
```

### loc and iloc
These are methods for data filtering in pandas which you will commonly use to do practically any data selection task on a dataframe.


You can also access the rows of a dataframe based on their index. These individual rows are _series_ objects. Because pandas rows are indexed, you can call rows by index, just as you would in list or a string.
```
grade_book[2:4]   #returns just rows with index between 2 and 4 (just rows index 2,3. Remeber that slicing excludes top boundary!)
```

You can use .iloc to achieve the same result. Remeber, iloc selects rows based on their index. You must specify rows and columns by their integer index in order to filter them.

```
grade_book.iloc[[2,3]]
```

.loc is a little more interesting. Though it seems a bit verbose, loc allows you to access row indexes based on the value of a column. loc is label-based, meaning that we have to specify the names of the rows and columns that we want to filter out.

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
grouped_years = grade_book.groupby('Year')
year_2 = grouped_years.get_group(2)
```

Or if you just want to see the values and a count of the values of a column, use the .value_counts() method
```
grade_book['Year'].value_counts()
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


# Matplotlib

After all this data analysis, you might wonder how to visualize and represent your data for other humans. That is where Matplotlib, Seaborn, and many other data visualization packages come in. 

Matplotlib is a Python package that can be used to produce high-quality plots similar to those of MATLAB<sup>TM</sup>.  Its homepage and documentation can be found at [matplotlib.org](https://matplotlib.org).  A full complement of plot types is available, including

* line plots
* scatter plots
* histograms
* bar charts 
* pie charts 
* contour plots

### Simple real world examples

To walk through some examples of how to represent a pandas dataframe in various ways using Matplotlib, let's first read [this file](/files/MikeTroutData.csv) into a pandas dataframe. This file is the American baseball player Mike Trout's career statistics (as of 2019).

Let's start by reading in the data and making some changes to the various columns. As you can see below, I am renaming the columns to make them easier to read when plotting them in Matplotlib

![MikeTroutScreenshot.png](/images/python/MikeTroutScreenshot.png)

```
import pandas as pd
import matplotlib.pyplot as plt     #I am pretty sure pyplot is the original functionality of matplotlib
import matplotlib.ticker as ticker

#read data from the csv file into an object called 'df'
df = pd.read_csv("MikeTroutData.csv")

#renaming columns into variables
year = df['Year']
hits = df['H']
at_bats = df['AB']
home_runs = df['HR']
salary = df['Salary']
```
Now we can do our simplest bar plot showing hits on the Y axis, year on the X axis. No bells and whistles here.

```
plt.bar(year, hits)
```
![barplot1.png](/images/python/barplot1.png)


Let's add some labels to make this more readable (and better!). See that I am using the .xlabel and .ylabel methods. There are tons of ways to customize your plot.

```
plt.xlabel('Year')
plt.ylabel('# of Hits')           
plt.suptitle('Mike Trout Hits per year')
plt.bar(year, hits)
```
![barplot2.png](/images/python/barplot2.png)

Turn it into a horizontal bar and change the color.
```
plt.xlabel('# of Hits')
plt.ylabel('Year')
plt.suptitle('Mike Trout Hits per year')
plt.barh(year, hits, color='red')
```
![barplot3.png](/images/python/barplot3.png)

Make it a line plot using the .plot() function (instead of bar() for a bar chart)

```
plt.xlabel('Year')
plt.ylabel('# of Hits')
plt.grid()
plt.plot(year, hits)
```
![lineplot1.png](/images/python/lineplot1.png)

We can have a line and a bar plot together. See that we now have 'At Bats' shown by the red line and 'Hits' in the blue bars. Except now our old labels do not work. It is probably time for something more sophisticated such as a legend.
```
plt.xlabel('Year')
plt.ylabel('# of Hits')
plt.plot(year, at_bats, color='red')
plt.bar(year, hits)
```
![barline1.png](/images/python/barline1.png)

Let's add the legend. Note the use of the .legend() method. If you don't include that, it won't happen! The rest is fairly self explanatory. The legend renders the 'label' argument in each plot method.
```
plt.xlabel('Year')
plt.plot(year, at_bats, color='red', label='At Bats')
plt.bar(year, hits, label='Hits')
plt.legend()         #makes the legend happen!
```
![plotwithlegend1.png](/images/python/plotwithlegend1.png)

You can make a stacked bar chart. This illustrates the idea that you are literally drawing these plots on top of each other. Also notice another nice touch, the year is turned 45 degrees to make room for all year labels.
```
plt.xlabel('Year')
plt.bar(year, hits, label='Hits')
plt.bar(year, home_runs, label='Home Runs')
plt.legend()

plt.xlabel('Year')
plt.xticks(rotation=45)
plt.xticks(year)                #shows all years in label
```
![stackedbar1.png](/images/python/stackedbar1.png)

To make a grouped bar chart, do the same as a stacked bar and move the position of one of the bars as shown below. Notice the second bar(), the first argument is 'year+.2'. This is hard coded, but basically the position on the x axis is .2 units to the right of the default starting point.
```
plt.xlabel('Year')
plt.xticks(rotation=45)
plt.xticks(year)                #shows all years in label

plt.bar(year, hits, width=.2, label='Hits')
plt.bar(year+.2, home_runs, width=.2, label='Home Runs')
plt.legend()
```
![groupedbar1.png](/images/python/groupedbar1.png)

Now a little more sophistication. Suppose you want to see exactly how many hits each bar represents. Now we are introducing labels. See that this works just as in a for loop. We are iterating through each bar to make modifications to it. Does this start to feel a little overwhelming? Don't worry, there are many resources online, in particular Matplotlib Documentation and StackOverflow, which will guide you to a solution. Find a code example and adapt it for your own use.
```
plt.xlabel('Year')
plt.xticks(rotation=45)
plt.xticks(year)                #shows all years in label

plt.ylabel('# of Hits')           
plt.suptitle('Mike Trout Hits per year')

for bar in plt.bar(year, hits):        
    plt.text(bar.get_x() + .4,              #x position of label
             bar.get_height() - 20,           #y position of label
             bar.get_height(),              #actual value of label
             ha='center',
             va='bottom')
```
![barwithlabels.png](/images/python/barwithlabels.png)


Remember, you can do math with your pandas series elements (in your dataframe). In this example, I am displaing a ratio of how much Mike Trout is paid per home run. I am also doing some formatting with the Y axis to represent dollar values.
```
cost_per_home_run = salary/home_runs

plt.xlabel('Year')
plt.xticks(rotation=45)
plt.xticks(year)     

#change Y Axis to show dollar amount
fig, ax = plt.subplots()
formatter = ticker.FormatStrFormatter('$%1.0f')
ax.yaxis.set_major_formatter(formatter)

plt.ylabel('Price')           
plt.suptitle('Mike Trout Yearly Cost Per Home Run')
plt.bar(year, cost_per_home_run)
```
![Formatter.png](/images/python/Formatter.png)

To see many other examples (with code), check out the [Matplotlib Gallery](https://matplotlib.org/3.1.1/gallery/index.html)

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

The call to `sns.set()` imposes the default Seaborn theme to all Matplotlib plots as well as those using Seaborn.  Seaborn provides a number of methods to modify the appearance of its plots as well as Matplotlib plots created while the settings are in scope.  For many examples see their [tutorial](https://seaborn.pydata.org/tutorial/aesthetics.html#aesthetics-tutorial) on styling plots.

---


## Summary and Exercise

Download the file [pandas_demo.ipynb](/data/pandas_demo.ipynb) and the data files [eighthr.data](/data/eighthr.data) and [eightr.names](/data/eighthr.names). Make sure all three files are saved in the same directory. If you are using Windows, check that it does not append ".txt" to the data files. You may need to open File Explorer, go to View, and check "File name extensions."  Open the notebook in JupyterLab or Jupyter.  Go through the exercises in each cell.

---

{{< series-buttons overview="/categories/summer-education-series-programming-in-python/" prev="/lesson/ses-python-intro/numpy-scipy/" next="/lesson/ses-python-intro/jupyterlab/" >}}