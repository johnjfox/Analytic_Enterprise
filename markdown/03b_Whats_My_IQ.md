## The Boilerplate

```python
>>> %matplotlib inline
```

```python
>>> from scipy.stats import norm
>>> import matplotlib as mpl
>>> import matplotlib.pyplot as plt
>>> import numpy as np
...
>>> mpl.style.use('fivethirtyeight')
```

## The IQ test

You may not know this, but IQ's are set up so that they are normally distributed with an average of 100 and a standard deviation of 15. So what does the Empirical Rule tell us about IQ's?

Well, an IQ of 115 is one standard deviation above the mean, which means that about 16% of the population will have IQs higher than 115. Similarly, using the empirical rule only 2.5% will exceed 130.

```python
>>> #initialize a normal distribution with frozen in mean=-1, std. dev.= 1
... rv = norm(loc = 100, scale = 15.0)
...
>>> x = np.arange(25,175, 1)
>>> x2 = np.arange(115,175, 1)
>>> x3 = np.arange(130,175, 1)
...
>>> #plot the pdfs of these normal distributions
... plt.figure(figsize=(8,6))
>>> plt.fill_between(x, rv.pdf(x), color='r',alpha=0.25)
>>> plt.fill_between(x2, rv.pdf(x2), color='blue',alpha=0.25)
>>> plt.fill_between(x3, rv.pdf(x3), color='black',alpha=0.5)
```

## Generate Your IQ

```python
>>> import numpy as np
...
>>> iq = round(np.random.normal(loc=100,scale=15))
...
>>> print iq
86.0
```

## Submissions

Please send me your IQ, but entering it into the form at:

[Submit my IQ](http://goo.gl/forms/iBlA40CuKh)

To prevent people from providing multiple entries, you'll need to be logged in to your google account.
