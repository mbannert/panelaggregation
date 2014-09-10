panelaggregation
================

An R Package to aggregate Panel Data


Description
-----------
The term panel data refers to a type of dataset which contains multiple variables measured over time(See also: http://en.wikipedia.org/wiki/Panel_data). Panel datasets occur in fields of research that do longitudinal studies. Business cycle researchers for example conduct regular surveys among the same set of firms to draw intertemporal comparison and infer on the business cycle. 

Often one or multiple dimensions of the panel dataset are collapsed by aggregation during the analysis. 
Typically observations are summarized by computing means or shares over certain groups. Assume a set of firms is summarized to different sectors of trade: e.g. lots of firms belonging to the service sector are aggregated to a mean number of employees in the service sector over time. 

This package provides useful functions to aggregate panel data and convert aggregation results into standard R time series. The **panelaggregation** package relies on the **data.table** and can be regarded as a more intuitive convenience layer around **data.table**. 


Install the package
-------------------
We're not CRAN ready yet. So the easiest way to go is the **install_github** function from the **devtools** package.

```
library(devtools)
install_github('panelaggregation','mbannert')
```

