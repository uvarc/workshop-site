---
title: "10. Projects"
author: "Karsten Siller"
date: 2020-05-10
categories: ["Summer Education Series: Programming in Python"]
toc: true
---

# Logic Exercises

## Beginners Logic

### Project 1

Write a program that:
1. Creates a list of temperatures [0, 10, 20, 30, 40, 50]
2. Prints the number of items in the list
3. Prints the index of temperature 30
4. Adds another temperature 60 at the end
5. Loops through the list of temperatures and converts them from Celsius to
Fahrenheit, printing each value in degrees C and F (use print C,F)

### Project 2

Write a program that:
1. Creates the temperature list 0 through 60 by 10 using a loop rather than by
typing in all the values.
2. As each degree C value is added, converts it to F and adds the F value to a list
for the Fahrenheit equivalents.
3. Makes another loop which prints out C and F similarly to Project 1, i.e. both
on the same line, but does it by indexing into the two lists.

### Project 3

Generate a list of temperatures from -40 to 100 inclusive by increments of 5 degrees Celsius. Create another list of the corresponding Fahrenheit temperatures. Create a list of temperatures in degrees Fahrenheit which are less than zero but for which the corresponding temperature in Celsius is greater than zero. Print the elements of this last list.

---

## Intermediate Logic

### Project 4

A. Write a program that obtains the sum of the numbers from 1 to some specified positive (>0) integer N. Do not use the Gauss formula, do this via “brute force.”
Print the number, its sum as obtained from your work, and the correct answer from the Gauss formula sum(N)=N(N+1)/2
Test your program with N=1, N=25, N=1000
B. Modify your program to print a table of the sums of the first 25 numbers. Print a header that indicates the columns are Integer and Sum. Try to line up your output as best you can (this will be easier once we have studied formatted output). You can use spaces, indicated by double quotes with some number of spaces in between, to separate the two values on each line of your table.

### Project 5

The Collatz conjecture is a fun little exercise in number theory. Given a positive integer, if it is odd multiply it by 3 and add 1. If it is even divide by 2. Repeat this procedure until the result is 1. The Collatz conjecture is that the sequence will always reach 1. No exceptions have been found...yet.
The number of steps required to reach 1 is called the stopping time.
A. Write a program that will find and print the stopping time for the first N positive integers. Count the starting number itself as one of the steps. Print a table of N and stopping time similar to Problem 1B.
Test your program for N=30 and N=50.
B. Modify your program to print the starting number, its stopping time, and the maximum value of the sequence of numbers. Hint: if you use a list you will be able

to use the len() and max() intrinsic (built-in) functions. Confirm that you get the same stopping numbers as before.

--- 

## Expert Logic

### Project 6

Write a program to compute the day of the week for any date of the Gregorian calendar. Here is the formula:
W=(C+Y+L+M+D ) mod 7
Y is the last two digits of the actual year and D is the actual day.
You need to obtain the value of C from the following rule for the years:
If year is in the 1400s, 1800s, 2200s, C=2 If year is in the 1500s, 1900s, 2300s, C=0 If year is in the 1600s, 2000s, 2400s, C=5 If year is in the 1700s, 2100s, 2500s, C=4
Months are numbered from 1 in the usual way, but (from January) M is 0, 3, 3, 6, 1, 4, 6, 2, 5, 0, 3, 5
The only tricky part of this algorithm is L, the number of leap days that have occurred since the beginning of the century of the given date. To obtain this:
1. Integer divide the last two digits of the year by 4 to obtain the number of “ordinary” leap years in the century up to that year, not counting the century year itself if applicable.
2. Obtain the remainder of the two digits and 4. If it is not a century year and the remainder is 0 the year is a leap year, otherwise it is not. If the year itself is a century year see Step 3.
3. If the century (1400, 1500, etc.) was evenly divisible by 400 then the century year is a leap year, otherwise it is not. Thus 2000 was a leap year but 1900 was not. So add 1 for centuries divisible by 400 and 0 otherwise.
4. If your date is January 1-February 29 of a leap year, subtract 1. Try to devise a method to obtain the last two digits on your own.
Print the day of the week as a word (Monday, Tuesday, etc.). Remember that Sunday is the first day of the week and it will be counted as 0 in this algorithm.

Hint: use an appropriate data structure to store the names of the days and the values of M.
Test your program first with your own birth date. Then test with the following dates:
Today’s date
December 25, 1642 (Note: this is Newton’s birth date in the Julian calendar, but use it as a Gregorian date)
October 12, 1492 January 20, 2000 December 11, 2117 November 25, 2402

