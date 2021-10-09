---
layout: post
title: Standardization ado for Stata  
date: 2015-08-06 16:00:00
description: Standardization ado for Stata
---

I often want to standardize my variables before using them in models. Especially if a variable either is heavily right-skewed then I like to log standardize the variable; e.g. number of protesters) or the coefficient of variable is uninterpretable anyways (then I tend to follow Gelman's (2008) approach; e.g. age and age^2 which results in very small coefficients in a regression). So far I generated such standardizations myself, e.g.:
```bash
gen log_protesters=log(protesters+1)
```
However, since I tend to be lazy and try to minimize the amount of syntax I produce, I programmed a small program called standard2 which creates three new variables for each variable specified after the command `standard2`:
```bash
standard2 variable1 variable2
```
It will then create three new variables for each variable specified, e.g. for variable1: std2_variable1 (variable1 standardized by 2 std. dev.); mc_variable1 (variable1 mean centered); log_variable1=log(variable1+1)).

The program can be downloaded as an stata ado file [here]({{ site.baseurl }}/assets/code/emdb.ado). You will need to unpack the .zip and copy the ado into your stata ado file directory (find a how to do: here).
