```python
>>> %matplotlib inline
```

```python
>>> # Our standard set of imports for pandas, numpy and matplotlib
... import pandas as pd
>>> import numpy as np
>>> import matplotlib as mpl
>>> import matplotlib.pyplot as plt
>>> import seaborn as sns
>>> import scipy.stats as stats
...
>>> from math import sqrt
...
>>> # some imports to handle HTML requests and parsing the results
... from StringIO import StringIO
>>> import requests
...
>>> mpl.style.use('fivethirtyeight')
```

```python
>>> # Let's import the pandas library
... import pandas as pd
...
>>> # Let's set up a URL to the file, which in this case is hosted on Github
... base_url = 'https://raw.githubusercontent.com/johnjfox/Analytic_Enterprise/master/data/'
>>> score_data = 'judgment/scores.csv'
>>> wine_data  = 'judgment/wines.csv'
...
>>> # Now let's read the file
... scores = pd.read_csv(base_url + score_data)
>>> wines = pd.read_csv(base_url + wine_data)
...
>>> # Finally, let's print the first few lines
... scores.sample(5)
                   Judge Wine Variety  Rating
92              John Foy    F   White    14.5
159     Daniele Meulders    S     Red    15.0
59          Linda Murphy    D   White    18.0
63   Jean-Marie Cardebat    N     Red    16.0
132     Daniele Meulders    H   White    12.0
```

```python
>>> wines.sample(5)
   Wine                                      Type/Vineyard  Year    Location  \
8     I              Amalthea Cellars Europa VI Chardonnay  2008  New Jersey
19    T                                 Chateau Haut-Brion  2004      France
5     F                         Bellview Winery Chardonnay  2010  New Jersey
7     H  Domaine Jean Latour-Labille Meursault-Charmes ...  2008      France
11    L                          Chateau Mouton Rothschild  2004      France

   Variety
8    White
19     Red
5    White
7    White
11     Red
```

### What's Our Plan?

### Where Do We Start?

### Let's Start With Some Wrangling

```python
>>> df = pd.merge(scores, wines, how='inner', on='Wine')
>>> df.sample(5)
                Judge Wine Variety_x  Rating  \
20           John Foy    B     White      17
6    Daniele Meulders    A     White      10
46       Tyler Colman    M       Red      16
23       Linda Murphy    B     White      15
150  Daniele Meulders    I     White      15

                                         Type/Vineyard  Year    Location  \
20   Unionville Vineyards Pheasant Hill Single Vine...  2010  New Jersey
6                        Heritage Vineyards Chardonnay  2010  New Jersey
46                  Silver Decoy Winery Cabernet Franc  2008  New Jersey
23   Unionville Vineyards Pheasant Hill Single Vine...  2010  New Jersey
150              Amalthea Cellars Europa VI Chardonnay  2008  New Jersey

    Variety_y
20      White
6       White
46        Red
23      White
150     White
```

### Let's Do Some Quick Analyses

```python
>>> pivot = pd.pivot_table(df, index='Location', columns = 'Variety_x', values = 'Rating', aggfunc = 'mean')
>>> pivot
Variety_x         Red      White
Location
France      14.972222  14.041667
New Jersey  13.712963  14.314815
```

```python
>>> df_select = df[['Wine', 'Variety_x', 'Location','Rating']]
>>> df_select = df_select.rename(columns={'Variety_x': 'Variety'})
>>> df_select.sample(5)
    Wine Variety    Location  Rating
21     B   White  New Jersey    19.0
126    H   White      France    11.0
50     M     Red  New Jersey    17.0
154    S     Red  New Jersey    13.0
117    Q     Red      France    14.5
```

```python
>>> sns.boxplot(data=df_select, x='Rating', y='Variety', hue='Location', orient='h')
```

## Hypothesis Tests

```python
>>> # I can do Boolean indexing with multiple criteria, but look at what I need to do
... # I need to use the & to combine the tests (| would be an OR, ~ is a NOT)
... # I also need the parentheses to force the order of operations
... french_white = df_select[(df_select.Location=='France') & (df_select.Variety =='White')]
>>> french_red   = df_select[(df_select.Location=='France') & (df_select.Variety =='Red')]
...
>>> nj_white = df_select[(df_select.Location=='New Jersey') & (df_select.Variety =='White')]
>>> nj_red   = df_select[(df_select.Location=='New Jersey') & (df_select.Variety =='Red')]
```

```python
>>> test_stat, pvalue = stats.ttest_ind(french_white.Rating, nj_white.Rating, equal_var=False)
...
>>> print 'TEST_STAT', test_stat
>>> print 'PVALUE: ', pvalue
TEST_STAT -0.506926443404
PVALUE:  0.613586017009
```

```python
>>> test_stat, pvalue = stats.ttest_ind(french_red.Rating, nj_red.Rating, equal_var=False)
...
>>> print 'TEST_STAT', test_stat
>>> print 'PVALUE: ', pvalue
TEST_STAT 2.1849464097
PVALUE:  0.0319606007853
```