### Project 7
The algorithm for converting a number in base 10 to another base is as follows:
1. Find the remainder of the number divided by the base.
2. Divide the number by the base using integer division. If the result is greater than zero, replace the old value of the number by the result of the integer division and store the remainder previously obtained as the new leftmost digit for the base and repeat. If the result is 0 the process is complete.
A. Write a program to convert the first 51 integers, starting at 0 and ending at 50, to octal (base 8). Print a table of the decimal number and its octal equivalent.
Hint: construct a list of digits as you work through the integer divisions. The elements of the list should be strings so you’ll need to convert from integer to string. To change from a list of individual strings to a single string for printing, use the join function as follows:
 "". join(digits)
That is two (regular, not “smart”) double quotes with nothing between them, followed by a period, followed by join and in parentheses, the name of the list you have created.
B. Modify your program to handle bases >10. Use the letters of the alphabet to represent digits 10, 11, 12, ... as A, B, C, ... Hint: the char(<number>) built-in converts from an integer to its representation in the ASCII collating sequence. Note that A is number 65, i.e. chr(65)="A". The rest of the alphabet follows in numerical sequence to 96, then the lower-case letters begin at 97. Please use upper case letters.
The only widely used base greater than 10 is hexadecimal (base 16). Print a table of 0 to 50 as hexadecimal numbers.

If you have time, try base 20 (vigesimal), which has been used in some historic cultures such as the Mayans, some African tribes, and some areas in and around India. (We presume that for this base, people counted on toes as well as fingers.) Use the letter symbols for digits >10 even though they aren’t historically or culturally correct.

---

# Specific Modules

## NumPy

### Project 1
Create a new Python script that performs the following operations: 
- Create a numpy array, x,  of values from 1 to 20, with step sizes of 0.01.
- Create a numpy array, y, where y = sin(x) + cos(2x)
- Optional: Enhance Project 1 by allowing the user to specify the x start, end and stride values.
- Optional: Plot y as a function of x using the matplotlib package (see below)

Remember you need to add the `import numpy` (or commonly used `import numpy as np`) statement in your script before you can use the numpy package.

### Project 2
Find the maximum of a 3d surface by “brute force” evaluation of x, y, z values. 

![](/images/ses-python-intro/exercise-bruteforce.png)

- Generate a list of N random values for each of x and y over the above range. For testing you can use N=8,000,000.
- Determine the maximum of the 3d surface. 
- Optional: Plot the 3d surface using the matplotlib package (see below).


## Pandas 
These are in generally in order of difficulty, from easiest to most difficult. We have not covered all of these items in our lectures, so feel free to ask questions or better yet, ask Google. Ex: ("python pandas create new dataframe")

### Project 1
Create new pandas, with a size of at least 5x3 (5 rows and 3 columns). Populate the dataframe with data of your choice.
- Begin by importing pandas
- Create a new column. If your data allows, the column could be a ratio based on existing columns (ex: pay_per_hour = df['price'] / df['time']). Or it could be something unrelated
- Rename your columns with a variable name. This is not required but often makes your code more readable. 
- Print a list of all columns. Then print the value counts of all your columns.
- split a subset of your dataframe based on some condition. Do it at least twice. Once using .loc and once using .iloc.
- use the groupby() method to group your dataframe in some way that makes sense for your data

<details>
<summary>See an example solution here (Remember, yours could be totally different)</summary>
<pre>
<code>

#import pandas
import pandas as pd 

#create new dataframe
basketball_coaches = pd.DataFrame({"Name": ['Tony Bennett', 'Roy Williams', 'Mike Krzyzewski', 'Tom Izzo', 'Jim Boeheim'],
                          "School": ['Virginia', 'North Carolina', 'Duke', 'Michigan State', 'Syracuse'],
                          "Email": ['tbennett@virginia.edu', 'rwilliams@unc.edu', 'coachk@duke.edu','tizzo@msu.edu', 'jboeheim@syracuse.edu'],
                          "Career Wins": [346, 871, 1132, 606, 944],
                          "National Championships": [1, 3, 5, 2, 1]})


print(basketball_coaches)


#rename columns with a variable name
name = basketball_coaches['Name']
school = basketball_coaches['School']
email = basketball_coaches['Email']
career_wins = basketball_coaches['Career Wins']
championships = basketball_coaches['National Championships']

