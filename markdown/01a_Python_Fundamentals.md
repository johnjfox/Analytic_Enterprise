# Session 1: Crash Course on Python

## Programming Basics

**Our end goal:**

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
* Built-in functions (print, type),
* Strings and Quotes
* Flow of Control

**Python Basics Pt 2**

* Lists
* Extending Python by Importing Packages
* Objects and Methods
* Tab Completion
* Getting help

## Numbers

Python has various "types" of numbers (numeric literals). We'll mainly focus on integers and floating point numbers.

* Integers are just whole numbers, positive or negative. For example: 2 and -2 are examples of integers.

* Floating point numbers in Python are notable because they have a decimal point in them, or use an exponential (e) to define the number. For example 2.0 and -2.1 are examples of floating point numbers. 4E2 (4 times 10 to the power of 2) is also an example of a floating point number in Python.

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
```

So what happened here? By default, Python has a specific order in which it will execute operations. As a rule, it will perform multiplication before addition.
In these final examples, the parentheses are introduced to force the expression "3 + 4" to be executed first. If you are completely new to programming, this can be a bit confusing and I recommend that you take a look at the Python documentation for more detail on the order in which operations are executed.

## Assigning Variables

If we could only use Python as a calculator to evaluate expressions, then we'd be pretty limited in terms of the types of problems that we could solve. As a first step in moving towards more interesting computations, We can store results by assigning a label, or a variable name, to our results as we move along. For example, let's say that we want to store the value "10" using a variable named "a".

Python does this as:

```python
>>> a = 10
```

Try it in the cell below:

```python

```

If you typed that in exactly as shown, then you shouldn't have gotten any type of output. There are a couple of ways in which we can test whether or not, the variable was actually set though.

First, you can simply evaluate a cell with the name of the variable:

```python
>>>  a
```

Alternatively, you can use the "print" function in python which will evaluate an expression (in this case the variable) and print the results to the screen. In Python 2, the syntax for this is:

```python
>>>  print a
```

Try both techniques here so you can verify that the variable **a** was set to 10:

```python

```

In terms of creating variable names, there are some rules on what's allowable:

    1. Names can not start with a number.
    2. There can be no spaces in the name
    3. Can't use any of these symbols :'",<>/?|\()!@#$%^&*~-+

Using variable names can be a very useful way to keep track of different variables in Python. For example:

    1. It's considered best practice that the names are lowercase.
    2. Also, if you need to create a long name, maybe comprised of several words string together, Python best practice is to connect these words using underscores. e.g. this_is_johns_variable

## Review

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

* Double quotes or single quotes
* Index from 0
* Slicing
* Does not include the right index "up to but not including"
* Include everything
* Negative indexing
* frequency / step size / reversing a sting using a -1 step size

### String Properties
Strings are immutable, i.e. once they are created, they can't be changed or replaced.
Concatenation using +
Duplication using *

### String methods
Actions on the objects themselves

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
'Hello worldHello world'
```

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

```python
>>> s.find('l')
2
```

```python
>>> s.split('e')
['h', 'llo']
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

## Index and Slicing

* Works just like strings
* can do list concatenation

* no fixed sizes in list
* no type constraints on contents

## Methods

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

## List Comprehensions

```python
>>> first_column = [row[0] for row in matrix]
```

```python
>>> first_column
```

# Dictionaries

A dictionary is basically a mapping between objects. What we've seen so far are sequences, objects where we can index them based on their position. keys must be unique

```python
>>> my_dict = {'key1': 'value', 'key2': 'value2'}
```

```python
>>> my_dict
{'key1': 'value', 'key2': 'value2'}
```

```python
>>> my_dict['key1']
```

```python
>>> my_dict = {'key1': 'value', 'key2': 123, 'key3': [1,2,3]}
```

```python
>>> my_dict['key1']
```

```python
>>> my_dict['key3']
```

```python
>>> my_dict['key3'].pop()
```

```python
>>> my_dict
```

```python
>>> my_dict['key1'].upper()
```

```python
>>> my_dict
```

```python
>>> my_dict['key2'] *= 2
```

```python
>>> my_dict
```

```python
>>> d = {}
>>> d
```

```python
>>> d['animal'] = 'Dog'
>>> d['answer'] = 42
```

```python
>>> d
```

```python
>>> d = {'k1': {'nestKey': {'subnest': 'value'}}}
```

```python
>>> d
```

```python
>>> d['k1']
```

```python
>>> d['k1']['nestKey']['subnest'].upper()
```

```python
>>> d = {}
```

```python
>>> d['k1'] = 1
>>> d['k2'] = 2
>>> d['k3'] = 3
```

```python
>>> d
```

```python
>>> d.keys()       # note the order. Dictionaries do not guarantee any order
```

```python
>>> d.values()
```

```python
>>> d.items()       # this returns tuples of all of the dictionary key-value pairs
```

# Tuples

Similar to lists but immutable

```python
>>> t = (1,2,3)
```

```python
>>> t
(1, 2, 3)
```

```python
>>> len(t)
3
```

```python
>>> t[1]
2
```

```python
>>> t = ('one', 2)
```

```python
>>> t[0]
'one'
```

```python
>>> t[1]
2
```

```python
>>> t[-1]
2
```

```python
>>> t.index('one')
0
```

```python
>>> t.count('one')
1
```

```python
>>> t = (1,1,2,3)
```

```python
>>> t.count(1)
2
```

Tuples are immutable

```python
>>> l = [1,2,3]
```

```python
>>> l
[1, 2, 3]
```

```python
>>> t = (1,2,3)
```

```python
>>> l[0] = 'string'
```

```python
>>> l
['string', 2, 3]
```

```python
>>> t[0] = 'string'
```

# Files

Python uses a file object to interact with the files on your disk drive

```python
>>> ls
01a_jupyter_notebooks.ipynb  02b_input_and_output.ipynb  Untitled1.ipynb
01b_fundamentals.ipynb	     'Notebook Basics.ipynb'	 data/
02a_dataframes.ipynb	     Untitled.ipynb		 images/
```

```python
>>> file = open('data/test.txt')
```

```python
>>> file.read()
```

```python
>>> file.read()
```

```python
>>> file.seek(0)
```

```python
>>> file.read()
```

```python
>>> file.seek(0)
```

```python
>>> file.readlines()     # stores list entirely in memory. Could be problematic
```

```python
>>> %%writefile new.txt
... First line
... Second line
```

```python
>>> for line in open('new.txt'):
...     print line
```

# Sets

An unordered collection of *unique* objects

```python
>>> x = set()
```

```python
>>> x.add(1)
>>> x
{1}
```

```python
>>> x.add(2)
>>> x
{1, 2}
```

```python
>>> x.add(1)
>>> x
{1, 2}
```

```python
>>> # can use the set function to cast a list into a subset of unique elements
... l = [1,1,1,2,2,2,2,2,3,3,3,3]
>>> print l
[1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3]
```

```python
>>> set(l)
{1, 2, 3}
```

# Booleans

True / False / None

```python
>>> a= True
```

```python
>>> # can be created as the results on conditional operators
```

```python
>>> b= None   # essentially a place holder
```

```python
>>> b
```

### Using built-in functions to create an expression
If we want to use other mathematical functions, such as trigonometric functions or
essentially anything more complex than arithmetic, then we'll need to import the functions from Python's **math** package.

By itself, the core Python language is pretty simple. Fortunately, however, there are an enormous number of packages which are available which incorporate additional functionality. We'll come back to this later in more detail, but for now let's just introduce this concept so that we can use
