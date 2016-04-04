# Titanic

## Boilerplate

```python
>>> # You almost certainly need to run
... # conda install scikit-learn
... import pandas as pd
>>> import numpy as np
>>> from sklearn.ensemble import ExtraTreesClassifier
>>> from sklearn.cross_validation import cross_val_score
```

## Read the data

```python
>>> # Let's set up a URL to the file, which in this case is hosted on Github
... base_url = 'https://raw.githubusercontent.com/johnjfox/Analytic_Enterprise/master/data/'
>>> data_url = 'titanic/titanic_train.csv'
>>> url = base_url + data_url
...
>>> train_df = pd.read_csv(url)
```

```python
>>> from sklearn.datasets import load_iris
>>> from sklearn import tree
>>> from sklearn import preprocessing
...
>>> # Let's set up a URL to the file, which in this case is hosted on Github
... base_url = 'https://raw.githubusercontent.com/johnjfox/Analytic_Enterprise/master/data/'
>>> data_url = 'iris/iris.data.csv'
>>> url = base_url + data_url
...
>>> iris_df = pd.read_csv(url)
...
>>> # let's map all of the strings in the 'Class' variable into
... # an encoded label
... le = preprocessing.LabelEncoder()
>>> le.fit(iris_df['Class'])
>>> print list(le.classes_)
...
>>> # extract the data that we need
... iris_data = iris_df.drop(['ID','Class'],1).values
...
>>> # transform the string 'Class Names' into numbers
... iris_target = le.transform(iris_df['Class'])
...
>>> # estimate the classifier
... clf = tree.DecisionTreeClassifier()
>>> clf = clf.fit(iris_data, iris_target)
['Iris-setosa', 'Iris-versicolor', 'Iris-virginica']
```

```python
>>> # run the classifier against a test sample
... c = clf.predict([[1,2,3,4]])
...
>>> # and run the inverse transform to get the string label
... print le.inverse_transform(c[0])
Iris-versicolor
```

```python
>>> # Let's set up a URL to the file, which in this case is hosted on Github
... base_url = 'https://raw.githubusercontent.com/johnjfox/Analytic_Enterprise/master/data/'
>>> data_url = 'titanic/titanic_train.csv'
>>> url = base_url + data_url
...
>>> train_df = pd.read_csv(url)
```

---
!!python/unicode 'scrolled': true
...

```python
>>> print train_df.Age.count()
>>> print train_df[~np.isnan(train_df.Age)].Age.count()
714
714
```

```python
>>> train_df.drop(['PassengerId', 'SibSp', 'Parch', 'Ticket', 'Fare', 'Cabin'], axis=1, inplace=True)
>>> train_df.sample(5)
     Survived  Pclass                                               Name  \
612         1       3                        Murphy, Miss. Margaret Jane   
471         0       3                                    Cacic, Mr. Luka   
335         0       3                                 Denkoff, Mr. Mitto   
142         1       3  Hakkarainen, Mrs. Pekka Pietari (Elin Matilda ...   
225         0       3                       Berglund, Mr. Karl Ivar Sven   

        Sex  Age Embarked  
612  female  NaN        Q  
471    male   38        S  
335    male  NaN        S  
142  female   24        S  
225    male   22        S
```

```python
>>> class_dummies = pd.get_dummies(train_df['Pclass'], prefix='class')
>>> sex_dummies = pd.get_dummies(train_df['Sex'])
>>> embarked_dummies = pd.get_dummies(train_df['Embarked'])
```

```python
>>> cols_to_keep = ['Survived', 'Name', 'Age']
>>> data = train_df[cols_to_keep].join([class_dummies, sex_dummies, embarked_dummies])
>>> data.sample(5)
     Survived                         Name  Age  class_1  class_2  class_3  \
245         0  Minahan, Dr. William Edward   44        1        0        0   
405         0           Gale, Mr. Shadrach   34        0        1        0   
222         0      Green, Mr. George Henry   51        0        0        1   
695         0   Chapman, Mr. Charles Henry   52        0        1        0   
860         0      Hansen, Mr. Claus Peter   41        0        0        1   

     female  male  C  Q  S  
245       0     1  0  1  0  
405       0     1  0  0  1  
222       0     1  0  0  1  
695       0     1  0  0  1  
860       0     1  0  0  1
```

 
## Construct a classifier tree

```python
>>> et = ExtraTreesClassifier(n_estimators=100, max_depth=None, min_samples_split=1, random_state=0)
...
>>> columns = ["Fare", "Pclass"]
...
>>> # this is an important step
... labels = train_df["Survived"].values
>>> features = train_df[list(columns)].values
...
>>> et_score = cross_val_score(et, features, labels, n_jobs=-1).mean()
...
>>> print("{} -> ET: {})".format(columns, et_score))
['Fare', 'Pclass'] -> ET: 0.685746352413)
```

```python

```
