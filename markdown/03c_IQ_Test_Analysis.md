```python
>>> %matplotlib inline
```

```python
>>> # Our standard set of imports for pandas, numpy and matplotlib
... import pandas as pd
>>> import numpy as np
>>> import matplotlib.pyplot as plt
>>> import seaborn as sns
...
>>> # some imports to handle HTML requests and parsing the results
... from StringIO import StringIO
>>> import requests
```

```python
>>> # set up the URL
... url = 'https://docs.google.com/a/bu.edu/spreadsheets/d/'
...
>>> # the unique key of the spreadsheet. The sheet must be open to "all"
... key = '1xTQTjmrP9ldjw5hrATUZs3u_djagWKTF_0-pH2x0I-Y'
...
>>> # some required formatting info. this requests CSV
... export = '/export?format=csv&id='
...
>>> # put together the string
... urlString = url+key+export+key
...
>>> # html request
... data = requests.get(urlString).content
...
>>> # and parsing the request into a DataFrame
... df = pd.read_csv(StringIO(data))
...
>>> # and let's make the relevant column name a bit easier to deal with
... df.rename(columns={'My IQ is:': 'IQ'}, inplace=True)
```

```python
>>> df.describe()
        Timestamp  Username  IQ
count           0         0   0
unique          0         0   0
```

```python
>>> # let's get a distribution plot
...
... # df.IQ.plot.hist()
```

## Let's Actually Go Back And Look At Some Previously Collected Data

```python
>>> ## Some Data From A Previous Run Of The Experiment
...
... # set up the URL
... url = 'https://docs.google.com/a/bu.edu/spreadsheets/d/'
...
>>> # the unique key of the spreadsheet. The sheet must be open to "all"
... key = '1mXsoSh_l_WeuJE1E5xjNfsI5yhgqSa3kCne4i65iyw4'
...
>>> # some required formatting info. this requests CSV
... export = '/export?format=csv&id='
...
>>> # put together the string
... urlString = url+key+export+key
...
>>> # html request
... data = requests.get(urlString).content
...
>>> # and parsing the request into a DataFrame
... df_old = pd.read_csv(StringIO(data))
...
>>> # and let's make the relevant column name a bit easier to deal with
... df_old.rename(columns={'My IQ is:': 'IQ'}, inplace=True)
```

```python
>>> df_old.describe()
               IQ
count   55.000000
mean   101.400000
std     13.370227
min     75.000000
25%     90.000000
50%    103.000000
75%    110.000000
max    133.000000
```

```python
>>> # let's get a distribution plot
...
... g = sns.distplot(df_old.IQ,rug=True, bins=10);
>>> g.figure.set_size_inches(10,7)
```

## Hypothesis Tests in Python The Hard Way

```python
>>> # we know the standard deviation of the population, so we can use a z-test
... std = 15.0
>>> mean_H0 = 100.0
...
>>> N = df_old.IQ.count()
>>> test_mean = df_old.IQ.mean()
...
>>> SE = 15 / sqrt(N)
...
>>> # Perform a two-sided test
...
... # Python computes the left sided CDF, i.e. from negative infinity to the z-score
... # taking the negative abs() will make sure we are dealing with a negative z-score
... # When we compute the CDF, we can just double this to get the p-value
... test_stat = -abs(test_mean - mean_H0) / SE
...
>>> print 'STD ERROR: ', SE
>>> print 'TEST STAT: ', test_stat
>>> print 'PVALUE:    ', 2*stats.norm.cdf(test_stat)
STD ERROR:  2.02259958739
TEST STAT:  -0.692178525462
PVALUE:     0.488825222849
```

```python
>>> #plot the pdfs of these normal distributions
... rv = stats.norm(loc = 0, scale = 1.0)
>>> x = np.arange(-5,5,0.01)
>>> x1 = np.arange(-test_stat,5,0.01)
>>> x2 = np.arange(-5,test_stat,0.01)
...
>>> plt.figure(figsize=(8,6))
>>> plt.fill_between(x, rv.pdf(x), color='r',alpha=0.25)
>>> plt.fill_between(x1, rv.pdf(x1), color='b',alpha=0.25)
>>> plt.fill_between(x2, rv.pdf(x2), color='b',alpha=0.25)
```

## Hypothesis Tests in Python Using A Library

Python doesn't provide a single sample z-test straight out of a library, so let's just use a t-test, which in general is a better approach anyway since we'll seldom have the population standard deviation.

```python
>>> test_stat, pvalue = stats.ttest_1samp(df_old.IQ, popmean=100)
>>> print 'TEST_STAT: ', test_stat
>>> print 'P_VALUE:   ', pvalue
TEST_STAT:  0.776552117418
P_VALUE:    0.44081138373
```

## Conclusion: If p is low, the null must go
