<!--
title: Hypothesis Testing and The Central Limit Theorem
author: "John Fox"
date: September 19, 2015
output: pdf_document
bibliography: /Users/John/.pandoc/PapersLibrary.bib
header-includes:
- \usepackage{fancyhdr}
- \usepackage{textcomp}
- \pagestyle{fancy}
- \fancyhead{}
- \fancyfoot{}
- \fancyfoot[L]{\textcopyright\em 2015 John J. Fox}
- \fancyfoot[R]{\thepage}
- \fancypagestyle{plain}{\pagestyle{fancy}}
-->

## Background
In this note, I introduce a fundamental building block for many of the concepts that we'll see throughout the rest of the semester: _the Central Limit Theorem_, which I'll abbreviate as _CLT_ from here on. In fact,  the CLT and the tools and concepts which follow are so ubiquitous in statistical analysis that after we get an understanding of what it is, what it means and how to use it, that we'll begin slowly to take it for granted. For now, though, since at least a few of us are not  comfortable with the CLT and with the related concept of statistical inferencing through hypothesis testing, we'll go through it somewhat meticulously. 

From there, we’ll introduce a particularly important application: statistical hypothesis testing. In particular, we’ll describe both the Z-test and the T-test and discuss when to use them. Finally, we’ll introduce a variation on the T-test, called the pairwise T-test, which, when it can be applied, offers some additional statistical power. 

## References
This note draws heavily from several books and references, particularly Naked Statistics [@Whe2013] and Statistics in Plain English [@Urd2010a]. Naked Statistics, in particular, is a much better written book on making statistics understandable than I could ever hope to write. 

## Why Do We Care About the Central Limit Theorem?
The CLT is based upon a fairly straightforward idea, namely that a large, properly drawn sample will resemble the population from which it is drawn.  If you were to take samples of the population over and over, then you’d see variation, but on the whole, the probability that the sample you drew would differ from the larger population isn’t very high. Why do we care? In a nutshell, the CLT allows to make some very interesting and useful statements:

1. If we know detailed information about the population, then we can make some powerful inferences about a properly drawn sample.
2. If we have detailed information about a properly drawn sample, then we can infer information about the larger population. 
3. If we have data describing a particular sample, and data about a particular population, then we can infer whether this sample is consistent with a sample drawn from the population.
4. Finally, if we have the characteristics of two samples, then we can infer whether the samples were both drawn from the same population.

Wheelan [@Whe2013] gives a series of great examples of applying the CLT to a situation I’m sure that we’ve all found ourselves in at some point: searching for a missing bus of marathon runners.  Imagine that you live in a city which is hosting an internationally famous marathon. On the morning of the race, each of the runners will check in at a central location and will then be randomly assigned to a bus which will take them to the starting line. One of the buses goes missing and through pure bad luck has no GPS, no cell phones on board, and, as it turns out, nobody that speaks English very well. As someone who has trained their entire lives to perform search and rescue missions involving electronics-challenged, distance runners, you’re called in to help with the search. On the way to your car, you notice that in front of your house there is a bus with a group of irate, international visitors parked at the curb with a man who appears to be the driver setting up a sextant, compass and map. Clearly you’ve found the bus! You radio in the good news to headquarters and then run over to inform the passengers of their rescue. As you get closer, you notice something that puts the first seeds of doubt in your mind: the passengers are enormous. Using your keen training as a distance runner search and rescue specialist, you estimate the average weight of the passengers at 250 pounds which in your professional experience would make them pretty large marathon runners. As a result, you call in to the race headquarters to let them know that it’s probably the wrong bus and that they should continue the search. Later, when translators arrive, they confirm your suspicions: it’s not the missing runners, but the New Zealand national rugby team .

The process that allowed you to look at the bus and make a snap judgment about the passengers is, essentially, the Central Limit Theorem. By comparing your estimate of a statistic of the sample (in this case, the average weight) and comparing it to what you knew about the population, you were able to make an informed guess that this might not be the bus of marathon runners. Certainly, in any given race you could imagine that there would be dozens of large runners. But the odds of a lot of them (say 60) being assigned to the same bus randomly wouldn’t be very high. You absolutely could have been wrong, but more often than not, you’d be right to say that this group was not drawn from the marathon running population.

