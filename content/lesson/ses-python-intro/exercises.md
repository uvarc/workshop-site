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

1. Creates a list of temperatures [0, 10, 20, 30, 40, 50].
2. Prints the number of items in the list.
3. Prints the index of temperature 30.
4. Adds another temperature 60 at the end.
5. Loops through the list of temperatures and converts them from Celsius to
Fahrenheit, printing each value in degrees C and F (use print C,F).

<details>
<summary>See the solution here:</summary>
<pre>
c_temps = [0, 10, 20, 30, 40, 50]

print (f"Number of items: {len(c_temps)}.")

print (f"Index of '30': {c_temps.index(30)}.")

c_temps.append(60)

for t in c_temps:
    f = t*1.8 + 32
    print (f"Fahrenheit: {f:.2f}")
</pre>
</details>

### Project 2

Write a program that:

1. Creates the temperature list 0 through 60 by 10 using a loop rather than by
typing in all the values.
2. As each degree C value is added, converts it to F and adds the F value to a list
for the Fahrenheit equivalents.
3. Makes another loop which prints out C and F similarly to Project 1, i.e. both
on the same line, but does it by indexing into the two lists.

<details>
<summary>See the solution here:</summary>
<pre>
c_temps = []
f_temps = []
for t in range(0,70,10):
    c_temps.append(t)
    f = t * 1.8 + 32
    f_temps.append(f)
for index in range(len(c_temps)):
    print (f"Celsius: {c_temps[index]:.1f}, Fahrenheit: {f_temps[index]:.1f}")
</pre>
</details>

### Project 3

Write a program that:

1. Generates a list of temperatures from -40 to 100 inclusive by increments of 5 degrees Celsius. 
2. Creates another list of the corresponding Fahrenheit temperatures. 
3. Creates a list of temperatures in degrees Fahrenheit which are greater than zero but for which the corresponding temperature in Celsius is less than zero. Print the elements of this last list.

<details>
<summary>See a basic solution here:</summary>
<pre>
c_temps = []
f_temps = []
for t in range(-40,105,5):
    c_temps.append(t)
    f = t * 1.8 + 32
    f_temps.append(f)

filtered = []
for index in range(len(c_temps)):
    print (c_temps[index], f_temps[index])
    if c_temps[index]<0 and f_temps[index]>0:
        filtered.append(f_temps[index])

print (f"Filtered: {filtered}") 
</pre>
</details>


<details>
<summary>See an advanced solution here:</summary>
<pre>
c_temps = [t for t in range(-40,105,5)]
f_temps = [t * 1.8 + 32 for t in c_temps]
temps = zip(c_temps,f_temps)
filtered = [f for c,f in temps if f>0 and c<0]
print (f"Filtered: {filtered}")
</pre>
</details>

---

## Intermediate Logic

### Project 4

**A.** Write a program that obtains the sum of the numbers from 1 to some specified positive (>0) integer N. Request the value of N as console input from the user. Your program should catch user inputs that cannot be converted to integers greater than 0.  Do not use the Gauss formula, do this via “brute force.”
Print the number, its sum as obtained from your work, and the correct answer from the Gauss formula sum(N)=N(N+1)/2.  Test your program with N=1, N=25, N=1000.

<details>
<summary>See solution here:</summary>
<pre>
<code>
n_str = input("Please enter integer number N > 0: ")
try:
    N = int(n_str)
    if N >0:
        b_sum = 0
        for number in range(1,N+1):
            b_sum = b_sum+number
        print (f"Sum (brute force): {b_sum}, sum (Gaussian method): {N*(N+1)//2}.")
    else:
        print ("Please enter an integer number greater than 0.")
except:
    print (f"The entered value {n_str} cannot be converted to an integer number")
</code>
</pre>
</details>

**B.** Modify your program to print a table of the sums of the first 25 numbers. Use a function to implement the sum computation. Print a header that indicates the columns are Integer and Sum. Try to line up your output as best you can using f-strings.

