# Pandas

<div class="alert alert-info">
This notebook is intended only to provide an overview of the pandas package. More complete documentation can be found at
<ul>
<li><a href="http://pandas.pydata.org/pandas-docs/stable/index.html">pandas Documentation</a></li>
<li><a href="http://pandas.pydata.org/pandas-docs/stable/10min.html">pandas in 10 minutes</a></li>
</ul>
</div>

<div class="alert alert-danger">
You'll need to have an internet connection for portions of this notebook.
</div>

## Introduction

Some of the leading packages for numerical ("scientific") computation in Python are

* NumPy. Tools for numerical computing. In Excel the basic unit is a cell, a single number. In NumPy the basic unit is a vector (a column) or matrix (a table or worksheet), which allows us to do things with an entire column or table in one line. This facility carries over to Pandas since Pandas is built on NumPy.
* Pandas. The leading package for managing data and our focus in this notebook.
* Matplotlib. The leading graphics package.

All of these packages come with the Anaconda distribution, which means we already have them installed and ready to use.

Pandas is an essential part of data work in Python. Its authors describe it as "an open source library for high-performance, easy-to-use data structures and data analysis tools in Python." Suffice it to say that we can do pretty much everything in Pandas that we can do in Excel -- and more. We can compute sums of rows and columns, generate new rows or columns, construct pivot tables, and lots of other things. And we can do all this with much larger files than Excel can handle.

### Overview. 
In this notebook, we'll introduce Pandas, the Python package devoted to data management. We'll use Pandas to read spreadsheet data into Python and describe the "dataframe" this produces.

We're ready to look at some data. You probably remember that our typical program consists of data input, data management, and graphics. In this notebook, our focus is on the data input, although we'll talk briefly about the data management as well. More concretely, we explain how to get text file data into Python.

### Reminders

**Objects and methods**. Recall that we apply the method `justdoit` to the object `x` with `x.justdoit`.

**Help**. We can get help in the Jupyter console. For the hypothetical `x.justdoit`, we would type 
`x.justdoit?` in the Jupyter console.

**Data structures**. That's the term we use for specific organizations of data. Examples are lists, tuples, and dictionaries. Each has a specific structure and a set of methods that can be applied. Lists are (ordered) collections of objects between square brackets: `numberlist = [1, -5, 2]`. Dictionaries are (unordered) pairs of items between curly brackets: `namedict = {'Brady': 12, 'Gronk': 87}`. The first item in each pair is the "key," the second is the "value.""

**Integers, floats, and strings.** Three common types of data.

**Function returns** We refer to the output of a function as its return. We would say, for example, that the function type(x) returns the type of the input object x. We capture the return with an assignment: `xtype = type(x)`.

## Importing the libraries that we'll use

```python
>>> # Our standard set of imports for pandas, numpy and matplotlib
... import pandas as pd
>>> import numpy as np
>>> import matplotlib.pyplot as plt
```

For our purposes, the most useful data structures offered up by pandas are **DataFrame** and **Series**, and in many ways they will be our "go to" structures for representing and manipulating data as we perform our analytics.

## DataFrame

A DataFrame in pandas is a tabular representation of data. You can sort of think of it as being the equivalent to a worksheet in Microsoft Excel. As always, the easiest way to get a handle on this is to actually grab some data.

### Creating a DataFrame

First, let's take a look at the data in the file so we can compare it later to the date we actually read.

```
iris.data.csv:

ID,Sepal_Length,Sepal_Width,Petal_Length,Petal_Width,Class
1,5.1,3.5,1.4,0.2,Iris-setosa
2,4.9,3,1.4,0.2,Iris-setosa
3,4.7,3.2,1.3,0.2,Iris-setosa
4,4.6,3.1,1.5,0.2,Iris-setosa
5,5,3.6,1.4,0.2,Iris-setosa
6,5.4,3.9,1.7,0.4,Iris-setosa
7,4.6,3.4,1.4,0.3,Iris-setosa
8,5,3.4,1.5,0.2,Iris-setosa
```

Now, let's write a little python to read this file in and create a DataFrame:

