# Input and Output

## Print Formatting

We've already seen the print command.

In Python 3, print is actually a function not a statement

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
>>> x = 123.45
...
>>> print 'Place my variable here: %s' %(x)
Place my variable here: 123.45
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

## Conversion Format Methods

* Convert to string

```python
>>> print 'Convert to string %r' %(123)
Convert to string 123
```

```python
>>> print 'First; %s, Second: %s, Third: %s' %('hi!', 'two', 3)
First; hi!, Second: two, Third: 3
```

```python
>>> print 'First; %s, Second: %s' %(2,2)
First; 2, Second: 2
```

```python
>>> print 'First: {x} Second: {x}'.format(x='inserted')
First: inserted Second: inserted
```

```python
>>> print 'First: {x} New: {y} Second: {x}'.format(x='inserted', y = 'two')
First: inserted New: two Second: inserted
```

## References
1. [Python Formatting](https://pyformat.info)
