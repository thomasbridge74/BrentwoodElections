---
title       : Brentwood Elections 
subtitle    : A Coursera Project
author      : Thomas Bridge
job         : Politics and Data Nerd
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Brentwood Elections

1. The borough of Brentwood is in Essex, England.   It sits just outside London, and is mostly bordered on the West
side by the M25 ring road.
2. Elections for the Borough Council are held three out of every four years (the fourth year is for Essex County Council)
3. This Coursera project uses the election data to produce graphs of the election results.

<img src='brentwood_800.jpg' height='300' />

--- .class #id 

## The application.

I have compiled a set of data for the local election results held in 2010, 2011, 2012 and 2014 (the County Council elections where held in 2013).   This is used as the basis of the presentation.  The data is in CSV format and is
easily loaded.

```r
electiondata <- read.csv("Brentwood Elections.csv", header=TRUE)
```

```
## Warning in file(file, "rt"): cannot open file 'Brentwood Elections.csv':
## No such file or directory
```

```
## Error in file(file, "rt"): cannot open the connection
```

```r
head(electiondata)
```

```
##   Year            Ward               Name        Party Vote
## 1 2012 Brentwood North        Ross Carter       LibDem  810
## 2 2012 Brentwood North      Paul Faragher Conservative  439
## 3 2012 Brentwood North  Kenneth Gulleford         UKIP  104
## 4 2012 Brentwood North   Richard Millwood       Labour  170
## 5 2012 Brentwood South       David Bishop Conservative  594
## 6 2012 Brentwood South Juliette Morrissey       Labour  689
```

### Where to find the source code and data.
1.  The application is hosted at https://thomasbridge.shinyapps.io/BrentwoodElections/
2.  The github repository is hosted at https://thomasbridge.shinyapps.io/BrentwoodElections/

---

## Slide 3

You can do it using the party

---
## Slide 4

Or by year.

---

## Maybe more

If I have time.




