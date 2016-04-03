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
...
>>> df.head()
          Timestamp        Username   IQ
0  4/2/2016 8:33:16  johnfox@bu.edu  111
```

```python
>>> # filter the submissions that were too late
...
... print 'NUM ENTRIES = ', len(df)
>>> df.describe()
NUM ENTRIES =  1
        IQ
count    1
mean   111
std    NaN
min    111
25%    111
50%    111
75%    111
max    111
```

```python
>>> # let's get a distribution plot
...
... df.IQ.plot.hist()
```
