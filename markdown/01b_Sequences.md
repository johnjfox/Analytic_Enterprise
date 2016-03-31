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

A string is basically a collection of characters with some special methods that perform operations which we tend to expect, like capitalization.

**String Creation**

```python
>>> # We can create a string using single quotes
... s = 'Hello world'
>>> print s
Hello world
```

```python
>>> # We can create a string using double quotes
... s = "Hello world"
>>> print s
Hello world
```

```python
>>> # This is convenient for instances where we might want to mix the two
... s = "This is John's world"
>>> print s
This is John's world
```

**String Concatenation**

```python
>>> # We can concatenate two strings using the `+` operator
... print s + ' there'
This is John's world there
```

**String Duplication**

```python
>>> # We can duplicate a string using the `*` operator
... print s*2
This is John's worldThis is John's world
```

**Indexing**

We can access the contents of a string by directly refering to the location of a character within a string uing indices. Take some time to understand what we can do with indices, since Python is consistent in its use of indexing across all of the objects that can be indexed and, by extension, many of the libraries we'll be using. In general, indexing is used as follows:

    string[lowerIndex : upperIndex]

    
will return all of the characters from `lowerIndex` up to but not including `upperIndex`. Optionally, we can add a third indexing argument which determines the step size

    string[lowerIndex : upperIndex : step]

```python
>>> # First thing to note is that the index of the first character in the string is considered to have index `0`
... s = "This is John's world"
>>> s[0]
'T'
```

```python
>>> # We can use a colon `:` to create a range of indices.
... # In this example, we'll get all of the characters beginning with the lower index up to, but not including, the
... # higher index
... s[0:7]
'This is'
```

```python
>>> # We can use the optional step size, which by default is 1
... s[0:7:1]
'This is'
```

```python
>>> # We can use the optional step size, which by default is 1
... s[0:7:2]
'Ti s'
```

```python
>>> # By using a negative index, we count from the end of the string
... s[-3:]
'rld'
```

```python
>>> # finally, we can use a negative step size to iterate backwards through the string
... s[::-1]
"dlrow s'nhoJ si sihT"
```

### Methods and Recipes
There are far too many methods available for manipulating strings to capture them all here. I strongly suggest that you ook at the Python documentation to get a quick sense for everything that you can do. In the meantime, here are some methods and recipes that you'll run into frequently.

**Determine The Length Of A String**

```python
>>> len('Hello world!')
12
```

**Manipulate the String**

```python
>>> 'hello'.upper()
'HELLO'
```

