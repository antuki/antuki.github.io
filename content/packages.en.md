---
disable_comments: false
nodateline: true
title: R Packages
---

<center><a href="https://antuki.github.io/COGugaison/"><img src="https://antuki.github.io/img/COGugaison_small.png" width="200"></a></center>

COGugaison is an R package for manipulating french spatial databases produced at different dates

The administrative divisions of France (communes – counties – regions, departments…) change over time. Every year, some french territories change their codes, or names, merge or divide.

The COGugaison R package is based on the french official geographic code (COG) produced each year by the french National Institute of Statistics and Economic Studies (Insee). It has the objective of manipulating spatial databases produced at different dates by providing the list of existing towns and their history since fifty years and useful functions for transforming databases into geographic codes of other years.

This package is new and only documented in french. It is not completed and needs to be tested by users of French spatial databases. 

<center><a href="https://github.com/antuki/CARTElette"><img src="https://antuki.github.io/img/CARTElette_small.png" width="200"></a></center>

The repository CARTElette is a complement to the COGugaison package. The goal is to create geographical layers that correspond to the situation of the division of the French territories (France and Overseas) on the first January of each year (date of reference of the official geographic code).

An R package is also included in this repository. At this stage, it allows you to load the layer adapted to your data by indicating the year of the official geographic code (COG) used as well as the geographical level desired.