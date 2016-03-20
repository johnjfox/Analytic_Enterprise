# Crash Course on Python for Data Analysis

**Where We're Headed**

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

**Python Basics: Other Items**

* Input and Output

===============================
## Strings

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
>>> s = 'Hello world'
>>> print s
Hello world
```

```python
>>> s = "Hello world"
>>> print s
Hello world
```

```python
>>> s = "This is John's world"
>>> print s
This is John's world
```

```python
>>> print s + ' there'
This is John's world there
```

```python
>>> print s*2
This is John's worldThis is John's world
```

**Indexing**

We can access the contents of a string by directly refering to the location of a character within a string

```python
>>> s[0]
'T'
```

```python
>>> s[0:3]
'Thi'
```

```python
>>> s[-3:]
'rld'
```

```python
>>> s[::2]
"Ti sJh' ol"
```

```python
>>> s[::-1]
"dlrow s'nhoJ si sihT"
```

### Methods and Recipes
There are far too many methods available for manipulating strings to capture them all here. I strongly suggest that you ook at the Python documentation to get a quick sense for everything that you can do. In the meantime, here are some methods and recipes that you'll run into frequently.

```python
>>> len('Hello world!')
12
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

**Split a string at each occurence of a substring**

Although the `find()` function is handy, oftentimes we'll find that we want to split a string up and capture all of the pieces that result. We can certainly do this with `find()`, but a more convenient approach is to use `split()`.

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

A list is basically a collection of objects. They are special in a few ways:

* we can look up the contents of a list by the position within the list
* they can grow without bound
* they can contain pretty much anything we'd like them to contain

Creating a list is straightforward. We simple create a collection of what's called key-value pairs. Here, the "key" will be the information we use to perform our lookup and the "value" will be the information we get back. The general form we will be

The general form we will be
    
    list = [ 
             value1, 
             value2
           ]

As we'll see, in a lot of important ways, lists and strings are actually quite similar although strings are limited to containing characters whereas lists can contain any type of Python object.

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

### Methods and Recipes

```python
...
>>> l = [1,2,3]
>>> l.append('append me')
>>> print l
[1, 2, 3, 'append me']
```

```python
>>> # The `pop()` method will return the value with the highest index. It has the side effect of
... l.pop()
'append me'
```

```python
>>> l + 1
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
[1, 2, 3]
```

**Using a list as a stack**

- What is a stack
- Push down
- last in first out

```python
>>> stack = []
>>> stack + ['a']
['a']
```

```python
>>> new_list = ['a', 'e', 'x', 'b', 'c']
>>> print new_list
['a', 'e', 'x', 'b', 'c']
```

```python
>>> # reverse the list in place
... new_list.reverse()
>>> print new_list
['c', 'b', 'x', 'e', 'a']
```

```python
>>> # sort the list in place
... new_list.sort()
>>> print new_list
['a', 'b', 'c', 'e', 'x']
```

**Creating a 2D list, or an array**

Although we'll tend to use the capabilities of a special purpose library for handling our tables and arrays, it's worth noting that we can easily take advantage of Python's ability to create a list arbitrary objects in order to create a 2D (or higher dimensioned) array.

Let's say for the same of argument that we want to create a representation of the following array:

$$
\left( \begin{array}{ccc}
1 & 2 & 3 \\
4 & 5 & 6 \\
7 & 8 & 9 \end{array} \right) 
$$

There are several ways to do this in Python, but let's say that we are limiting ourselves to an approach based upon `List` objects. One way to create this would be the following.

```python
>>> # first, let's create the rows. We don't need to do it separately, but it's a bit easier to read
... row_1 = [1,2,3]
>>> row_2 = [4,5,6]
>>> row_3 = [7,8,9]
...
>>> # now, let's form an array by collecting each of these rows into a
... # contained list to form the array
... matrix = [row_1, row_2, row_3]
>>> print matrix
[[1, 2, 3], [4, 5, 6], [7, 8, 9]]
```

By creating a "list of lists" we have created a representation of an array.

<div class="alert alert-success">
Exercise: how would you use only the bracket notation to retrieve the '6' from the array we just created?
</div>

### List Comprehensions

One thing that we can do to lists which will prove to be convenient is to perform a "list comprehension". A list comprehension is....

```python
>>> first_column = [row[0] for row in matrix]
>>> print first_column
[1, 4, 7]
```

## Tuples

Tuples are very similar to lists, but have the following differences:

* You can't add elements to a tuple. Tuples have no append or extend method.
* You can't remove elements from a tuple. Tuples have no remove or pop method.
* You can find elements in a tuple, since this doesnt change the tuple.
* You can also use the in operator to check if an element exists in the tuple.

In other words, Tuples are what's called "immutable" which is to say we can't change them. Why do we care if an object is immutable. For one thing, sometimes we simply have no choice: the person that developed the library has forced us to use immutable objects. Besides that, though, it makes your code safer if you write-protect data that does not need to be changed. Using a tuple instead of a list is like forcing a collection of data to be constant, and requires that we used special thought to override this.

Moving away from a philosophical argument towards the more practical, some tuples can be used as dictionary keys (specifically, tuples that contain immutable values like strings, numbers, and other tuples). Lists can never be used as dictionary keys, because lists are not immutable.

Creating a tuple is straightforward. We simple create a collection of data and surround them by parentheses. The general form we will be

    tuple = ( 
             value1, 
             value2
            )

 
Tuples have many of the same methods and we can do many of the same operations on them that we can do with a list.

```python
>>> # tuples can contain arbitrary objects and the objects need not be unique
... t = ([1,2,3], 'one', 2, 'one')
>>> print t
```

```python
>>> # Access an element of a tuple. Like lists, the indexing is zero-referenced
... t = ([1,2,3], 'one', 2, 'one')
>>> print t[0]
```

```python
>>> # We can do all of the same indexing as we did with lists
... t = ([1,2,3], 'one', 2, 'one')
>>> print t[1:3]
```

```python
>>> # We can also index them from from the last element backswards by using negative numbers
... t = ([1,2,3], 'one', 2, 'one')
>>> t[-1]
```

```python
>>> # Determine the length of the tuple
... len(t)
```

```python
>>> # we can determine the first index of a value
... t = ([1,2,3], 'one', 2, 'one')
>>> t.index('one')
```

```python
>>> # we can count the number of instances of a value
... t.count('one')
```

<div class="alert alert-success">
INSERT EXERCISE HERE
</div>

<div class="alert alert-success">
What do `Strings`, `Lists` and `Tuples` all have in common?
</div>