Now, let’s formalize this concept. According to the central limit theorem, the sample means for any population will be distributed roughly as a normal distribution around the population mean. Suppose we have a population, like our marathon field, and we are interested in the weights of its members. Any sample of runners, such as each bus of sixty runners, will have a mean. 

1. If we take repeated samples, such as picking random groups of sixty runners from the field over and over, then each of those samples will have its own mean weight. These are the sample means. 
2. Most of the sample means will be very close to the population mean. Some will be a little higher. Some will be a little lower. Just as a matter of chance, a very few will be significantly higher than the population mean, and a very few will be significantly lower. 
3. The Central Limit Theorem tells us that the sample means will be distributed roughly as a Normal distribution around the population mean. 
4. The Empirical Rule tells us that 68 percent of the observations from a Normal Distribution will lie within one standard deviation of the mean, 95 percent will lie within two standard deviations, and so on. 
5. The results of the Central Limit Theorem will hold no matter what the distribution of the underlying population looks like. 

As an aside, to summarize some of the terms that I just introduced before it gets too confusing:

1. The standard deviation measures dispersion in the underlying population. 
2. The standard error measures the dispersion of the sample means. 
3. The standard error is the standard deviation of the sample means.

As far as an intuitive understanding of hypothesis testing goes, that’s about it. Knowing that the Central Limit dictates the distribution of sample means from a given population, we can create testable inferences on whether or not a sample is likely to have been drawn from a particular population. In the remainder of this note, I formalize this concept and develop a series of recipes that can be applied depending upon the particulars of the situation being examined. 

## A Recipe Book for Hypothesis Testing
### The Steps
If youve followed along this far, then the process of performing a hypothesis test is pretty mechanical. Well assume that we have a sample set of data which has been drawn so that it is a reasonable representation of the larger population. If were planning to make a decision based upon the testing, we should also determine the probability threshold for the decision, $\alpha$ as well. From here, we can lay out the steps that well follow in each of our recipes:

a) **Create the null and alternative hypothesis**: Start with the null hypothesis H~0~, which is essentially a claim that there is no difference. The opposing hypothesis, or alternative hypothesis, H~1~ is a claim that there is a difference.
b) **Construct a test statistic from the data**: There are multiple types of test statistics that can be plausibly used, depending on the information thats available to you. For the most part, well assume that we have at least 30 samples so that we can assume that the central limit theorem will hold. In cases where we know the population standard deviation, well use z-statistics. In cases where we dont know the population standard deviation, and need to estimate it from the data, well use t-statistics.
c) **Convert the test statistic into a p-value**: Once we have our test statistic, we use an appropriate table to convert it into something called a P-value, which tells us the probability of observing data that is at least as extreme as the current sample set.
d) **Draw your conclusion**: Compare the P-value to $\alpha$. If $P \le \alpha$ then we can reject the null hypothesis, otherwise. 

### One Sample Z-Tests

- **Usage:** compares a sample mean to an expected value, typically used to represent the norm. 
- **Specific requirements**: Depends on knowing the population standard deviation, $\sigma$ 
- **Some Notation**: 
	Let 
	- $\mu_0$ = the expected value youre testing the sample against, typically the population mean
	- $N$ = the number of samples
	- $\sigma$ = the population standard deviation under the null hypothesis
Assume that both of these quantities are known
- **Performing a One Sided Test**: 
	1. Formulate the null hypothesis, which in this case is that the sample mean is the same as the assumed mean. 
	2. Formulate the alternate hypothesis, specifically that the population mean is *higher* from the assumed mean. Well come back to other alternative hypotheses in a moment
	3. Compute the sample mean $\bar{x}$
	4. Compute the standard error, $$SE = \frac{\sigma}{\sqrt{N}}$$
	5. Compute the test statistic: $$z_{stat} = \frac{\bar{x} - \mu_0}{SE}$$
	6. Convert the statistic to a P-value by finding the area under the curve beyond the $z_{stat}$ on a Standard Normal distribution[^norms]. 
	
