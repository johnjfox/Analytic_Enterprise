# Input and Output

## Reading Text Files

Note: this notebook deals only with text files. There will be examples of dealing with structured files (e.g. CSV files or Microsoft Excel files) in the Pandas notebooks.

Python uses a `file` object to interact with the files on your disk drive. In general, you'll need to establish access to the file by passing a path to the `open()` function.

```python
>>> file = open('../data/sillyText/new.txt')
```

Having done that, we can then read the file into memory as a string.

```python
>>> file.read()
"The first line in a text file is always the best. Here's sentence tw on that same line. It's wonderfully written.\nThe second line is generally a let down.\nCouldn't tell you about the third line. I never get that far.\n"
```

If we continue to read once we get to the end of the file when we'll get back an empty string. One thing to note: there is a difference between the end of file (which is represented as an empty string) and an empty line within the file (which is represented by the character '\n')

```python
>>> file.read()
''
```

We can go back to the beginning of the file by using the `seek()` method on the file object.

```python
>>> file.seek(0)
```

having gone back to the beginning we can read the file again.

```python
>>> file.read()
"The first line in a text file is always the best. Here's sentence tw on that same line. It's wonderfully written.\nThe second line is generally a let down.\nCouldn't tell you about the third line. I never get that far.\n"
```

In addition to reading the entire file, we can read the all of the lines one by one. In this case, we'll get a list of strings. Again, be careful because a large file may consume a lot of memory.

```python
>>> file.seek(0)         # reset to the beginning of the file
>>> file.readlines()     # stores list entirely in memory as a list of strings. Could be problematic
["The first line in a text file is always the best. Here's sentence tw on that same line. It's wonderfully written.\n",
 'The second line is generally a let down.\n',
 "Couldn't tell you about the third line. I never get that far.\n"]
```

One approach for dealing with this would be to read the lines one by one using `readline()`.

```python
>>> file = open('../data/sillyText/new.txt')
>>> for line in file.readlines():
...     print line
The first line in a text file is always the best. Here's sentence tw on that same line. It's wonderfully written.

The second line is generally a let down.

Couldn't tell you about the third line. I never get that far.
```

## Print Formatting

### Old Style Print Formatting

We've already seen the print command.

```python
>>> print 'This is a string'
This is a string
```

```python
>>> x = 'String'
...
>>> print 'Place my variable here: ' + x
Place my variable here: String
```

```python
>>> x = 'String'
...
>>> print 'Place my variable here: %s' %(x)
Place my variable here: String
```

```python
>>> print 'Place my variable here: %s' %(13.145)
Place my variable here: 13.145
```

```python
>>> print 'Floating point number: %1.2f' %(13.145)
Floating point number: 13.14
```

```python
>>> print 'Floating point number: %1.3f' %(13.145)
Floating point number: 13.145
```

```python
>>> print 'Floating point number: %1.1f' %(13.145)
Floating point number: 13.1
```

```python
>>> print 'Floating point number: %1.10f' %(13.145)
Floating point number: 13.1450000000
```

```python
>>> print 'Floating point number: %25.10f' %(13.145)
Floating point number:             13.1450000000
```

### New Style Print Formatting

The built-in string class provides the ability to do complex variable substitutions and value formatting via the format() method.  repeating the previous examples, we get the following:

```python
>>> print 'This is a string'
This is a string
```

```python
>>> x = 'String'
...
>>> print 'Place my variable here: {}'.format(x)
Place my variable here: String
```

```python
>>> print 'Place my variable here: {}'.format(13.145)
Place my variable here: 13.145
```

```python
>>> print 'Floating point number: {:1.2f}'.format(13.145)
Floating point number: 13.14
```

```python
>>> print 'Floating point number: {:1.3f}'.format(13.145)
Floating point number: 13.145
```

```python
>>> print 'Floating point number: {:1.1f}'.format(13.145)
Floating point number: 13.1
```

```python
>>> print 'Floating point number: {:1.10f}'.format(13.145)
Floating point number: 13.1450000000
```

```python
>>> print 'Floating point number: {:25.10f}'.format(13.145)
Floating point number:             13.1450000000
```

## Some other useful "new style" functions

**Named arguments**

```python
>>> print 'First: {x} Second: {x}'.format(x='inserted')
First: inserted Second: inserted
```

## References
1. [Python Formatting Primer](https://pyformat.info)
2. [Old Style Formatting](https://docs.python.org/2/library/stdtypes.html#string-formatting)
3. [New Style Formatting](https://docs.python.org/3/library/string.html#string-formatting)
