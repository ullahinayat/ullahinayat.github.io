---
layout: post
title: Stata, simulations & replacing built-in matrix e(b)  
date: 2016-05-23 16:00:00
description: how to replace e(b) matrix in Stata 
---

Yesterday I tried to run some simulations in stata. However, what I intended to do turned out to be a stata nightmare:

First, I ran a conditional logit model. Second, based on the parameter estimates I wanted to take 1,000 draws (or more) from the multivariate normal distribution defined by my conditional logit model coefficients and its covariance matrix. After that I planed to calculate 1,000 predicted probabilities for each observation in my dataset. The reason why I wanted to do this was to compare a *factual* scenario existing in my dataset with a *counterfactual* one that I made up by changing some of the variables in the dataset.

Everything went smoothly but for some reason there was no variation whatsoever in my simulations. I first did not realize what the issue was, the code was clean, the loop worked, everything seemed to be fine.

Turned out the issue was that stata does not want users to replace the built-in coefficients matrix e(b). Yet, this was what my idea was all about.

To solve the issue I wrote a wrapper (download: [here]({{ site.baseurl }}/assets/code/emdb.ado)). You will need to unpack the .zip and copy the ado into your stata ado file directory (find a how to do: here). Let's just consider the following very short example:

1. load example data:
```bash
use http://www.stata-press.com/data/r13/clogitid
```
1. check variables:
```bash
list y x1 x2 id in 1/11
```
1. calculate conditonal logit model with id as group parameter:
```bash
clogit y x1 x2, group(id)
```
1. check out the coefficients matrix:
```bash
matrix list e(b) 
==== x1 = .65336296 x2 = .0659169
```
1. Let's just say we would like to exchange x1(=0.8) and x2(=1.5)
```bash
generate x1_new = 0.8
generate x2_new = 1.5
```
1. Now we create a matrix from these values: (usually you will build a loop running through all ns.
By that you can exchange the matrix for all the draws you made from the original model.
```bash
mkmat x1_new x2_new if _n==1, matrix(draw)
```
1. check if it worked (PS:ALWAYS CALL THE MATRIX `draw`!!!! emdb is built only for this matrix name):
```bash
matrix list draw
```
1. looks good. Now we can use the wrapper (`emdb`) to exchange the matrix with our draws:
```bash
emdb
```
1. did it work?!?
```bash
matrix list e(b)
====x1 =.80000001 x2 = 1.5
*-> It did, Heureka!
```

The clue to solve the issue is `emdb`. This is the very short wrapper I wrote to force stata to let users replace e(b).