- **Performing a Two Sided Test**
Now, let's consider the other formulation of the alternate hypothesis, i.e. that the means are different, not necessarily higher:

	1. Formulate the null hypothesis, which in this case is that the sample mean is the same as the expected value. 
	2. Formulate the alternate hypothesis, specifically that the population mean is *not equal* from the assumed mean.
	3. Compute the sample mean $\bar{x}$
	4. Compute the standard error, $$SE = \frac{\sigma}{\sqrt{N}}$$
	5. Compute the test statistic: $$z_{stat} = \frac{\bar{x} - \mu_0}{SE}$$
	6. Convert the statistic to a P-value. In this case, well reject the null if the mean is either significantly greater *or* significantly less than $\mu_0$, so our P-value must include the probabilities from both of the tails on the Normal distribution. Again, we can find these areas using a Standard Normal Distribution. Mechanically, the easiest way to do so is to take advantage of the symmetry of the Normal distribution by computing the area under the curve to the right of the $z_{stat}$, and then just doubling it to obtain the two-sided P-value.  

### One Sample T-Tests

The prior examples focused on using the statistic to test a sample mean against an expected value. Constructing the $z_{stat}$ required us to have the population standard deviation $\sigma$ to determine the standard error. Unfortunately, if we dont have $\sigma$ and are forced to estimate it from the data, then we cant use the Z-Tests. Instead we use a variation called a T-Test which uses the sample standard deviation $s$.

- **Usage:** compares a sample mean to an expected value, typically used to represent the norm. Used when the population standard deviation is not known
- **Some Notation**: 
Let 
	- $\mu_0$ = the population mean under the null hypothesis
	- $N$ = the number of samples
	- $s$ = the sample standard deviation
- **Performing a Two Sided Test**: 
	1. Formulate the null hypothesis, which in this case is that the sample mean is the same as the assumed mean. 
	2. Formulate the alternate hypothesis, specifically that the population mean is *higher* from the assumed mean. Well come back to other alternative hypotheses in a moment
	3. Compute the sample mean $\bar{x}$
	4. Compute the standard error, $$SE = \frac{s}{\sqrt{N}}$$
	5. Compute the test statistic: $$t_{stat} = \frac{\bar{x} - \mu_0}{SE}$$
	6. We say that this statistic has $N-1$ degrees of freedom
	6. Convert the statistic to a P-value by using the $t_{stat}$ on a Students T distribution with $N-1$ degrees of freedom. 

### Two Sample T-Tests Assuming Equal Population Variances

A Two Sample Test is pretty much what it sounds like: a hypothesis test involving two independent samples. Constructing these will generally take on the form of the recipes  just presented, however we need to take care to account for both samples having a dispersion. Since well be using a T-Test again, well also need to address the computation of the degrees of freedom.

Before presenting the recipe, remember that in the One Sample T-Test we used the sample standard deviation as the basis for computing the standard error. Well do the same thing here, but now we have two sets of data and, by extension, two sample standard deviations which well need to combine somehow in order to construct the standard error and, eventually the T-statistic. The way that well perform this aggregation is to construct what is called a *pooled standard deviation*, which is essentially a weighted average of the standard deviations of each of the independent groups. Without going into details, the pooled standard deviation is given by

$$S_p = \sqrt{\frac{(N_1 - 1) S_1^2 + (N_2 - 1) S_2^2}{(N_1 - 1) + (N_2 - 1)}}$$

- **Usage:** compares two independent samples when the population standard deviation is not known
- **Some Notation**: 
Let 
	- $N_1$ = the number of samples in Sample 1
	- $N_2$ = the number of samples in Sample 2