```python
>>> 'hello'.capitalize()
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

Creating a list is straightforward. We simple create a collection of objects. The general form we will be

The general form we will be
    
    list = [ 
             value1, 
             value2
           ]

As we'll see, in a lot of important ways, lists and strings are actually quite similar although strings are limited to containing characters whereas lists are much more flexible.

**Creation**

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

**Creating a List Using `range()`**

Python 2 has a convenience function which will create list for us consisting of a range of numbers. The form of this function is
    
    range(start, stop, step)
    
and they work pretty much the same way that indices work. This particular function will prove to be quite useful later on when we talk about iteration.

```python
>>> # the default configuration will create a list of numbers ranging from 0 to the 'stop'
... # with a step size of 1
... print range(10)
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```

```python
>>> print range(3,10)
[3, 4, 5, 6, 7, 8, 9]
```

```python
>>> print range(3,10,2)
[3, 5, 7, 9]
```

**Concatenate**

Concatenation of lists is performed in the same way as concatenation of strings.

```python
>>> # Concatenate lists
... list_one = [1,2,3]
>>> list_two = ['a', 'b', 'c']
...
>>> list_concatenated = list_one + list_two
...
>>> print list_concatenated
[1, 2, 3, 'a', 'b', 'c']
```

```python
>>> stack = []
>>> stack + ['a']
['a']
```

**Duplicate**

List duplication is performed the same way as duplication of strings

```python
>>> # List duplication
... my_list = ['string', 23, 1.234, '0']
>>> print my_list*2
['string', 23, 1.234, '0', 'string', 23, 1.234, '0']
```

**Indexing**

Indexing on lists is performed the same way as indexing on strings and it won't be repeated here.

### Methods and Recipes

**Determine The Length Of A List**

```python
>>> my_list = [1, 2, 3, 4, 5, 6]
>>> len(my_list)
6
```

**Append An Item To The End Of A List**

```python
>>> # Lists also have a method called `append()` which allows us to append a single value onto the end of the list
... # Append single item onto a list
... l = [1,2,3]
>>> l.append('append me')
>>> print l
[1, 2, 3, 'append me']
```

**Pop An Item Off Of A List**

```python
>>> # The `pop()` method will return the value with the highest index.
... # It has the side effect of removing this same item from the list
... my_list = [1, 2, 3, 4, 5, 6]
>>> x = my_list.pop()
>>> print 'The item popped = ', x
>>> print 'The list afterwards = ', my_list
The item popped =  6
The list afterwards =  [1, 2, 3, 4, 5]
```

```python
>>> # Optionally, the `pop()` method takes an integer argument which specifies the index
... # of the element to "pop" off of the list
... my_list = [1, 2, 3, 4, 5, 6]
>>> x = my_list.pop(2)
...
>>> print 'The item popped = ', x
>>> print 'The list afterwards = ', my_list
The item popped =  3
The list afterwards =  [1, 2, 4, 5, 6]
```

```python
>>> l.pop()
'append me'
```

```python
>>> print l
[1, 2, 3]
```

**Reverse a List**

```python
>>> # reverse the list in place
... new_list = ['a', 'e', 'x', 'b', 'c']
...
>>> new_list.reverse()
>>> print new_list
['c', 'b', 'x', 'e', 'a']
```

**Sort a List**

```python
>>> # sort the list in place
... new_list = ['a', 'e', 'x', 'b', 'c']
...
>>> new_list.sort()
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
Question: how would you use only the bracket notation to retrieve the '6' from the array we just created?
</div>

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
([1, 2, 3], 'one', 2, 'one')
```

```python
>>> # Access an element of a tuple. Like lists, the indexing is zero-referenced
... t = ([1,2,3], 'one', 2, 'one')
>>> print t[0]
[1, 2, 3]
```

```python
>>> # We can do all of the same indexing as we did with lists
... t = ([1,2,3], 'one', 2, 'one')
>>> print t[1:3]
('one', 2)
```

```python
>>> # We can also index them from from the last element backswards by using negative numbers
... t = ([1,2,3], 'one', 2, 'one')
>>> t[-1]
'one'
```

```python
>>> # Determine the length of the tuple
... len(t)
4
```

```python
>>> # we can determine the first index of a value
... t = ([1,2,3], 'one', 2, 'one')
>>> t.index('one')
1
```

```python
>>> # we can count the number of instances of a value
... t.count('one')
2
```

## Exercises

<div class="alert alert-success">
<b>QUESTION:</b> What do `Strings`, `Lists` and `Tuples` all have in common?
</div>

<div class="alert alert-success">
<b>EXERCISE:</b>
<p>Take the following Python code that stores a string:</p>
<p></p>
<center>str = 'X-DSPAM-Confidence:  0.8475'</center>
<p></p>
<p>Use find and string slicing to extract the portion of the string after the colon character and then use the float function to convert the extracted string into a floating point number. </p>
</div>

```python
>>> # build your solution here
... str = 'X-DSPAM-Confidence: 0.8475'
```

<div class="alert alert-success">
<b>EXERCISE:</b>
<p>Take the following comma delimited string:</p>
<p></p>
<center>str = 'John, Doe, 123 Main Street, New York City, NY, 01234'</center>
<p></p>
<p>Use string methods to decompose the string into distinct fields corresponding to the text between the commas. After you have this decomposition, create a Tuple containing all of the data</p>
</div>

```python
>>> # build your solution here
... str = 'John, Doe, 123 Main Street, New York City, NY, 01234'
```