#make new subset of data
wins_per_championship = career_wins/championships

#or if you want it to be a part of the dataframe
basketball_coaches['Wins Per Championship'] = basketball_coaches['Career Wins'] / basketball_coaches['National Championships']



#print a list of all the columns
print(basketball_coaches.columns.tolist())



#split a subset of the dataframe based on some condition. Several examples listed here
uva_coach = basketball_coaches.loc[basketball_coaches['School'] == 'Virginia']

multiple_championships = basketball_coaches.loc[basketball_coaches['National Championships'] > 1]

first_three_coaches = basketball_coaches.iloc[:3]


</code>
</pre>
</details>


### Project 2
Take the following code block:
```
import pandas

df1 = pd.DataFrame({'ID #': [1,2,3,4,5,6,7,8,9,10],
                    'Names': ['John','Dave','Mary','Sarah','Mohammed','Rohan','Prisha','Vijay','Ananya','Raj'],
                    'Country': ['USA','USA','USA','UK','India','India','UK','India','UK','India']})

df2 = pd.DataFrame({'ID #': [1,2,3,4,5,6,7,8,9,10],
                    'Salary': [50000, 60000, 65000, 53000, 59000, 74000, 86000, 41000, 94000, 66000],
                    'Age': [24, 46, 51, 29, 33, 38, 70, 46, 49, 35]})
```

- Join the two dataframe together using the [merge function](https://pandas.pydata.org/pandas-docs/stable/user_guide/merging.html)
- How many people come from each country? (Hint: Don't just count them. Which function allows you to see that easily?)
- Reshape the data and create a pivot table view of people by country using the [pivot_table function](https://www.geeksforgeeks.org/python-pandas-pivot_table/). Also include the name, age, and salary in the results

<details>
<summary>See the solution here</summary>
<pre>
<code>
import pandas as pd


df1 = pd.DataFrame({'ID #': [1,2,3,4,5,6,7,8,9,10],
                    'Name': ['John','Dave','Mary','Sarah','Mohammed','Rohan','Prisha','Vijay','Ananya','Raj'],
                    'Country': ['USA','USA','USA','UK','India','India','UK','India','UK','India']})

df2 = pd.DataFrame({'ID #': [1,2,3,4,5,6,7,8,9,10],
                    'Salary': [50000, 60000, 65000, 53000, 59000, 74000, 86000, 41000, 94000, 66000],
                    'Age': [24, 46, 51, 29, 33, 38, 70, 46, 49, 35]})

    
#merge
result = pd.merge(df1, df2, on="ID #")

#see counts of people by country
#print(result['Country'].value_counts())

#pivot table reshape
result2 = pd.pivot_table(result, index=['Country', 'Name', 'Age', 'Salary'])
</code>
</pre>
</details>

### More Projects

Rather than re-inventing the wheel, there are tons of example projects available online. A great repository of pandas projects is [located here](https://www.geeksforgeeks.org/pandas-practice-excercises-questions-and-solutions/)

## Matplotlib
These examples will be used in conjuction with Pandas, as the two libraries are commonly used together. 

### Project 1
Start by downloading [this dataset](/files/cigarette-smoking-behaviour-2018-census-csv.csv), which is about cigarette smoking in New Zealand.
- Read the file into a pandas dataframe
- Make a bar plot in Matplotlib of types of cigarette smokers ('Regular Smoker', 'Ex-Smoker', etc.) and their count
- Because we have a total number of respondents, let's make a new column that is a ratio of # of each category / total number of respondents

### Project 2
Start by downloading [this dataset](/files/cvile_2017_april.xlsx), which contains April 2017 weather data in Charlottesville, VA.
- Read the file into a pandas dataframe
- Make a line plot of average wind speed for each day
- Add main titles, and label axes to be more descriptive
- Play with the bottom axis (x axis) to make sure all dates are visible
- Make a bar and line plot showing average wind speed (in bars) and max wind gust (as a line). Add legend to distinguish between the two.
- Make stacked bar chart of minimum and maximum temperatures for each day
- Make grouped bar chart of minimum and maximum temperatures for each day
- Several ways to do this, but plot the number of each weather 'condition'. Plot sunndy days, partly cloudy days, and rain days

---

{{< series-buttons overview="/categories/summer-education-series-programming-in-python/" prev="/lesson/ses-python-intro/jupyterlab/" next="/lesson/ses-python-intro/resources/" >}}
