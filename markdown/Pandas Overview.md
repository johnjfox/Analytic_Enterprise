# Pandas

## Importing the libraries that we'll use

```python
>>> # Our standard set of imports for pandas, numpy and matplotlib
... import pandas as pd
>>> import numpy as np
>>> import matplotlib.pyplot as plt
```

## Object Creation


## Data Structures

For our purposes, the most useful data structures offered up by pandas are **DataFrame** and **Series**, and in many ways they will be our "go to" structures for representing and manipulating data as we perform our analytics.

### DataFrame
A data frame in pandas is a tabular representation of data. You can sort of think of it as being the equivalent to a worksheet in Microsoft Excel. As always, the easiest way to get a handle on this is to actually grab some data

---
!!python/unicode 'scrolled': true
...

```python
>>> import pandas as pd
>>> base_url = 'http://vincentarelbundock.github.io/Rdatasets/csv/datasets/'
>>> data_url = 'faithful.csv'
>>> url = base_url + data_url
>>> df = pd.read_csv(url)
...
>>> print df[0:10]
   Unnamed: 0  eruptions  waiting
0           1      3.600       79
1           2      1.800       54
2           3      3.333       74
3           4      2.283       62
4           5      4.533       85
5           6      2.883       55
6           7      4.700       88
7           8      3.600       85
8           9      1.950       51
9          10      4.350       85
```

Let's take a look at what just happened there:

1. First, we set up a URL to a data set which happens to be 

### Series
A series in pandas is a generic data structure which has functionality similar to ndarray's and dict's

```python
>>> # the creation of a series from ndarray
... data = np.random.randn(5)
>>> index=['a', 'b', 'c', 'd', 'e']
>>> s = pd.Series(data, index = index)
>>> print s
...
>>> print "\ns['b'] = ", s['b']
...
>>> print "\n", s.index
a   -0.335984
b    0.033823
c   -0.213322
d   -0.120616
e    0.877980
dtype: float64

s['b'] =  0.03382309615

Index([u'a', u'b', u'c', u'd', u'e'], dtype='object')
```

### Other

**Date Ranges**

```python
>>> dates = pd.date_range('20160307', periods=10)
>>> print dates
```

**NaN: Representing "Not a number"**
It's worth noting that numpy has an explicit representation for NaN, i.e *np.nan* which can be used within pandas

```python
>>> s = pd.Series([1,2,3,np.nan,6,8])
>>> print s
```

## Data I/O


## Viewing Data


## Selection

## Operations

## Merge


## grouping


## Reshaping


## Time Series

## Categorical Data
