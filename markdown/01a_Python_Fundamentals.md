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
* Strings
* Lists
* Dictionaries, Tuples and Sets

**Python Basics Pt 2**

* Booleans
* Flow of Control
* Extending Python by Importing Packages
* Objects and Methods


**Python Basics Pt 3**

* Input and Output

===============================

## Numbers

Python has various "types" of numbers (numeric literals). We'll mainly focus on integers and floating point numbers.

* Integers are just whole numbers, positive or negative. For example: 2 and -2 are examples of integers.

* Floating point numbers in Python are notable because they have a decimal point in them, or use an exponential (e) to define the number. For example 2.0 and -2.1 are examples of floating point numbers. 4E2 (4 times 10 to the power of 2) is also an example of a floating point number in Python.

Numbers can represent the following kinds of data:

* integer values
* floating point values
* complex values

## Calculations

The most basic functionality that I can imagine for using Python is to treat it as a calculator.
As a starting point, let's take a few minutes to run through the most basic arithmetic operations.
In each of the cells below, enter an expression that will return the requested results.
Remember, after you type the expression, hit <CTL>-return to execute the cell.

To get you started, here are some of the most fundamental arithmetic operations:

| Operator | Function |
|:--------:|:--------:|
| + | Addition |
| - | Subtraction |
| * | Multiplication |
| / | Division |

<div class="alert alert-info" role="alert">
You may have noticed that each of the cells in this notebook starts with a line that begins with a hashtag or "#". This hashtag tells Python that the line should be considered as a comment and shouldn't be executed.
</div>

As a quick example, let's imagine that we want to simply add two numbers, say 5 and 10. After execution, that would look like the following in Python:

```python
>>> 5 + 10
15
```

<div class="alert alert-success">
Your turn, please multiply 2 integers, say 2 and 3.
</div>

```python
>>> # create your answer to the exercise here
```

<div class="alert alert-success">
Now try dividing 2 integers, say 3 by 2 as 3/2. Pay attention to what happens.
</div>

```python
>>> # create your answer to the exercise here
```

In Python 2, when we divide two integers, we get what's called "classic" division within the Python community. We can avoid this "classic" division, by making sure that one of the numbers is a floating point number.

<div class="alert alert-success">
For example, retry our division example as 3.0 / 2. 
</div>

```python
>>> # create your answer to the exercise here
```

And, just to be clear, the order in which we use the floating point number doesn't matter. Feel free to go back and try that in one of the cells. As it turns out we can use a builtin function to force the issue by using the "float()" function to "cast" one of the integers to be a floating point number.

<div class="alert alert-success">
We'll talk more about functions in a little while, but for now convince yourself of what happens if you evaluate float(3)/2
</div>

```python
>>> # create your answer to the exercise here
```

Finally, this is probably a good time to mention that Python has rules on the order in which it will evaluate the results of operations.

```python
>>> 2 * 3 + 4
10
```

Make sure that you're comfortable with what just happened there. Generally, Python will follow the same rules that we learned a long time ago, however, to be fair some of the rules are esoteric enough that we might not remember them all. Whenever there's a doubt keep in mind that you can control the order in which operations are executed by judiciously using parentheses, for instance, try

```python
>>> 2 * ( 3 + 4 )
14
```

So what happened here? By default, Python has a specific order in which it will execute operations. As a rule, it will perform multiplication before addition.
In these final examples, the parentheses are introduced to force the expression "3 + 4" to be executed first. If you are completely new to programming, this can be a bit confusing and I recommend that you take a look at the Python documentation for more detail on the order in which operations are executed.

## Using Built-In Functions To Create An Expression
If we want to use other mathematical functions, such as trigonometric functions or
essentially anything more complex than arithmetic, then we'll need to import the functions from Python's **math** package.

By itself, the core Python language is pretty simple. Fortunately, however, there are an enormous number of packages which are available which incorporate additional functionality. We'll come back to this later in more detail, but for now let's just introduce this concept so that we can use


## Assigning Variables

If we could only use Python as a calculator to evaluate expressions, then we'd be pretty limited in terms of the types of problems that we could solve. As a first step in moving towards more interesting computations, We can store results by assigning a label, or a variable name, to our results as we move along. For example, let's say that we want to store the value "10" using a variable named "a".

Python does this as:

```python
>>> a = 10
```

Try it in the cell below:

```python
>>> # create your answer to the exercise here
```

If you typed that in exactly as shown, then you shouldn't have gotten any type of output. There are a couple of ways in which we can test whether or not, the variable was actually set though.

First, you can simply evaluate a cell with the name of the variable:

```python
>>>  a
10
```

