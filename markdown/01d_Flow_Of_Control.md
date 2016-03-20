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

## Booleans and Comparison Operators

**Booleans**

An important class of objects in Python is used to represent the notion of a "Boolean", i.e. something which can take on the value `True`, `False`, or `None`. A few things to note here: 

* First, each of the Boolean values are case sensitive, i.e. `True` is not the same as `TRUE`. 
* As it turns out, `True` is exactly equal to `1` and `False` is exactly equal to `0`. You might find this useful at some point in your programs.

**Comparison Operators**

Comparison operators compare the results of two expressions and return a Boolean value.

| Operator | Description | 
| :---: | :---: | 
|  ==    | Compares the equality of two expressions    |
|  !=    | Compares the inequality of two expressions    |
|  >    | Compares if the left hand expression is greater than the right hand    |
|  <    | Compares if the left hand expression is less than the right hand    |
|  >=    | Compares if the left hand expression is greater than or equal to the right hand    |
|  <=  | Compares if the left hand expression is less than or equal to than the right hand    |
|  `in`  | Determines if the result of the left hand expression is contained in the sequence on the right.    |

We can also combine some of these in interesting ways, for instance, the compound statement `10 <= x <= 20` will test if x is in the range from 10 to 20, inclusive.

Let's put together a few examples to see how some of this works.

``` python
>>> # a very simple comparison
>>> print 10 == 10
True
```

``` python
>>> # a compound expression testing that a variable is within an interval
>>> x = 15
>>> print 10 <= x <= 20
True
```

```python
>>> # an example of using the membership test
>>> list = ['a', 'b' ,'c']
>>> print 'a' in list
True
```

```python
>>> list = ['a', 'b' ,'c']
>>> print 'z' in list
False
```

**Logical Operators**

Logical operators provide a mechanism for combining `Boolean` variables to create more complex logical statements. There are three types: conjunctions, disjunctions, and negations, representing the logical notions of "and", "or" and "not". Through combinations of these three operators, it's possible to create any logical statement you'd like.

**Conjunction: A Logical "AND"**

```python
>>> A = True
>>> B = False
>>> print [A and B, A and A, B and B, B and A]
[False, True, False, False]
```

**Disjunction: A Logical "OR"**

```python
>>> A = True
>>> B = False
>>> print [A or B, A or A, B or B, B or A]
[True, True, False, True]
```

**Negation: A Logical "NOT"**

```python
>>> A = True
>>> B = False
>>> print [not A, not B]
[False, True]
```

## Flow of Control
Finally, let's talk about how we can control the flow of execution in our programs. Until this point, we've largely focused on sequentially executing one line of code at a time. Although that's a great building block, we're generally going to need to be able to do more. For instance, we may only want to execute some set of code if a condition is met. Or, you could imagine wanting to execute a block of code many times. In this section, we shift our attention towards how we might accomplish these tasks.

### Conditional Statements
At a high, pseudo-code level, you could imagine wanting to do the following:

	If Some Condition is True Then 
		Execute This Block of Code
	Else 
		Execute Some Other Block of Code

As it turns out, actually implementing this in Python is not terribly different from the way we'd imagine. First, we can implement the `Some Condition is True` piece through any expression that returns a Boolean value, such as one of the comparison operators we discussed a few moments ago.

Before we jump into an example, here's one thing to notice about Python that may come as a surprise if you ever used a different programming language. When we want to define a block of code, all we need to do is to indent it. No need for pairs of matching braces or anything else. Just indentation. Obviously that can be a good thing or a bad thing. It's a really good thing in the sense that it makes perfect sense by any rational standard. It's a bad thing in the sense that it's not the way that many other programming language work, so if you're not used to it then it may be confusing or even feel as though it's incorrect.

```python
>>> # Let's create a variable that we can use for our conditional
... test = True
...
>>> # Create a variable so we can track the execution of the code
... x = 10
>>> print 'Before: x = ', x
...
>>> # run our simple "if" statement
... if test:
...     x = 20      # we satisfied the condition of the if statement
>>> else:
...     x = 30      # we failed to satisfy the condition of the if statement
...
>>> # let's see what happened
... print 'After:  x = ', x
Before: x =  10
After:  x =  20
```

### Break Statements

Sometimes we have reason to want to break out of a loop before we complete all of the iterations described in the `for` statement. The `break` statement allows us to do just that. Specifically, it will allow us to interrupt the execution of a loop, usually because some condition has been met. Once triggered, the script will continue execution immediately outside the loop which was just broken. 

```python
>>> # Create a variable so we can track the execution of the code
... list = ['a', 'b', 'c', 'd', 'e']
...
>>> print "let's start"
...
>>> # let's iterate through the list, printing each element
... for l in list:
...     if (l == 'c'):
...         print "before the break"
...         break
...         print "after the break"
...     else:
...         print l
...
>>> print "and we're done"
```

Notice what happened right there. As soon as the condition ` if (l == 'c'):` was satisfied, the script began to execute that innermost block of code. It was able to execute the first `print` statement, but immediately upon reaching the break, it exited the `for` loop and continued execution. In this case, that resulted in the final print statement before the program exited.

### Continue Statements

If you understood the `break` command, then `continue` should make a lot of sense. In the same way that we can short circuit the execution the flow of a loop using `break` and half the execution, we can use `continue` to skip some of the processing for a particular iteration through the loop. Again, this is more easily seen than explained:

```python
>>> # Create a variable so we can track the execution of the code
... list = ['a', 'b', 'c', 'd', 'e']
...
>>> print "let's start"
...
>>> # let's iterate through the list, printing each element
... for l in list:
...     if (l == 'c'):
...         print "before the continue"
...         continue
...         print "after the continue"
...     else:
...         print l
...
>>> print "and we're done"
let's start
a
b
before the continue
d
e
and we're done
```

### While Statements

And finally, we can loop over a block of code for as long as some condition is true. Again using our high level "pseudo-code" to understand what we mean by this:

	While Some Condition is True 
		Execute This Block of Code
        
If you've been working through this entire notebook, then this will be reminiscent of the for loop. Whereas before we iterated on a block of code until we exhausted all of a list, now, we iterate while some more general condition holds true. Be careful with this though. Unless something takes place to affect the condition that you're check for (usually in the block of code that you're looping over), you can get stuck in a situation called an "endless loop" which is pretty much what it sounds like: a situation where you get stuck for ever looping over this block of code. If that happens, then the easiest solution is to restart the Jupyter server kernel (under the Kernel menu).

Having seen how `for` loops work, you'll see what's going on here pretty easily.

```python
>>> # let's set an initial condition
... x = 0
>>> while x < 5:
...     print x
...     x += 1
...
>>> print "and we're done"
0
1
2
3
4
and we're done
```

## References

* [The if, for and range() statements](https://docs.python.org/2/tutorial/controlflow.html)
* [The while loop](https://docs.python.org/2/reference/compound_stmts.html)
