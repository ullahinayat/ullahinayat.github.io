---
layout: post
title: Overview on Stata figure schemes  
date: 2021-10-05 16:25:00
description: this post gives a quick overview about the Stata figure schemes I've produced over the years
---

Throughout the years, I have created several Stata figure schemes. This post gives you a brief overview about what I produced. If you want to learn more I would push you to read my Stata article on figure schemes (and some of the work Ben Jann has done). 

1.  plotblain: 

1.  plottig: 

1.  538: 

You can install all of these schemes in Stata by using the `ssc install` command: 
```bash
ssc install blindschemes, replace all 
```
Afterwwards you can then set one of the schemes as your default scheme: 
```bash
set scheme plottig, permanently
```

If you have more questions please get in touch. But before getting in touch make sure that your issue is not addressed in this [PDF]({{ site.baseurl }}/assets/pdf/Bischof,%202018,%20blindschemes_howto.pdf)