Alternatively, you can use the "print" function in python which will evaluate an expression (in this case the variable) and print the results to the screen. In Python 2, the syntax for this is:

```python
>>>  print a
10
```

Try both techniques here so you can verify that the variable **a** was set to 10:

```python
>>> # create your answer to the exercise here
```

In terms of creating variable names, there are some rules on what's allowable:

    1. Names can not start with a number.
    2. There can be no spaces in the name
    3. Can't use any of these symbols :'",<>/?|\()!@#$%^&*~-+

Using variable names can be a very useful way to keep track of different variables in Python. For example:

    1. It's considered best practice that the names are lowercase.
    2. Also, if you need to create a long name, maybe comprised of several words strung together, Python best practice is to connect these words using underscores. e.g. `this_is_johns_variable`

<div class="alert alert-success">
Construct a series of expressions to compute the taxes you would need to pay on a typical data scientists salary. Assume the following:
<li>My income is $ 20,000,000</li>
<li>My tax rate is 30%</li>
As a simple exercise, please set up variables called my_income and my_tax_rate compute the taxes you owe using simple multiplication. Finally, print out the taxes you owe.
</div>

```python
>>> # create your answer to the exercise here
```

When you evaluate your results, you should get a result of 6000000.0.

## Strings

### Basics

* Double quotes or single quotes
* Index from 0
* Slicing
* Does not include the right index "up to but not including"
* Include everything
* Negative indexing
* frequency / step size / reversing a sting using a -1 step size

Strings are immutable, i.e. once they are created, they can't be changed or replaced.
Concatenation using +
Duplication using *

```python
>>> len('Hello world!')
12
```

```python
>>> s = 'Hello world'
```

```python
>>> s[::-1]
'dlrow olleH'
```

```python
>>> s + ' there'
'Hello world there'
```

```python
>>> s*2
'hellohello'
```

### Methods and Recipes
There are far too many methods available for manipulating strings to capture them all here. I strongly suggest that you ook at the Python documentation to get a quick sense for everything that you can do. In the meantime, here are some methods and recipes that you'll run into frequently.

```python
>>> s = 'hello'
```

```python
>>> s.upper()
'HELLO'
```

```python
>>> s.capitalize()
'Hello'
```

**Search for the first occurence of a substring**

```python
>>> # as a general rule, it will find the first occurence of any substring
... s = 'Now is the winter of our discontent, made glorious summer by this son of York'
>>> s.find('th')
7
```

```python
>>> # You'll often find that it's convenient to use `find()` to find an occurence of a specific character
... s = 'Now is the winter of our discontent, made glorious summer by this son of York'
>>> s.find(',')
35
```

```python
>>> # knowing the location of the character can allow us to do other things, such as extract a component of the string
... s = 'Now is the winter of our discontent, made glorious summer by this son of York'
>>> ch = s.find(',')
>>> print s[:ch]
Now is the winter of our discontent
```

**Split a string at the first occurence of a substring**

Although the `find()` function is handy, oftentimes we'll find that we want to split a string up and capture all of the pieces that result. We can certainly do this with `find()`, but a more convenient approach is to use `split()`

```python
>>> # Going back to our example
... s = 'Now is the winter of our discontent, made glorious summer by this son of York'
>>> s.split(',')
['Now is the winter of our discontent',
 ' made glorious summer by this son of York']
```

```python
>>> # A very typical use cas for this would be to extract the each of the components from a comma delimited string
... s = 'Fox, John'
>>> s.split(',')
['Fox', ' John']
```

**Strip off leading and trailing white space**

Now that we can split a string, you can see how we might be able to parse them to extract meaningful information. As a quick example, let's re-do that previous example and then test the results to see if the string contained my first name.

```python
>>> # let's create a string consisting of my name
... s = 'Fox, John'
...
>>> # let's use split to extract out my first name.
... # BTW, make sure that you understand exactly what's going on with this shorthand
... first_name = s.split(',')[1]
...
>>> if (first_name == 'John'):
...     print "We found John"
>>> else:
...     print "We didn't find John"
We didn't find John
```

Oops. What just happened there? Go back and look carefully at the results of the `split()` in the last recipe. We split the string at the ','. Unfortunately, Python was rather literal in the way that it did this and so it left the blank space at the beginning of ' John'. This kind of result in which we end up with a string that has one or blank space at the beginning or trailing edge of a string is extremely common. In general, however, we probably we don't want the blanks since it can lead to confusing results. For instance, in this example when we tried to test the results of the `split()` against my first name ('John'), we got back a result that was potentially confusing. The leading ` ` that is a part of `first_name` causes the test to fail.

