## Hypothesis Testing

```python
>>> # We're going to plot all of the figures within the notebook, so let's set up that option
... %matplotlib inline
```

### Probability Distributions

I'm sure that this is entirely review for everyone, but let's take a moment to think about probability distributions. For most people, the distribution that may come to mind first is the Gaussian, or Normal, probability distribution.

### Gaussian Distributions

```python
>>> import numpy as np
>>> import matplotlib.pyplot as plt
>>> import matplotlib.mlab as mlab
>>> import math
...
>>> mean = 0
>>> variance = 1
>>> sigma = math.sqrt(variance)
>>> x = np.linspace(-3,3,100)
...
>>> y = mlab.normpdf(x,mean,sigma)
>>> yCum = y.cumsum()
>>> yCum /= yCum[-1]
...
>>> plt.plot(x, y, 'b', linewidth=1.5)
>>> plt.plot(x, yCum, 'r--', linewidth=1.5)
>>> plt.ylim(0, 1.05)
>>> plt.grid(True)
>>> plt.show()
```

### Empirical Distributions

Before we talk about anything else, let's stop for a moment and consider probability distributions. More specifically, let's think about our ability to estimate a probability distribution given a sample of data.

```python
>>> import numpy as np
>>> import matplotlib.pyplot as plt
>>> from   matplotlib import mlab
...
>>> mean = 200
>>> variance = 25
>>> n_bins = 50
...
>>> sigma = math.sqrt(variance)
...
>>> x = mean + sigma*np.random.randn(25)
...
>>> n, bins, patches = plt.hist(x, n_bins, normed=1, histtype='step', cumulative=True)
...
>>> # Add a line showing the expected distribution.
... y = mlab.normpdf(bins, mean, sigma).cumsum()
>>> y /= y[-1]
...
>>> # Now plot out both the expected CDF and the actual CDF
... plt.plot(bins, y, 'k--', linewidth=1.5)
>>> plt.grid(True)
>>> plt.ylim(0, 1.05)
>>> plt.title('Cumulative Distribution')
...
>>> plt.show()
```

### Empirical Distributions

### The Normal Approximation
