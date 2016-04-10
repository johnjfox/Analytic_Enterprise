# Iris

## Boilerplate

```python
>>> %matplotlib inline
```

```python
>>> # You almost certainly need to run
... # conda install scikit-learn
... import pandas as pd
>>> import numpy as np
>>> import matplotlib as mpl
>>> import matplotlib.pyplot as plt
...
>>> import seaborn as sns
...
>>> from sklearn.cluster import KMeans
...
>>> mpl.style.use('fivethirtyeight')
```

## Read the data

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
... iris_df = pd.read_csv(url)
...
>>> # Finally, let's print the first few lines
... iris_df.head(5)
   ID  Sepal_Length  Sepal_Width  Petal_Length  Petal_Width        Class
0   1           5.1          3.5           1.4          0.2  Iris-setosa
1   2           4.9          3.0           1.4          0.2  Iris-setosa
2   3           4.7          3.2           1.3          0.2  Iris-setosa
3   4           4.6          3.1           1.5          0.2  Iris-setosa
4   5           5.0          3.6           1.4          0.2  Iris-setosa
```

```python
>>> sns.pairplot(iris_df.iloc[:,1:], hue='Class')
<seaborn.axisgrid.PairGrid at 0x10f00c690>
```

```python
>>> iris_df.plot.scatter('Petal_Width', 'Petal_Length', figsize=(8,6))
```

```python
>>> iris_no_id_df = iris_df.iloc[:,1:]
>>> iris_no_id_df.sample(5)
    Sepal_Length  Sepal_Width  Petal_Length  Petal_Width            Class
40           5.0          3.5           1.3          0.3      Iris-setosa
35           5.0          3.2           1.2          0.2      Iris-setosa
82           5.8          2.7           3.9          1.2  Iris-versicolor
92           5.8          2.6           4.0          1.2  Iris-versicolor
5            5.4          3.9           1.7          0.4      Iris-setosa
```

```python
>>> iris_no_id_df.boxplot(vert =False, by='Class')
array([[<matplotlib.axes._subplots.AxesSubplot object at 0x11577be50>,
        <matplotlib.axes._subplots.AxesSubplot object at 0x1163bf3d0>],
       [<matplotlib.axes._subplots.AxesSubplot object at 0x11673ecd0>,
        <matplotlib.axes._subplots.AxesSubplot object at 0x1167a3b10>]], dtype=object)
```

### NOTE: CORRECTION

This is a correction relative to what I showed in class! Thanks to a helpful quality control editor :) a mistake was corrected and this is now producing a more interesting result. Specifically, I was fitting my model using the original dataset which still had the embedded ID. In effect, I was "learning" that the ID gave me a perfect way to tell which iris was which (which, errr... isn't very helpful in general). I've corrected and now you see a more interesting set of results, in the sense that the classification is far from perfect.

```python
>>> # let's map all of the strings in the 'Class' variable into
... # an encoded label
...
... model = KMeans( n_clusters = 3 ) #Set the model to have 3 clusters
...
>>> model = model.fit( iris_no_id_df.iloc[:,0:4] )
...
>>> # We can print out the cluster for each instance
... print model.labels_
[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
 1 1 1 2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 1 2 2 2 2 1 2 2 2 2
 2 2 1 1 2 2 2 2 1 2 1 2 1 2 2 1 1 2 2 2 2 2 1 2 2 2 2 1 2 2 2 1 2 2 2 1 2
 2 1]
```

```python
>>> iris_df['kmeans_class'] = model.labels_
>>> iris_df.sample(5)
      ID  Sepal_Length  Sepal_Width  Petal_Length  Petal_Width  \
39    40           5.1          3.4           1.5          0.2
50    51           7.0          3.2           4.7          1.4
100  101           6.3          3.3           6.0          2.5
49    50           5.0          3.3           1.4          0.2
60    61           5.0          2.0           3.5          1.0

               Class  kmeans_class
39       Iris-setosa             0
50   Iris-versicolor             1
100   Iris-virginica             2
49       Iris-setosa             0
60   Iris-versicolor             1
```

```python
>>> plt.figure(figsize=(10,8))
>>> sns.stripplot(x='Class', y='kmeans_class', data=iris_df, jitter= True)
```

```python
>>> pd.pivot_table(iris_df, index='Class', columns = 'kmeans_class', values ='ID', aggfunc = 'count')
kmeans_class      0   1   2
Class
Iris-setosa      50 NaN NaN
Iris-versicolor NaN  48   2
Iris-virginica  NaN  14  36
```
