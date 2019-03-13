---
title: "R Project Directory layout"
author: "Kustian"
date: "March 9, 2019"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Basic Structure
```
project_name
|-- R
|-- data
|-- doc
|-- fig
|-- output
|-- packrat
```
* The `R` directory contains various files with function definitions (but only function definitions - no code that actually runs).
* The `data` directory contains data used in the analysis. This is treated as read only; in paricular the R files are never allowed to write to the files in here. Depending on the project, these might be csv files, a database, and the directory itself may have subdirectories.
* The `doc` directory contains the paper. I work in LaTeX which is nice because it can pick up figures directly made by R. Markdown can do the same and is starting to get traction among biologists. With Word you’ll have to paste them in yourself as the figures update.
* The `fig` directory contains the figures. This directory only contains generated files; that is, I should always be able to delete the contents and regenerate them.
*The `output` directory contains simuation output, processed datasets, logs, or other processed things.