<details>
<summary>See solution here:</summary>
<pre>
<code>
calculate_sum(N):
    """Calculates the sum 1..N for given integer N."""
    b_sum = 0
    for number in range(1,N+1):
        b_sum = b_sum+number
    return b_sum    

n_str = input("Please enter integer number N > 0: ")
try:
    N = int(n_str)
    if N >0:
        header = f"{'N':5} | {'Sum (brute force)':17} | {'Sum (Gaussian method)':17}"
        print (header)
        print ("".join(["-"] * len(header)))
        for n in range(1,N+1):
            brute_sum = calculate_sum(n)
            print (f"{n:5} | {brute_sum:17} | {n*(n+1)//2:17}")    
    else:
        print ("Please enter an integer number greater than 0.")
except:
    print (f"The entered value {n_str} cannot be converted to an integer number")
</code>
</pre>
</details>

### Project 5

The Collatz conjecture is a fun little exercise in number theory. 

1. Given a positive integer, if it is odd multiply it by 3 and add 1. If it is even divide by 2. 
2. Repeat this procedure until the result is 1.

The Collatz conjecture is that the sequence will always reach 1. No exceptions have been found...yet.  The number of steps required to reach 1 is called the stopping time.

**A.** Write a program that will find and print the stopping time for the first N positive integers. Count the starting number itself as one of the steps. Print a table of N and stopping time.
Test your program for N=30 and N=50.

**B.** Modify your program to print the starting number, its stopping time, and the maximum value of the sequence of numbers. **Hint:** If you use a list you will be able to use the len() and max() intrinsic (built-in) functions. Confirm that you get the same stopping numbers as before.

<details>
<summary>See solution here:</summary>
<pre>
collatz(N):
    """Collatz conjecture algorithm."""
    steps = [N]
    while N>1:
        if (N % 2 == 0):
            N = N // 2
        else:
            N = N * 3 + 1
        steps.append(N)
    return len(steps),max(steps)

numbers = [30,50]
for N in numbers:
    print (f"Computing Collatz for N={N}")
    header = f"{'N':>5}|{'stopping time':>15}|{'max value':>10}"
    print (header)
    print ("".join(['-'] * len(header)))
    for n in range(1,N+1):
        stop,max_value = collatz(n)
        print (f"{n:5}|{stop:15d}|{max_value:10d}")
</pre>
</details>
--- 

## Expert Logic

### Project 6

The algorithm for converting a number in base 10 to another base is as follows:

1. Find the remainder of the number divided by the base.
2. Divide the number by the base using integer division. If the result is greater than zero, replace the old value of the number by the result of the integer division and store the remainder previously obtained as the new leftmost digit for the base and repeat. If the result of the integer division is 0, the process is complete.

**A.** Write a program to convert the first 51 integers, starting at 0 and ending at 50, to octal (base 8). Print a table of the decimal number and its octal equivalent.
**Hint:** construct a list of digits as you work through the integer divisions. The elements of the list should be strings so you’ll need to convert from integer to string. To change from a list of individual strings to a single string for printing, use the join function as follows:
 "". join(digits)
That is two (regular, not “smart”) double quotes with nothing between them, followed by a period, followed by join and in parentheses, the name of the list you have created.

<details>
<summary>See solution here:</summary>
<pre>
def convert_8(N, base=8):
    """Convert base 10 number to number with base 8 (octal)."""
    digits = []
    if n==0:
        return "0"
    while N>0:
        r = N % base
        N = N // base
        digits.append(str(r))
    return "".join(digits[::-1])

print (f"{'Base 10':>8}|{'Base 8':>8}")
for n in range(51):
    print (f"{n:8d}|{convert_8(n):>8}")
</pre>
</details>    
    
**B.** Modify your program to handle bases up to 16 (hexadecimal). Use the letters of the alphabet to represent digits 10, 11, 12, ... as A, B, C, ... Hint: the char(<number>) built-in converts from an integer to its representation in the ASCII collating sequence. Note that A is number 65, i.e. chr(65)="A". The rest of the alphabet follows in numerical sequence to 96, then the lower-case letters begin at 97. Please use upper case letters.
The only widely used base greater than 10 is hexadecimal (base 16). Print a table of 0 to 50 as hexadecimal numbers.

