# Jupyter Notebooks

There is no shortage of alternatives available for developing Python. The available tools range in complexity from the interactive interface you get by simply typing "python" at the commandline in your operating system up to the extremely complex integrated development environments, such as PyCharm or Eclipse.

For this course, we'll be using a very popular "notebook" based interface called Jupyter. Before you ask, Jupyter admittedly has some significant limitations that mean that it's probably not the tool that you should be using if you're constructing a complex application. But, to be blunt about it, we're not building complex applications right now. Instead, we have basically two goals: (1) to learn enough basic Python to be dangerous and (2) to use Python to perform exploratory analysis. As it turns out, Jupyter is essentially ideal for these tasks:

1. It's extremely simple to use
2. It's very interactive, so we can get immediate feedback when we try something in Python.
3. It's very interactive, so when we eventually move on to data analysis later, it will provide a great environment for interactively exploring, manipulating and visualizing our data
4. It will allow us to share things very easily
5. It will allow us to embed runnable Python into a document which can include both formatted text, multimedia, and rendered equations, so it's really straightforward to create self-contained, self-documented examples.

As a result, Jupyter has been broadly adopted as a tool for both teaching basic Python and performing basic data analyses.

## A Video Overview of the Jupyter Interface
Rather than a length text description of the Jupyter interface, I've created a video which will give you a quick tour of the major functionality

```python
>>> from IPython.display import YouTubeVideo
>>> YouTubeVideo('sjfsUzECqK0')
<IPython.lib.display.YouTubeVideo at 0x1065e9128>
```

## Some Useful Keyboard Shortcuts for Jupyter Notebooks

- Ctrl+ENTER: will evaluate the cell
- Shift+ENTER: will evaluate a cell and select the cell below
- Up Arrow: select previous cell
- Down Arrow: select next cell
- Shift + =: merge current cell with the cell below
- **dd**: delete the current cell
- Ctrl+S (windows) or Cmd+S (OSX): will save the notebook
- TAB will attempt to "auto-complete" whatever you're doing. What happens is context dependent.
    - it may simply complete the variable name, the function name or whatever it is that you were typing if it's unambiguous
    - If there are multiple ways to complete the text, then it will show you several alternatives. It may show a popup of the various alternatives for completing the text you were typing. This may variable names, it may be methods on an object (we'll cover objects later), etc. You can choose between these alternatives using either your mouse or by moving around with your arrow keys
- Shift+TAB will show help popup for docstring

### Some examples to play with.

First let's define a few variables to play with. Don't worry if you're not quite sure about how this works just yet. We'll get to variables later. For now, we're just practicing a bit with notebooks.

**Example:** click on the cell below and hit Shift-Return to create these variables

```python
>>> sampleVariable = 100
>>> sampleList = [1,2,3]
...
>>> print 'sampleVariable = ', sampleVariable
>>> print 'sampleList = ', sampleList
sampleVariable =  100
sampleList =  [1, 2, 3]
```

Now, we can try some of the shortcuts. For example, in the cell below, please type in "sampleV" and then hit the TAB key. It will auto-complete to "sampleVariable". From here you can Shift-Enter to evaluate sampleVariable

```python

100
```

Now, please type in "sample" and then hit the TAB key. You should see both sampleVariable and sampleList as options. Choose one using your keyboard and then evaluate the cell.

```python

```

Finally, although we're getting a bit ahead of ourselves here in terms of Python, it's useful to note that when we are dealing with Python objects we can get the list of methods available on an object using the same TAB trick. For instance, in our example sampleList is a Python object representing a list. Type in "sampleList." and then tab to see the list of methods you can run on this list. If you don't get anything, be sure that you included the "." at the end.

For now, don't worry about the notion of an "object" or what any of these methods do, we'll come back to this later.

## References

1. [Documentation for the Jupyter Project](http://jupyter.readthedocs.org/en/latest)
2. [Documentation for Jupyter Notebook](http://jupyter-notebook.readthedocs.org/en/latest/notebook.html)
