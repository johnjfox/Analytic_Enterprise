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
171  Jean-Marie Cardebat    T     Red    14.5
118         Tyler Colman    Q     Red    14.0
92              John Foy    F   White    14.5
14          Linda Murphy    K     Red    13.0
56              John Foy    D   White    15.0
```

```python
>>> wines.sample(5)
   Wine                                      Type/Vineyard  Year    Location  \
5     F                         Bellview Winery Chardonnay  2010  New Jersey
11    L                          Chateau Mouton Rothschild  2004      France
10    K                                   Chateau Montrose  2004      France
9     J  Domaine Marc-Antonin Blain Grand Cru Batard-Mo...  2009      France
7     H  Domaine Jean Latour-Labille Meursault-Charmes ...  2008      France

   Variety
5    White
11     Red
10     Red
9    White
7    White
```

### What's Our Plan?

### Where Do We Start?

### Let's Start With Some Wrangling

```python
>>> df = pd.merge(scores, wines, how='inner', on='Wine')
>>> df.sample(5)
              Judge Wine Variety_x  Rating  \
134  Francis Schott    H     White    14.0
74         John Foy    E     White    14.5
115    Jamal Rayyis    G     White    12.0
140    Linda Murphy    R       Red    15.5
83         John Foy    O       Red    15.0

                                         Type/Vineyard  Year    Location  \
134  Domaine Jean Latour-Labille Meursault-Charmes ...  2008      France
74        Silver Decoy Winery Black Feather Chardonnay  2010  New Jersey
115                             Ventimiglia Chardonnay  2010  New Jersey
140                                 Amalthea Europa VI  2008  New Jersey
83                             Bellview Winery Lumiere  2010  New Jersey

    Variety_y
134     White
74      White
115     White
140       Red
83        Red
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
114    G   White  New Jersey      15
3      A   White  New Jersey      14
33     L     Red      France      16
118    Q     Red      France      14
32     L     Red      France      14
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