- **Performing a Two Sided Test**: 
	1. Formulate the null hypothesis, which in this case is that the sample mean is the same as the assumed mean. 
	2. Formulate the alternate hypothesis, specifically that the population mean is *higher* from the assumed mean. Well come back to other alternative hypotheses in a moment
	3. Compute the sample means of each group $\bar{X}$ and $\bar{Y}$
	4. Compute the pooled standard deviation, 
	$$S_p = \sqrt{\frac{(N_1 - 1) S_1^2 + (N_2 - 1) S_2^2}{(N_1 - 1) + (N_2 - 1)}}$$
	5. Compute the test statistic: 
	$$t_{stat} = \frac{\bar{X} - \bar{Y}}{S_p\sqrt{\frac{1}{N_1} + \frac{1}{N_2}}}$$
	6. We say that this statistic has $dof = N_1 + N_2 - 2$ degrees of freedom
	6. Convert the statistic to a P-value by using the $t_{stat}$ on a Students T distribution with $dof$ degrees of freedom. 

*Note:* There is another test, which we wont cover here, which handles the case when we assume that we have two unequal population variances. This test, called Welchs T-Test, can generally be applied to the equal variance case. The recipe for Welchs T-Test is essentially the similar in spirit to the one presented here, but it differs significantly in the computation of the number of degrees of freedom.

### Paired T-Tests

What happens if we want to compare two population means where you have two samples in which observations in one sample can be paired with observations in the other sample. Examples of where this might occur are:

- Before-and-after observations on the same subjects (e.g. students test results before and after a particular module or course).
- A comparison of two different methods of measurement or two different treatments where the measurements/treatments are applied to the same subjects

In this case, it feels like we should apply a Two Sample Test. However, the ability to pair the data allows us to recast the problem as a One Sample Test, which in this case will have considerably more power. 

**RECIPE**

- **Usage:** compares two samples where the samples can be paired. 
- **Some Notation**: Let
	- $\mu_0$ = the population mean under the null hypothesis
	- $N$ = the number of samples, which is assumed to be the same in both sets
	- $X = \{ x_1, x_2, \dots, x_N \}$ be the first sample
	- $Y = \{ y_1, y_2, \dots, y_N \}$ be the second sample 
- **Performing a Two Sided Test**: 
	1. Formulate the null hypothesis, which in this case is that the true mean difference is zero. 
	3. Calculate the differences between each pair of samples $d_i = y_i - x_i$,
	4. Compute the mean difference $\bar{d}$
	4. Compute the standard deviation of the differences, $s_d$ 
	5. Compute the standard error of the mean difference $$SE(\bar{d}) = \frac{s_d}{\sqrt{N}}$$
	5. Compute the test statistic: $$t_{stat} = \frac{\bar{d}}{SE(\bar{d})}$$
	6. We say that this statistic has $N-1$ degrees of freedom
	6. Convert the statistic to a P-value by using the $t_{stat}$ on a Students T distribution with $N-1$ degrees of freedom. 
	
## Some Things To Keep an Eye Out For in Hypothesis Testing
The results of statistical tests can be confusing to interpret so you might find it useful to keep these items in mind, since they come up quite often as mistakes:

1. **Failure to reject the null hypothesis leads to its acceptance**.  Nope. The failure to reject the null hypothesis only means that you have insufficient evidence for its rejection. 
2. **The p value is the probability that the null hypothesis is incorrect.** Nope. The p value is the probability of data that is at least as extreme as the sample data, assuming H~0~ is true.
3. **$\alpha = .05$ is a standard with an objective basis.** Nope.  $\alpha$ = .05 is just a convention. There is no sharp distinction between significant and insignificant results, only increasingly strong evidence as the p value gets smaller. 
4. **Small p values indicate large effects**. Nope. p values tell you next to nothing about the size of an effect.
5. **Statistical significance implies importance.** Nope. Statistical significance says very little about the importance of a relation.