```python
>>> # Let's import the pandas library
... import pandas as pd
...
>>> # Let's set up a URL to the file, which in this case is hosted on Github
... base_url = 'https://raw.githubusercontent.com/johnjfox/Analytic_Enterprise/master/data/'
>>> data_url = 'iris/iris.data.csv'
>>> url = base_url + data_url
...
>>> # Now let's read the file
... iris_dataframe = pd.read_csv(url)
...
>>> # Finally, let's print the first few lines
... print iris_dataframe[0:10]
   ID  Sepal_Length  Sepal_Width  Petal_Length  Petal_Width        Class
0   1           5.1          3.5           1.4          0.2  Iris-setosa
1   2           4.9          3.0           1.4          0.2  Iris-setosa
2   3           4.7          3.2           1.3          0.2  Iris-setosa
3   4           4.6          3.1           1.5          0.2  Iris-setosa
4   5           5.0          3.6           1.4          0.2  Iris-setosa
5   6           5.4          3.9           1.7          0.4  Iris-setosa
6   7           4.6          3.4           1.4          0.3  Iris-setosa
7   8           5.0          3.4           1.5          0.2  Iris-setosa
8   9           4.4          2.9           1.4          0.2  Iris-setosa
9  10           4.9          3.1           1.5          0.1  Iris-setosa
```

Let's take a look at what just happened there:

1. First, we set up a URL to a data set which happens to be a CSV, or "comma separated values", text file on my Github account. Github is an internet based revision control system which has a lot of great properties, such as being free :) In this case, we're using a rather famous data set which contains data on some samples of irises. 
2. We created a new object called a DataFrame by reading in the contents of this URL using the `read_csv()` function. 
3. We assigned this newly formed DataFrame to a variable called iris_dataframe
3. Finally, we printed the first 10 rows of the DataFrame.
4. As always in Python, the data is "zero-referenced"

What we obtained through this process is a table is a table of data that represents the contents of the file. The first column of the table is new, however the rest of it is essentially the same as what we saw in the file itself.  The data structure that we just created is called a DataFrame and, as I mentioned before, it's more or less equivalent to what you might remember as a worksheet in Excel.

Generally, a DataFrame consists of three components: a table of data, column labels, and row labels. Typically, columns are variables and the column labels give us their names. In our example, the second column has the name Sepal_Length and its values follow below it. The rows are then observations, and the row labels give us their names. This type of tabular organization is quite typical for the data that we'll be seeing, however occasionally we'll come across data in some other form. When we do, we'll use Python to reorganize it so that it's in a form we're more used to.

