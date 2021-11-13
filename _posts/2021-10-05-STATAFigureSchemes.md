---
layout: post
title: Overview on Stata figure schemes  
date: 2021-10-05 16:25:00
description: this post gives a quick overview about the Stata figure schemes I've produced over the years
---

Throughout the years, I have created several Stata figure schemes. This post gives you a brief overview about what I produced. If you want to learn more I would push you to read my Stata article on figure schemes (and some of the work Ben Jann has done). 

<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ site.baseurl }}/assets/img/plotplain.png">
        *plotplain*
    </div>
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ site.baseurl }}/assets/img/plottig.png">
        *plottig*
    </div>
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ site.baseurl }}/assets/img/538.jpg">
        *538.jpg*
    </div>
</div>


You can install all of these schemes in Stata by using the `ssc install` command: 
```bash
ssc install blindschemes, replace all 
```
`blindschemes` contains the `plotplain` and `plottig` themes. If you want to install the 538 scheme, use `g538schemes ` instead. 

Afterwards you can then set one of the schemes as your default scheme: 
```bash
set scheme plottig, permanently
```

If you have more questions please get in touch. But before getting in touch make sure that your issue is not addressed in this [PDF]({{ site.baseurl }}/assets/pdf/Bischof2018blindschemes_howto.pdf).

In the last years the amount of user-written schemes has exploded. To get an overview check out this <a href="https://github.com/asjadnaqvi/Stata-schemes">github repository</a> as well as this <a href="https://medium.com/the-stata-guide/stata-schemes-5ef99d099585">blog post</a>.

PS: I will try to update this post from time to time. Get in touch if you want me ton include other themes/overview pages. 

