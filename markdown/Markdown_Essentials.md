# Markdown Essentials

Markdown is a greatly simplified version of html ("hypertext markup language"), the language used to construct basic websites. There are two things that you should know about markdown. First: it's extremely simple. This means that it's extremely easy to learn. Second: it's extremely simple (see point #1). This means that if you're looking to write a document with relatively complex formatting requirements, you might want to look elsewhere for a solution. Having said that, markdown is ubiquitous within the modern analytics community for many reasons. One important reason stems from the fact that it is purely text so it can be embedded very easily in text based files, such as a Jupyter notebook. The implications of this are that we can create a single, readable document which contains both our documentation (in markdown) and our analyses (in python). Here are some things we can do with it:

## The Basics
* **Creating Text**: Just write it.
* **Creating a New Paragraph**: You can create a new paragraph by leaving a blank line between lines of text.
* **Modifying fonts**: Not happening unless you want to start messing with css
* **Modifying font sizes**: The Henry Ford approach. You can have any size font that you'd like so long as it's regular text or a heading (see below). Other than that, you're back to messing with css.
* **Headings**. Large bold headings are marked by hashes (#). One hash for first level (very large), two for second level (a little smaller), three for third level (smaller still), four for fourth (the smallest). Try these in a Markdown cell to see how they look:
```
# Level 1 Heading
## Level 2 Heading
###  Level 3 Heading
####  Level 3 Heading
```
*  **Text Formatting**. 
	* \*\*double asterisks\*\* displays as **bold**. 
	* \*single asterisks\* get us *italics*
* **Bullet lists**. If we want a list of items marked by bullets, we start with a blank line and mark each item with an asterisk on a new line, such as:
```
		A bullet list:
		* something
		* something else
``` 
* **Numbered lists**. If we want a numbered list of items, we start with a blank line and mark each item with an number on a new line, such as:
``` 
		A numbered list:
		1. something
		2. something else
``` 
* **Links**. We construct a link with the text in square brackets and the url in parentheses immediately afterwards such as 
```
	[Text To Display](the URL to go to)
```

* **Inserting Images**: Markdown uses an image syntax that is intended to resemble the syntax for links, allowing for two styles: inline and reference. Inline image syntax looks like this:
```
	![Alt text](/path/to/img.jpg), or 
	![Alt text](/path/to/img.jpg "Optional title")
```
Reference-style image syntax looks like this:
```
	![Alt text][id]
```
* **Math**: if you're so inclined, you can create extremely complex equations in many flavors of markdown by embedding LaTeX directly into the file. Either this means something to you already, or it doesn't. You probably don't want to try to learn LaTeX just for this class. Inline equations are denoted using pairs of \$'s and reference style equations are denoted using double \$'s, for instance:
```
		This is an example of inline math $y = mx + b$
```
which will render to:

			This is an example of inline math $y = mx + b$



## Getting Help in Jupyter
We can find more information about Markdown under the Help menu in Jupyter notebook.

## References

* [Markdown Spec](http://daringfireball.net/projects/markdown/) The original definition of markdown.
* [GitHub Flavored Markdown](https://help.github.com/categories/writing-on-github/) The variant that we'll typically be using in this course.

## Exercises

<div class="alert alert-success">
**Exercise**. Create a description cell in Markdown at the top of your notebook. It should include your name and a description of what you're doing in the notebook. For example: "Joan Watson's notes on the Data Bootcamp Matplotlib notebook" and a date. Bonus points: Add a link.
</div>

```python
>>> # create your answer to the exercise here
```

<div class="alert alert-success">
**Exercise**. Click on the + to add two new cells. In the first one, add the statement import pandas as pd, labelled as code. Run it. Use the second cell to find documentation for pd.read_csv.
</div>

```python
>>> # create your answer to the exercise here
```
