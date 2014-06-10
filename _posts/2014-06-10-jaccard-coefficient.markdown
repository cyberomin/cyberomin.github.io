---
layout: post
title:  "Jaccard Similarity - Clustering for the rest of us!"
date:   2014-06-10 16:19:14
categories: clustering algorithms
---
Have you ever wondered how Facebook knows which post is similar to which?
If you have 2 or more friends posting the same link to an article, Facebook will intelligently
group these two articles into one single feed. Well, Facebook uses some sort of clustering algorithm and Jaccard is one of them.

What is Jaccard Coefficient or Jaccard Similarity?
<blockquote>
	The Jaccard index, also known as the Jaccard similarity coefficient (originally coined coefficient de communauté by Paul Jaccard), is a statistic used for comparing the similarity and diversity of sample sets. The Jaccard coefficient measures similarity between finite sample sets, and is defined as the size of the intersection divided by the size of the union of the sample sets: J(A,B) = |A n B|/|A uB|.
	<footer>Source<cite title="Source Title">Wikepedia</cite></footer>
</blockquote>

I whiped out a small Python script to illustrate this point -

{% highlight python %}
from __future__ import division

class Jaccard:

	def  __init__(self,args,args_ii):
		self.args = self.tokenize(args)
		self.args_ii = self.tokenize(args_ii)

	def intersect(self):
		return [i for i in self.args if i in self.args_ii]

	def union(self):
		return set(self.args + self.args_ii)

	def similarity(self):
		intersect = len(self.intersect())
		union = len(self.union())
		if intersect == None and union == None:
			return 1
		return intersect / union

	def distance(self):
		return 1 - self.similarity()

	def tokenize(self,item):
		item = item.lower()
		return item.split(" ")

jaccard = Jaccard("I am Sam","I am Sam, Sa is awesome. Sam is a genius")
similarity = jaccard.similarity()
print similarity
{% endhighlight %}

<p>
	From the class above, I decided to break down into tiny bits - functions/methods.<br><br>

	We are using two sentences here for our test.<br>
	1. We tokenize each sentence. We basically made them into sets.<br>
	2. We calculate the intesection of these sentences.<br>
	3. We calculate the union of the sentences.<br>
	4. We calculate the similarity which is basically the division of the intersection of both sets by its union.<br>

	Simple right? Jaccard only needs two variables, the union and intersection of both sets.
</p>

<p>Similarity ranges between 1 and 0. Anything outside that is probably wrong :-).</p>

Why should you care?
<ul>
	<li>
		Ecommerce companies uses Jaccard Similarity to recommend items and deals to customer based on the purchases made by other customers. <em>(Disclaimer - I work for an eCommerce company)</em>
	</li>
	<li>
		This algorithm can be used to detect plagiarism.
	</li>
	<li>
		Similar comments in an online forum can be grouped together.
	</li>
	<li>
		Search engines use this same algorithm to group and sometimes discard similar search results.
	</li>
</ul>