While we're talking about the creation of DataFrames, you should know that we can create them directly from data as well. In other words, we don't always have to begin with a file (although for data analysis that's a pretty typical starting point). As an example, we can use a Python dictionary to create a DataFrame.

```python
>>> # A representative extract of our iris data
... # I'll actually create this as a function since I'll be using it several times in this notebook
... def setupDF():
...     data = {'ID': [1, 2, 3, 4, 5],
...             'Sepal_Length': [5.1, 4.9, 4.7, 4.6, 5],
...             'Sepal_Width': [3.5, 3, 3.2, 3.1, 3.6],
...             'Petal_Length': [1.4, 1.4, 1.3, 1.5, 1.4],
...             'Petal_Width': [0.2, 0.2, 0.2, 0.2, 0.2],
...             'Class': ['Iris-setosa', 'Iris-setosa', 'Iris-setosa', 'Iris-setosa', 'Iris-setosa']
...             }
...
...     df = pd.DataFrame(data)
...     return df
...
>>> # with that all set up, let's see what we get
... df = setupDF()
>>> print df
         Class  ID  Petal_Length  Petal_Width  Sepal_Length  Sepal_Width
0  Iris-setosa   1           1.4          0.2           5.1          3.5
1  Iris-setosa   2           1.4          0.2           4.9          3.0
2  Iris-setosa   3           1.3          0.2           4.7          3.2
3  Iris-setosa   4           1.5          0.2           4.6          3.1
4  Iris-setosa   5           1.4          0.2           5.0          3.6
```

We'll come back to use this sample dataset in some of our later examples.

**Example: Limiting the number of rows**

```python
>>> import pandas as pd
...
>>> base_url = 'https://raw.githubusercontent.com/johnjfox/Analytic_Enterprise/master/data/'
>>> data_url = 'iris/iris.data.csv'
>>> url = base_url + data_url
...
>>> iris_dataframe_small = pd.read_csv(url, nrows=5)
...
>>> # Let's print out the results, limiting our answer to the first 10 rows to avoid clutter
... print iris_dataframe_small
   ID  Sepal_Length  Sepal_Width  Petal_Length  Petal_Width        Class
0   1           5.1          3.5           1.4          0.2  Iris-setosa
1   2           4.9          3.0           1.4          0.2  Iris-setosa
2   3           4.7          3.2           1.3          0.2  Iris-setosa
3   4           4.6          3.1           1.5          0.2  Iris-setosa
4   5           5.0          3.6           1.4          0.2  Iris-setosa
```

**Example: Replacing values by NaN**

pandas primarily uses the value `np.nan` to represent missing data. By default any variable which has the value NaN will not included in computations. As we'll see over time, that's a pretty useful capability. Comprehensively dealing with missing or dirty data is beyond the scope of what we're going to do in this lesson, but it's interesting to note that the `read_csv()` function offers up the ability to replace specific values with NaN as they are read in.

```python
>>> import pandas as pd
...
>>> base_url = 'https://raw.githubusercontent.com/johnjfox/Analytic_Enterprise/master/data/'
>>> data_url = 'iris/iris.data.csv'
>>> url = base_url + data_url
...
>>> iris_dataframe_nan = pd.read_csv(url, na_values=[0.2])
...
>>> # Let's print out the results, limiting our answer to the first 10 rows to avoid clutter
... print iris_dataframe_nan[0:10]
   ID  Sepal_Length  Sepal_Width  Petal_Length  Petal_Width        Class
0   1           5.1          3.5           1.4          NaN  Iris-setosa
1   2           4.9          3.0           1.4          NaN  Iris-setosa
2   3           4.7          3.2           1.3          NaN  Iris-setosa
3   4           4.6          3.1           1.5          NaN  Iris-setosa
4   5           5.0          3.6           1.4          NaN  Iris-setosa
5   6           5.4          3.9           1.7          0.4  Iris-setosa
6   7           4.6          3.4           1.4          0.3  Iris-setosa
7   8           5.0          3.4           1.5          NaN  Iris-setosa
8   9           4.4          2.9           1.4          NaN  Iris-setosa
9  10           4.9          3.1           1.5          0.1  Iris-setosa
```

If you're in a situation where you are **not** reading your data from a CSV file, that's ok too. pandas offers a number of other functions for creating DataFrames, including `read_excel()` which does pretty much you might expect it to do.

<div class="alert alert-success">
**Exercise.** Use this notebook cell (or go back and edit one of the ones we've already used) so that you are trying to obtain a file at "iris/broken_link.data.csv". What happened?
</div>

```python
>>> # create your answer to the exercise here
```

<div class="alert alert-success">
**Exercise:** What happens if you add the argument *index_col=0* to the *read_csv()* statement? How does *iris_dataframe* change?
</div>

```python
>>> # create your answer to the exercise here
```

### Working with DataFrames

As I mentioned before, DataFrames consist of a table of data, column labels, and row labels. Typically, columns are used to represent variables and the column labels give us their names. In our original example, the second column has the name Sepal_Length and its values follow below it. In one representation of the data, the rows can be used to capture all of the variables associated with a single observation. In this case the row labels give us a way to label an observation with a name so that it can be easily referred to.  In Python, these row labels are typically referred to as the "index".

``` 
ID = 5
Sepal_Length = 5.0
Sepal_Width = 3.6
Petal_Length = 1.4
Petal_Width = 0.2 
Class = iris-setosa
```

**Working with the variables in a DataFrame**
Having gotten all of our data into a DataFrame, we probably want to do something useful with it. For instance, we might want to access all of the measurements that were taken of $Sepal\_Length$. We do this using a notation that's reminiscent of the list functionality we've seen previously, however in this case we'll actually use the name of the column, for instance:

```python
>>> # Let's make sure we have a clean copy of our sample data
... df = setupDF()
...
>>> print df['Sepal_Length']
0    5.1
1    4.9
2    4.7
3    4.6
4    5.0
Name: Sepal_Length, dtype: float64
```

An alternative syntax for doing the same thing is to simply append the DataFrame name by the column name after a period as

```python
>>> # Let's make sure we have a clean copy of our sample data
... df = setupDF()
...
>>> print df.Sepal_Length
0    5.1
1    4.9
2    4.7
3    4.6
4    5.0
Name: Sepal_Length, dtype: float64
```

Be careful with this form of the syntax though! If the column name has a space in it, or if it's anything other than a string (say an integer), then you'll run into problems.

Once again, let's take a look at what just happened here. First, the results of the operation is **all** of the data in the column, not just a single element or some range. Each column in a DataFrame is represented using a class of objects called a Series, which is just a DataFrame containing a single column of data. Although you may be thinking to yourself "that's interesting, but who cares", it turns out that being able to access all of the data using this type of shorthand allows us to manipulate the contents of a DataFrame very easily. For instance, let's suppose that we want to create a new variable $ratio$ defined as Sepal\_Length / Sepal\_Width

You might imagine that you'd do this by using loops or list comprehensions to create something like following:

```python
>>> # Let's make sure we have a clean copy of our sample data
... df = setupDF()
...
>>> # Now, let's compute a new variable using a for loop
... ratio = list()
>>> for index in range(0,5):
...     ratio.append(df.Sepal_Length[index] / df.Sepal_Width[index])
...
>>> print ratio
[1.4571428571428571, 1.6333333333333335, 1.46875, 1.4838709677419353, 1.3888888888888888]
```

However, the beauty of pandas is that it allows us to do this MUCH more concisely using what's called a "vectorized" operation:

```python
>>> # Let's make sure we have a clean copy of our sample data
... df = setupDF()
...
>>> # Let's compute a new DataFrame using pandas vectorized operations
... ratio = df.Sepal_Length / df.Sepal_Width
...
>>> print ratio
0    1.457143
1    1.633333
2    1.468750
3    1.483871
4    1.388889
dtype: float64
```

A few comments on what just transpired:
1. In this simple example, our vectorized operation was division. Arguably the single most important part of pandas and numpy (the numerical processing library that pandas is built on) are the large number of vectorized operations provided. It's not just simple arithmetic; it's essentially anything you can imagine doing with a table or an array.
2. Why is this important? Well, it's probably not at all obvious from this extremely small and simple example, but using vectorized operations is MUCH MUCH MUCH faster than looping over data in Python. If you can use vectorized operations, you should. It will take some time to get used to this notion, but it will be well worth the effort.
3. Now, as you probably noticed, the results of these two operations aren't 100% exactly the same. The first approach resulted in a list. The second approach left everything as a DataFrame (or more precisely a Series). If we absolutely need to obtain a list for some reason, we can always convert the result of the DataFrame into a list when we're done.

As it turns out, we can use vectorized operations to create new variables within our dataframe:

```python
>>> # Let's make sure we have a clean copy of our sample data
... df = setupDF()
...
>>> # Not only can we create a new variable, we can insert it directly into our existing DataFrame
... df['New_variable'] = df['Sepal_Length'] / df['Sepal_Width']
...
>>> print df
         Class  ID  Petal_Length  Petal_Width  Sepal_Length  Sepal_Width  \
0  Iris-setosa   1           1.4          0.2           5.1          3.5
1  Iris-setosa   2           1.4          0.2           4.9          3.0
2  Iris-setosa   3           1.3          0.2           4.7          3.2
3  Iris-setosa   4           1.5          0.2           4.6          3.1
4  Iris-setosa   5           1.4          0.2           5.0          3.6

   New_variable
0      1.457143
1      1.633333
2      1.468750
3      1.483871
4      1.388889
```

One thing to note here. Remember the shorthand notion for referencing a variable, such as df.Sepal_Length? it turns out that we can't use this syntax for assigning a new variable within the DataFrame.

```python
>>> # Let's make sure we have a clean copy of our sample data
... df = setupDF()
...
>>> # unfortunately, look what happens if we try to use the other form of the variable access notation
... df.another_new_variable = df['Sepal_Length'] + df['Sepal_Width']
...
>>> print df
         Class  ID  Petal_Length  Petal_Width  Sepal_Length  Sepal_Width
0  Iris-setosa   1           1.4          0.2           5.1          3.5
1  Iris-setosa   2           1.4          0.2           4.9          3.0
2  Iris-setosa   3           1.3          0.2           4.7          3.2
3  Iris-setosa   4           1.5          0.2           4.6          3.1
4  Iris-setosa   5           1.4          0.2           5.0          3.6
```

<div class="alert alert-success">
**Exercise.** Use this notebook cell (or go back and edit one of the ones we've already used) to create a new variable in the *iris_dataframe* DataFrame which computes and approximation to the petal area and sepal area by multiplying the length and width of the petal and sepal, respectively. 
</div>

```python
>>> # create your answer to the exercise here
```

#### Simple Exploratory Analysis on DataFrames

Although reading data from a file is useful, it's (hopefully) not the most exciting thing that we'll ever do with our data. pandas offers are fairly broad array of methods on DataFrames which we can use to extract descriptive statistics. Notice that the statistics are run across all of the variables.

A complete list of the DataFrame statistical functions can be found in the Python documentation, but some of the more interesting functions include:

|Method	| Description |
| --- | --- |
|count() | 	Number of non-null observations |
|sum() | Sum of values | 
|mean() | Mean of values | 
|median() | Arithmetic median of values | 
|min() | Minimum |
|max() | Maximum |
|std() | Bessel-corrected sample standard deviation |
|var() | Unbiased variance |
|skew() | Sample skewness (3rd moment) |
|kurt()	| Sample kurtosis (4th moment) |
|quantile() | Sample quantile (value at %) |
|apply() | Generic apply |
|cov() | Unbiased covariance (binary) |
|corr() | Correlation (binary) |
| describe() | multiple summary statistics |

Some examples of applying these functions are provided in the next few cells:

```python
>>> # before we get started let's just remind ourselves of the data contents
...
... print iris_dataframe.head(5)
...
>>> # Now, let's run through some simple statistics
... print "\n\nThe mean: \n\n", iris_dataframe.mean()
>>> print "\n\nThe std: \n\n", iris_dataframe.std()
>>> print "\n\nA summary level description: \n\n", iris_dataframe.describe()
...
>>> # How about descriptive stats for a single variable? We can get that by extracting the variable
... print "\n\nThe Petal_Width mean: \n\n", iris_dataframe.Petal_Width.mean()
   ID  Sepal_Length  Sepal_Width  Petal_Length  Petal_Width        Class
0   1           5.1          3.5           1.4          0.2  Iris-setosa
1   2           4.9          3.0           1.4          0.2  Iris-setosa
2   3           4.7          3.2           1.3          0.2  Iris-setosa
3   4           4.6          3.1           1.5          0.2  Iris-setosa
4   5           5.0          3.6           1.4          0.2  Iris-setosa


The mean:

ID              75.500000
Sepal_Length     5.843333
Sepal_Width      3.054000
Petal_Length     3.758667
Petal_Width      1.198667
dtype: float64


The std:

ID              43.445368
Sepal_Length     0.828066
Sepal_Width      0.433594
Petal_Length     1.764420
Petal_Width      0.763161
dtype: float64


A summary level description:

               ID  Sepal_Length  Sepal_Width  Petal_Length  Petal_Width
count  150.000000    150.000000   150.000000    150.000000   150.000000
mean    75.500000      5.843333     3.054000      3.758667     1.198667
std     43.445368      0.828066     0.433594      1.764420     0.763161
min      1.000000      4.300000     2.000000      1.000000     0.100000
25%     38.250000      5.100000     2.800000      1.600000     0.300000
50%     75.500000      5.800000     3.000000      4.350000     1.300000
75%    112.750000      6.400000     3.300000      5.100000     1.800000
max    150.000000      7.900000     4.400000      6.900000     2.500000


The Petal_Width mean:

1.19866666667
```

#### Basic Patterns for Working with DataFrames

As you begin to work with larger collections of data, you'll realize that there are a few patterns that come up over and over. In this section, we'll cover a few of the most common using our iris data set example.

**Pretty printing a DataFrame**

We can pretty print a dataframe simply by evaluating it in the notebook

```python
>>> # Let's make sure we have a clean copy of our sample data
... df = setupDF()
...
>>> df
         Class  ID  Petal_Length  Petal_Width  Sepal_Length  Sepal_Width
0  Iris-setosa   1           1.4          0.2           5.1          3.5
1  Iris-setosa   2           1.4          0.2           4.9          3.0
2  Iris-setosa   3           1.3          0.2           4.7          3.2
3  Iris-setosa   4           1.5          0.2           4.6          3.1
4  Iris-setosa   5           1.4          0.2           5.0          3.6
```

**Renaming all of the variables in a DataFrame**

We can rename all of the variable names in place, but be careful that you know the specific order of the variables in the DataFrame.

```python
>>> # Let's make sure we have a clean copy of our sample data
... df = setupDF()
...
>>> df.columns = ['X1', 'X2', 'X3', 'X4', 'X5', 'X6']
...
>>> print df
            X1  X2   X3   X4   X5   X6
0  Iris-setosa   1  1.4  0.2  5.1  3.5
1  Iris-setosa   2  1.4  0.2  4.9  3.0
2  Iris-setosa   3  1.3  0.2  4.7  3.2
3  Iris-setosa   4  1.5  0.2  4.6  3.1
4  Iris-setosa   5  1.4  0.2  5.0  3.6
```

Since the columns names are available to us as a list, we can also use list comprehensions to perform various manipulations very succinctly.

**Renaming a single variable in a DataFrame**

Alternatively, you can rename the variables one by one using the *rename()* function. Here, the argument to the *rename()* function is a dictionary that maps the old name (the "key" Petal_Width) with the new name (the "value" Johns_Column). If we want to change more than one variable name, we simply add more items to the dictionary.

In some ways I find this approach to renaming variable to be safer than the previous approach since it avoids the  issue of needing to know the order of the variables, and I tend to use it even if I'm changing all of the variable names.

One thing to note however, the default functionality of *rename()* may not be quite what you'd expect. To get what you;d expect, you'll either need to use the "inplace" argument for *rename()* or assign the results of *rename()* to a new variable.

```python
>>> # Let's make sure we have a clean copy of our sample data
... df = setupDF()
...
>>> # The approach that you may have thought would work
... print "WITHOUT A COPY OR USING inplace \n\n",
>>> df.rename(columns={'Petal_Width': 'Johns_Column'})
>>> print df
...
>>> # An approach that does the variable name change in place
... print "\n\nUSING inplace = True \n\n",
>>> df.rename(columns={'Petal_Width': 'Johns_Column'}, inplace=True)
>>> print df
...
>>> # One alternative approach, but which creates a new variable
... print "\n\nUSING A COPY \n\n",
>>> df2 = df.rename(columns={'Petal_Width': 'Johns_Column'})
>>> print df2
WITHOUT A COPY OR USING inplace

         Class  ID  Petal_Length  Petal_Width  Sepal_Length  Sepal_Width
0  Iris-setosa   1           1.4          0.2           5.1          3.5
1  Iris-setosa   2           1.4          0.2           4.9          3.0
2  Iris-setosa   3           1.3          0.2           4.7          3.2
3  Iris-setosa   4           1.5          0.2           4.6          3.1
4  Iris-setosa   5           1.4          0.2           5.0          3.6


USING inplace = True

         Class  ID  Petal_Length  Johns_Column  Sepal_Length  Sepal_Width
0  Iris-setosa   1           1.4           0.2           5.1          3.5
1  Iris-setosa   2           1.4           0.2           4.9          3.0
2  Iris-setosa   3           1.3           0.2           4.7          3.2
3  Iris-setosa   4           1.5           0.2           4.6          3.1
4  Iris-setosa   5           1.4           0.2           5.0          3.6


USING A COPY

         Class  ID  Petal_Length  Johns_Column  Sepal_Length  Sepal_Width
0  Iris-setosa   1           1.4           0.2           5.1          3.5
1  Iris-setosa   2           1.4           0.2           4.9          3.0
2  Iris-setosa   3           1.3           0.2           4.7          3.2
3  Iris-setosa   4           1.5           0.2           4.6          3.1
4  Iris-setosa   5           1.4           0.2           5.0          3.6
```

**Using a single column's values to select data**

One of the nicer features of pandas is something called "Boolean indexing". Boolean indexing allows us to pass a Boolean expression (say a comparison of a variable to a threshold) as the argument to the DataFrame indexing. The results of this operation are the records which satisfy the Boolean. For instance:

```python
>>> # Let's make sure we have a clean copy of our sample data
... df = setupDF()
...
>>> print "\n\nThe original data\n\n", df
>>> print "\n\nAn interesting subset: the records where Sepal_Width > 3.1\n\n", df[df.Sepal_Width> 3.1]


The original data

         Class  ID  Petal_Length  Petal_Width  Sepal_Length  Sepal_Width
0  Iris-setosa   1           1.4          0.2           5.1          3.5
1  Iris-setosa   2           1.4          0.2           4.9          3.0
2  Iris-setosa   3           1.3          0.2           4.7          3.2
3  Iris-setosa   4           1.5          0.2           4.6          3.1
4  Iris-setosa   5           1.4          0.2           5.0          3.6


An interesting subset: the records where Sepal_Width > 3.1

         Class  ID  Petal_Length  Petal_Width  Sepal_Length  Sepal_Width
0  Iris-setosa   1           1.4          0.2           5.1          3.5
2  Iris-setosa   3           1.3          0.2           4.7          3.2
4  Iris-setosa   5           1.4          0.2           5.0          3.6
```

**Using a "where" to select data**

Similarly, we can test all of the elements against a threshold very simply

```python
>>> print df[df > 1]
         Class  ID  Petal_Length  Petal_Width  Sepal_Length  Sepal_Width
0  Iris-setosa NaN           1.4          NaN           5.1          3.5
1  Iris-setosa   2           1.4          NaN           4.9          3.0
2  Iris-setosa   3           1.3          NaN           4.7          3.2
3  Iris-setosa   4           1.5          NaN           4.6          3.1
4  Iris-setosa   5           1.4          NaN           5.0          3.6
```

**Extracting a set of variables in a DataFrame to create a new DataFrame**

Often we'll receive a data file that has many more variables than we want to process. Having to deal with a DataFrame like this is both unwieldy and computationally inefficient. So, when this happens, we'll frequently construct a DataFrame that consists of only the variables that we care about. We've already seen how to extract a single variable. If we want to extract multiple variables, we have a few options on how to do so. One way is shown here:

```python
>>> # Let's make sure we have a clean copy of our sample data
... df = setupDF()
...
>>> # Let's extract the information on only the Petals
... variable_list = ['ID', 'Petal_Width', 'Petal_Length']
...
>>> print "\n\nA DATAFRAME CONTAINING THE EXTRACTED VARIABLES \n\n",
>>> df2 = df[variable_list]
>>> print df2
...
>>> # Notice that the original DataFrame is unchanged
... print "\n\nTHE ORIGINAL DATAFRAME\n"
>>> print df


A DATAFRAME CONTAINING THE EXTRACTED VARIABLES

   ID  Petal_Width  Petal_Length
0   1          0.2           1.4
1   2          0.2           1.4
2   3          0.2           1.3
3   4          0.2           1.5
4   5          0.2           1.4


THE ORIGINAL DATAFRAME

         Class  ID  Petal_Length  Petal_Width  Sepal_Length  Sepal_Width
0  Iris-setosa   1           1.4          0.2           5.1          3.5
1  Iris-setosa   2           1.4          0.2           4.9          3.0
2  Iris-setosa   3           1.3          0.2           4.7          3.2
3  Iris-setosa   4           1.5          0.2           4.6          3.1
4  Iris-setosa   5           1.4          0.2           5.0          3.6
```

**Extracting a set of variables in a DataFrame to create a new DataFrame**

Sometimes it's easier to specify the variables to drop rather than to specify the ones to keep. The following pattern accomplishes this:

```python
>>> # Let's make sure we have a clean copy of our sample data
... df = setupDF()
...
>>> # Let's extract the information on only the Petals
... variable_list = ['Sepal_Width', 'Sepal_Length']
...
>>> df2 = df.drop(variable_list, axis=1)
...
>>> print df2
         Class  ID  Petal_Length  Petal_Width
0  Iris-setosa   1           1.4          0.2
1  Iris-setosa   2           1.4          0.2
2  Iris-setosa   3           1.3          0.2
3  Iris-setosa   4           1.5          0.2
4  Iris-setosa   5           1.4          0.2
```

Notice that we needed to specify *axis=1* here. This told the drop function that we were dropping columns. We could also specify *axis=0* to create a new dataframe without a subset of the observations (i.e. rows) using *drop()*.

**Extracting the first or last N rows from a DataFrame**

```python
>>> # for this example, let's use the larger dataset just because it's a bit more interesting
... print "\n\nFIRST 10 ROWS\n", iris_dataframe.head(10)
...
>>> print "\n\nLAST 10 ROWS\n", iris_dataframe.tail(10)


FIRST 10 ROWS
   ID  Sepal_Length  Sepal_Width  Petal_Length  Petal_Width        Class
0   1           5.1          3.5           1.4          0.2  Iris-setosa
1   2           4.9          3.0           1.4          0.2  Iris-setosa
2   3           4.7          3.2           1.3          0.2  Iris-setosa
3   4           4.6          3.1           1.5          0.2  Iris-setosa
4   5           5.0          3.6           1.4          0.2  Iris-setosa
5   6           5.4          3.9           1.7          0.4  Iris-setosa
6   7           4.6          3.4           1.4          0.3  Iris-setosa
7   8           5.0          3.4           1.5          0.2  Iris-setosa
8   9           4.4          2.9           1.4          0.2  Iris-setosa
9  10           4.9          3.1           1.5          0.1  Iris-setosa


LAST 10 ROWS
      ID  Sepal_Length  Sepal_Width  Petal_Length  Petal_Width           Class
140  141           6.7          3.1           5.6          2.4  Iris-virginica
141  142           6.9          3.1           5.1          2.3  Iris-virginica
142  143           5.8          2.7           5.1          1.9  Iris-virginica
143  144           6.8          3.2           5.9          2.3  Iris-virginica
144  145           6.7          3.3           5.7          2.5  Iris-virginica
145  146           6.7          3.0           5.2          2.3  Iris-virginica
146  147           6.3          2.5           5.0          1.9  Iris-virginica
147  148           6.5          3.0           5.2          2.0  Iris-virginica
148  149           6.2          3.4           5.4          2.3  Iris-virginica
149  150           5.9          3.0           5.1          1.8  Iris-virginica
```

#### Manipulating DataFrames

Let's imagine that we have a DataFrame called *df*. Some basic functions that we can apply to DataFrames include the following:

| function | what it does | 
| --- | --- | 
| df.shape() |  determines the number of rows and columns in the DataFrame |
| list(df) |  gives us a list containing all of the column names |
| df.columns | gives us a much more verbose version of the same thing | 
| df.index.tolist() | gives us a list containing the index | 
| df.dtypes | the types of data in each column | 
| df.transpose | the transpose of the DataFrame | 
| df.T | an abbreviation for the transpose |
| df.to_csv(*filename_string*) | write the DataFrame to a CSV file | 
| df.to_excel(*filename_string*) | write the DataFrame to an excel file |


<div class="alert alert-success">
**Exercise.** Please write a script to perform some simple operation on our iris data. I've repeated it here for convenience. In particular, I'd like you to write a script which does the following:
<ul>
<li>determines the number of rows and columns in the data</li>
<li>determine the data type contained in each column</li>
<li>gets a list containing all of the row names </li>
<li>gets a list containing all of the column names</li>
<li>create a new DataFrame containing the transpose of our sample data set</li>
</ul>
</div>

```python
>>> # create your answer to the exercise here
```

<div class="alert alert-success">
**Exercise.** Let's string together some common functionality. Create a script which will compute the min, the max, the mean and the standard deviation for each variety of iris. Return the results as a single DataFrame.
</div>

```python
>>> # create your answer to the exercise here
```