```python
>>> # let's create a string consisting of my name
... s = 'Fox, John'
...
>>> # let's use split to extract out my first name.
... # BTW, make sure that you understand exactly what's going on with this shorthand
... first_name = s.split(',')[1]
...
>>> first_name_stripped = first_name.strip()
...
>>> if (first_name == 'John'):
...     print "We found John"
>>> else:
...     print "We didn't find John"
...
>>> print "\nWithout strip:" + first_name
>>> print "With strip:   " + first_name_stripped
We didn't find John

Without strip: John
With strip:   John
```

## Lists

```python
>>> my_list = [1,2,3]
```

```python
>>> my_list
[1, 2, 3]
```

```python
>>> my_list = ['string', 23, 1.234, '0']
```

```python
>>> len(my_list)
4
```

### Index and Slicing

* Works just like strings
* can do list concatenation

* no fixed sizes in list
* no type constraints on contents

### Methods

```python
>>> l = [1,2,3]
```

```python
>>> l.append('append me')
```

```python
>>> l
[1, 2, 3, 'append me']
```

```python
>>> l.pop()
'append me'
```

```python
>>> l
[1, 2, 3]
```

```python
>>> l.pop(0)
1
```

```python
>>> l
[2, 3]
```

```python
>>> x = l.pop(0)
```

```python
>>> x
2
```

```python
>>> l
[3]
```

```python
>>> l[99]
```

```python
>>> new_list = ['a', 'e', 'x', 'b', 'c']
```

```python
>>> new_list
```

```python
>>> new_list.reverse()
```

```python
>>> new_list
```

```python
>>> new_list.sort()
```

```python
>>> new_list
```

```python
>>> l_1 = [1,2,3]
>>> l_2 = [4,5,6]
>>> l_3 = [7,8,9]
```

```python
>>> matrix = [l_1, l_2, l_3]
```

```python
>>> matrix # nested data structures
```

```python
>>> matrix[0]
```

```python
>>> matrix[1][2]
```

### List Comprehensions

```python
>>> first_column = [row[0] for row in matrix]
```

```python
>>> first_column
```

## Dictionaries

A dictionary is basically a mapping between objects. What we've seen so far are sequences, objects where we can index them based on their position. A dictionary allows us to look up data based upon a "key". You can think of this as being analogous to a real dictionary. There, we look up a word, which is the "ley" for searching the disctionary, and obtain the definition (among other things). Here, we use the key to retrieve information, but instead of just the definition, we can store any class of information.

Creating a list is straightforward. We simple create a collection of what's called key-value pairs. Here, the "key" will be the information we use to perform our lookup and the "value" will be the information we get back. The general form we will be
    
    dict = { 'key1': value, 
             'key2': value2
           }

A few things to keep in mind:

* It's pretty common to use a string as the `key`, but we can use any Python object. This can be really handy
* Same thing for the `value`; it can be any Python object
* One important restriction though: every key **must** be unique.
* Unlike a list, you can't rely on the order that that data is stored
* We can't retrieve the keys by searching for the values. In other words the order in which we set these up matters.

Let's create a simple dictionary that we can practice with. Just to get started, let's imagine that we want to keep track of books that have been written.

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

### Methods

```python
>>> authors.values()
['The Old Man in the Sea', 'Macbeth', 'Green Eggs and Ham']
```

```python
>>> authors.keys()
['Hemingway', 'Shakespeare', 'Seuss']
```

```python
>>> authors.items()
[('Hemingway', 'The Old Man in the Sea'),
 ('Shakespeare', 'Macbeth'),
 ('Seuss', 'Green Eggs and Ham')]
```

### Other Capabilities
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

## Tuples

Similar to lists but immutable

```python
>>> t = (1,2,3)
```

```python
>>> t
```

```python
>>> len(t)
```

```python
>>> t[1]
```

```python
>>> t = ('one', 2)
```

```python
>>> t[0]
```

```python
>>> t[1]
```

```python
>>> t[-1]
```

```python
>>> t.index('one')
```

```python
>>> t.count('one')
```

```python
>>> t = (1,1,2,3)
```

```python
>>> t.count(1)
```

Tuples are immutable

```python
>>> l = [1,2,3]
```

```python
>>> l
```

```python
>>> t = (1,2,3)
```

```python
>>> l[0] = 'string'
```

```python
>>> l
```

```python
>>> t[0] = 'string'
```

## Sets

An unordered collection of *unique* objects

```python
>>> x = set()
```

```python
>>> x.add(1)
>>> x
```

```python
>>> x.add(2)
>>> x
```

```python
>>> x.add(1)
>>> x
```

```python
>>> # can use the set function to cast a list into a subset of unique elements
... l = [1,1,1,2,2,2,2,2,3,3,3,3]
>>> print l
```

```python
>>> set(l)
```
