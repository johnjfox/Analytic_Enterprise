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
<seaborn.axisgrid.PairGrid at 0x10fad5f50>
```

```python
>>> iris_df.plot.scatter('Petal_Width', 'Petal_Length', figsize=(8,6))
```

```python
>>> iris_no_id_df = iris_df.iloc[:,1:]
>>> iris_no_id_df.sample(5)
     Sepal_Length  Sepal_Width  Petal_Length  Petal_Width            Class
124           6.7          3.3           5.7          2.1   Iris-virginica
108           6.7          2.5           5.8          1.8   Iris-virginica
139           6.9          3.1           5.4          2.1   Iris-virginica
118           7.7          2.6           6.9          2.3   Iris-virginica
71            6.1          2.8           4.0          1.3  Iris-versicolor
```

```python
>>> iris_no_id_df.boxplot(vert =False, by='Class')
array([[<matplotlib.axes._subplots.AxesSubplot object at 0x116b0bad0>,
        <matplotlib.axes._subplots.AxesSubplot object at 0x1163de150>],
       [<matplotlib.axes._subplots.AxesSubplot object at 0x117214c10>,
        <matplotlib.axes._subplots.AxesSubplot object at 0x117278b10>]], dtype=object)
```

```python
>>> # let's map all of the strings in the 'Class' variable into
... # an encoded label
...
... model = KMeans( n_clusters = 3 ) #Set the model to have 3 clusters
...
>>> model = model.fit( iris_df.iloc[:,0:4] )
...
>>> # We can print out the cluster for each instance
... print model.labels_
[2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
 2 2 2 2 2 2 2 2 2 2 2 2 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
 1 1]
```

```python
>>> iris_df['kmeans_class'] = model.labels_
>>> iris_df.sample(5)
      ID  Sepal_Length  Sepal_Width  Petal_Length  Petal_Width  \
81    82           5.5          2.4           3.7          1.0   
111  112           6.4          2.7           5.3          1.9   
134  135           6.1          2.6           5.6          1.4   
89    90           5.5          2.5           4.0          1.3   
113  114           5.7          2.5           5.0          2.0   

               Class  kmeans_class  
81   Iris-versicolor             0  
111   Iris-virginica             1  
134   Iris-virginica             1  
89   Iris-versicolor             0  
113   Iris-virginica             1
```

```python
>>> plt.figure(figsize=(10,8))
>>> sns.stripplot(x='Class', y='kmeans_class', data=iris_df, jitter= True)
```

```python
>>> pd.pivot_table(iris_df, index='Class', columns = 'kmeans_class', values ='ID', aggfunc = 'count')
kmeans_class      0   1   2
Class                      
Iris-setosa     NaN NaN  50
Iris-versicolor  50 NaN NaN
Iris-virginica  NaN  50 NaN
```
