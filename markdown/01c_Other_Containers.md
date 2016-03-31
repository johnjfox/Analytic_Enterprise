
# Crash Course on Python for Data Analysis

## Where We're Headed
**Our End Goal:**

* Input data
* Manipulate data until it's in the form we want
* Produce a compelling graphic

**Jupyter Notebook Basics**

* Entering and executing Python
* Documenting what you've done

**Python Basics Pt 1**

* Numbers and Calculations
* Comments
* Assignments
* Extending Python by Importing Packages
* Strings, Lists, and Tuples
* Dictionaries and Sets

**Python Basics Pt 2**

* Booleans
* Flow of Control

**Python Basics Pt 3**

* Input and Output

===============================

## Dictionaries

A dictionary is basically a mapping between objects. What we've seen so far are sequences, objects where we can index them based on their position. A dictionary allows us to look up data based upon a "key". You can think of this as being analogous to a real dictionary. There, we look up a word, which is the "key" for searching the dictionary, and obtain the definition (among other things). Here, we use the key to retrieve information, but instead of just the definition, we can store any class of information.

Creating a dictionary is straightforward. We simple create a collection of what's called key-value pairs. Here, the "key" will be the information we use to perform our lookup and the "value" will be the information we get back. The general form we will be
    
    dict = { 
             'key1': value, 
             'key2': value2
           }

A few things to keep in mind:

* It's pretty common to use a string or an integer as the `key`, but there are other things that can be used as the key too. For instance, later in this notebook we'll be introduced to Tuples, which can be used as a key.
* Same thing for the `value`; it can be any Python object
* One important restriction though: every key **must** be unique.
* Unlike a list, you can't rely on the order that that data is stored
* We can't retrieve the keys by searching for the values. In other words the order in which we set these up matters.

Let's create a simple dictionary that we can practice with. Just to get started, let's imagine that we want to keep track of a few books and that the most natural way to do so is by author.

```python
>>> authors = {'Shakespeare': 'Hamlet', 'Hemingway': 'The Old Man in the Sea'}
>>> print authors
{'Hemingway': 'The Old Man in the Sea', 'Shakespeare': 'Hamlet'}
```

```python
>>> # We can access the information by passing the name of the key as follows:
... # for instance is we want to retrieve the data associated with the key 'Shakespeare'
... authors['Shakespeare']
'Hamlet'
```

```python
>>> # We can also set the values using the same approach
... authors['Shakespeare'] = 'Macbeth'
>>> print authors
{'Hemingway': 'The Old Man in the Sea', 'Shakespeare': 'Macbeth'}
```

```python
>>> # finally we can easily add new values
... authors['Seuss'] = 'Green Eggs and Ham'
>>> print authors
{'Hemingway': 'The Old Man in the Sea', 'Shakespeare': 'Macbeth', 'Seuss': 'Green Eggs and Ham'}
```

```python
>>> # as mentioned above, the values can be any type of object
... my_dict = {'key1': 'value', 'key2': 123, 'key3': [1,2,3]}
```

### Methods and Recipes

**Basic Methods**

```python
>>> # we can access a list of the values
... authors.values()
['The Old Man in the Sea', 'Macbeth', 'Green Eggs and Ham']
```

```python
>>> # we can access a list of the keys
... authors.keys()
['Hemingway', 'Shakespeare', 'Seuss']
```

```python
>>> # we can access a list of all of the items as a list of tuples, where the first element is the key
... authors.items()
[('Hemingway', 'The Old Man in the Sea'),
 ('Shakespeare', 'Macbeth'),
 ('Seuss', 'Green Eggs and Ham')]
```

**Nesting Dictionaries**

One thing that you may find useful is to nest your dictionaries. This will allow you to create a hierarchy of data which may be especially handy if your trying to keep track of a complex set of information. Since dictionary values can be any class of Python object, they can also be a dictionary, which allows us to do things like this:

```python
>>> nested = {'k1': {'nestKey': {'subnest': 'value', 'subnest2': 'value2'}}}
>>> print nested
{'k1': {'nestKey': {'subnest': 'value', 'subnest2': 'value2'}}}
```

```python
>>> nested['k1']
{'nestKey': {'subnest': 'value', 'subnest2': 'value2'}}
```

```python
>>> nested['k1']['nestKey']['subnest']
'value'
```

```python
>>> nested['k1']['nestKey']['subnest2']
'value2'
```

## Sets

Finally a `Set` is an unordered collection of *unique*, immutable objects.

```python
>>> # we can create a set directly from a list
... fruit = set(['apple', 'banana', 'orange', 'grape'])
>>> print fruit
set(['orange', 'grape', 'apple', 'banana'])
```

```python
>>> # or we can build it up piece by piece
... more_fruit = set()
>>> more_fruit.add('mango')
>>> more_fruit.add('pineapple')
>>> print more_fruit
set(['mango', 'pineapple'])
```

```python
>>> # notice that each element must be unique
... more_fruit = set()
>>> more_fruit.add('mango')
>>> more_fruit.add('pineapple')
>>> print 'Initially: ', more_fruit
...
>>> more_fruit.add('pineapple')
>>> print 'After we added more pineapple: ', more_fruit
Initially:  set(['mango', 'pineapple'])
After we added more pineapple:  set(['mango', 'pineapple'])
```

### Methods and Recipes

We can perform the typical set operations on Python `Set` collections, including

* test that an element is in the set
* take the union of two sets
* take the intersection of two sets
* take the difference of two sets

in addition, we can use them to simplify other operations, like identifying the unique elements in a list.

**Set Functions**

```python
>>> # let's create some sets to play with
... fruit = set(['apple', 'banana', 'orange', 'grape'])
...
>>> # try various combination to test the set membership function
... print 'Apple is a fruit: ', 'apple' in fruit
>>> print 'Mango is a fruit: ' , 'mango' in fruit
>>> print 'Tomato is not a fruit: ', 'tomato' not in fruit
Apple is a fruit:  True
Mango is a fruit:  False
Tomato is not a fruit:  True
```

```python
>>> # let's create some sets to play with
... fruit = set(['apple', 'banana', 'orange', 'grape'])
>>> more_fruit = set(['mango', 'pineapple', 'grape'])
...
>>> print fruit.union(more_fruit)
set(['mango', 'grape', 'apple', 'pineapple', 'orange', 'banana'])
```

```python
>>> # let's create some sets to play with
... fruit = set(['apple', 'banana', 'orange', 'grape'])
>>> more_fruit = set(['mango', 'pineapple', 'grape'])
...
>>> print fruit.intersection(more_fruit)
set(['grape'])
```

```python
>>> # let's create some sets to play with
... fruit = set(['apple', 'banana', 'orange', 'grape'])
>>> more_fruit = set(['mango', 'pineapple', 'grape'])
...
>>> print fruit.difference(more_fruit)
set(['orange', 'apple', 'banana'])
```

**Casting a list into a set of unique elements**

```python
>>> # can use the set function to cast a list into a subset of unique elements
... l = [1,1,1,2,2,2,2,2,3,3,3,3]
>>> print 'The list = ', l
...
>>> unique = set(l)
...
>>> print 'The unique elements = ', unique
The list =  [1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3]
The unique elements =  set([1, 2, 3])
```
