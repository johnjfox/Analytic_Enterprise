# Markdown Essentials

Markdown essentials. Markdown is a simplified version of html ("hypertext markup language"), the language used to construct basic websites. html was a great thing in 1995, but now that the excitement has warn off we find it painful. Markdown, however, has a zen-like simplicity and beauty. Here are some things we can do with it:
Headings. Large bold headings are marked by hashes (#). One hash for first level (very large), two for second level (a little smaller), three for third level (smaller still), four for fourth (the smallest). Try these in a Markdown cell to see how they look:
 # Data Bootcamp sandbox
 ## Data Bootcamp sandbox
 ### Data Bootcamp sandbox
Be sure to run the cell when you're done (shift enter).
Bold and italics. If we put a word or phrase between double asterisks, it's displayed in bold. Thus **bold** displays as bold. If we use single asterisks, we get italics: *italics* displays as italics.
Bullet lists. If we want a list of items marked by bullets, we start with a blank line and mark each item with an asterisk on a new line:
* something
* something else
Try it and see.
Links. We construct a link with the text in square brackets and the url in parentheses immediately afterwards. Try this one:
[Data Bootcamp course](http://databootcamp.nyuecon.com/)
We can find more information about Markdown under Help. Or use your Google fu. We like the Daring Fireball description.
Markdown is ubiquitous. This book, for example, is written in Markdown. Look here for a list of chapter files. Click on one to see how it displays. Click on the Raw button at the top to see the Markdown file that produced it.
IPython help. We can access documentation just as we did in Spyder's IPython console: Type a function or method and add a question mark. For example: print? or df.plot?.
Exercise. Create a description cell in Markdown at the top of your notebook. It should include your name and a description of what you're doing in the notebook. For example: "Joan Watson's notes on the Data Bootcamp Matplotlib notebook" and a date. Bonus points: Add a link.
Exercise. Click on the + to add two new cells. In the first one, add the statement import pandas as pd, labelled as code. Run it. Use the second cell to find documentation for pd.read_csv.

```python

```