## Some Definitions
* **Null Hypothesis** ($H_0$): More formally, the statement that the observed differences in the data were due to chance.
* **Alternative Hypothesis** ($H_1$): The opposite of the null hypothesis. 
* **Alpha** ($\alpha$) - The probability the researcher is willing to take in falsely rejecting a true null hypothesis. Typical values might be $\alpha = 0.90$ or $\alpha = 0.95$
* **Test statistic** - A statistic used to test the null hypothesis. The formulation of this statistic will vary based upon the assumed distribution (e.g. the Students T Distribution, the Normal, etc.).
* **P-value** - A probability statement that answers the question If the null hypothesis were true, what is the probability of observing the current data or data that is more extreme than the current data?. It is NOT the probability that the null hypothesis is true.
* **Type I error** - a rejection of a true null hypothesis; a false alarm.
* **Type II error** - a retention of an incorrect null hypothesis, or a missed detection
* **Confidence** (1 - $\alpha$) - the complement of alpha.

## References

# Hypothesis Testing


```python
>>> # We're going to plot all of the figures within the notebook, so let's set up that option
... # Our standard set of imports for pandas, numpy and matplotlib
... import pandas as pd
>>> import numpy as np
>>> import matplotlib as mpl
>>> import matplotlib.pyplot as plt
>>> from ipywidgets import interact
...
>>> # in addition, it will be useful in general if we keep our plots "inline" within the notebook
... %matplotlib inline
...
>>> mpl.style.use('ggplot')
```

## Probability Distributions

I'm sure that this is entirely review for everyone, but let's take a moment to think about probability distributions. For most people, the distribution that may come to mind first is the Gaussian, or Normal, probability distribution.

## Gaussian Distributions

```python
>>> import numpy as np
>>> import matplotlib.pyplot as plt
>>> import matplotlib.mlab as mlab
>>> import math
...
>>> from ipywidgets import interact
...
>>> # set up the pdf for the standard distribution
... mean = 0
>>> variance = 1
>>> sigma = math.sqrt(variance)
>>> x = np.linspace(-4,4,100);
...
>>> # compute the CDF
... y = mlab.normpdf(x,mean,sigma);
>>> yCum = y.cumsum();
>>> yCum /= yCum[-1];
...
>>> def fillGaussian(t):
...     section = np.linspace(-4, t, 40)
...     yFill = mlab.normpdf(section,mean,sigma)
...
...     # determine the area that will be filled
...     # and now draw everything
...     fig, ax1 = plt.subplots(1, 1, sharex=True)
...     fig.set_size_inches(15,10)
...     ax1.plot(x, y, 'b', linewidth=1.5)
...     ax1.plot(x, yCum, 'r--', linewidth=1.5)
...     ax1.fill_between(section,0.0, yFill, color='Green', alpha=0.5)
...     plt.ylim(0, 1.05)
...     plt.grid(True)
...     plt.show()
...
...     return
...
>>> interact(fillGaussian, t=(-4.0,4.0));
```

## Empirical Distributions

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

## Empirical Distributions

## The Normal Approximation

# Visualizing this process

```python
>>> import numpy as np
>>> import matplotlib.pyplot as plt
>>> import matplotlib.mlab as mlab
>>> import math
...
>>> from ipywidgets import interact
...
>>> # set up the pdf for the standard distribution
... mean = 0
>>> variance = 1
>>> sigma = math.sqrt(variance)
>>> x = np.linspace(-4,4,100);
...
>>> # compute the CDF
... y = mlab.normpdf(x,mean,sigma);
>>> yCum = y.cumsum();
>>> yCum /= yCum[-1];
...
>>> def fillGaussian(t):
...     section = np.linspace(t, 4, 20)
...     yFill = mlab.normpdf(section,mean,sigma)
...
...     # determine the area that will be filled
...     # and now draw everything
...     fig, ax1 = plt.subplots(1, 1, sharex=True)
...     fig.set_size_inches(15,10)
...     ax1.plot(x, y, 'b', linewidth=1.5)
...     ax1.plot(x, yCum, 'r--', linewidth=1.5)
...     ax1.fill_between(section,0.0, yFill, color='Green', alpha=0.5)
...     plt.ylim(0, 1.05)
...     plt.grid(True)
...     plt.show()
...
...     return
...
>>> interact(fillGaussian, t=(0.0,4.0));
```