<details>
<summary>See solution here:</summary>
<pre>
def convert(N, alphabet, base=16):
    """Convert base 10 number to number with custom base.""" 
    digits = []
    if n==0:
        return "0"
    while N>0:
        r = N % base
        N = N // base
        digits.append(alphabet[r])
    return "".join(digits[::-1])

base = 8
alphabet = {i:chr(48+i) for i in range(10)}
alphabet.update({10+i:chr(65+i) for i in range(6)})
print (f"{'Base 10':>8}|{'Base {base}':>8}")
for n in range(51):
    conv = convert(n, alphabet, base=base)
    print (f"{n:8d}|{conv:>8}")
</pre>
</details>    

---

# Specific Modules

## NumPy

### Project 1
Create a new Python script that performs the following operations: 

- Create a numpy array, x, of values from 1.0 to 50.0, with step sizes of 0.01.
- Create a numpy array, y, where y = sin(x) + cos(1.4*x) + 0.1*x.
- Determine and print the mean y value.
- Determine and print the x coordinates where y reaches a minimum and where y reaches a maximum in the given interval. **Hint:** Lookup the argmin and argmax functions.
- Optional: Allow the user to specify the x start, end and stride values.
- Optional: Plot y as a function of x using the matplotlib package (see below)

Remember you need to add the `import numpy` (or commonly used `import numpy as np`) statement in your script before you can use the numpy package.

<details>
<summary>See solution here:</summary>
<pre>
import numpy as np

x = np.arange(0.0,50.0,0.01)
y = np.sin(x) + np.cos(1.4*x) + 0.1*x
mean_y = y.mean()
min_index = np.argmin(y) #np.where(y==y.min())
max_index = np.argmax(y) #np.where(y==y.max())
print (f"mean y:{mean_y}")
print (f"max y:{y[min_index]} at x={x[min_index]}")
print (f"max y:{y[max_index]} at x={x[max_index]}")
</pre>
</details> 

### Project 2
Find the maximum of a 3d surface by “brute force” evaluation of x, y, z values. 

![](/images/ses-python-intro/exercise-bruteforce.png)

- Generate a list of N random values for each of x and y over the above range. Use numpy arrays. For testing you can use N=8,000,000.
- Write a function that determines the x/y coordinates that define the maximum z value of the 3d surface. Once the code is working, vary N and compare how the x,y,z max values change.
- Optional: Plot the surface using the matplotlib package (see below).  Be careful, you may want to reduce the number of points to plots while experimenting with the best approach.
- Optional: Create a module for your z calculating function.  Import that module into a main script.  Use the `__name__ = "__main__":` code block in your calling script.

<details>
<summary>See solution here:</summary>
<pre>
import numpy as np

m1 = np.sqrt(2.)
m2 = np.sqrt(np.pi)
s1 = 3.1
s2 = 1.4
s1_2x_sqr = 2*(s1**2)
s2_2x_sqr = 2*(s2**2)
s1_x_s2_x_sqrt_2x_pi = s1 * s2 * (np.pi * 2) ** 0.5

def calc_z(x,y):
    """Calculates z value for x/y coordinates.""" 
    z1 = 0.1 * np.sin(x) * np.sin(x*y)
    alpha = ((x - m1) ** 2)/ s1_2x_sqr
    beta = ((y - m2) ** 2)/ s2_2x_sqr
    z2 = 1 / (np.exp(alpha + beta) * s1_x_s2_x_sqrt_2x_pi) 
    return z1 + z2

N = 8000000
x = np.random.uniform(-10.0*np.pi, 10.0*np.pi, N)
y = np.random.uniform(-10.0*np.pi, 10.0*np.pi, N)
z = calc_z(x,y)
max_idx = np.argmax(z)
</pre>
</details> 

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
