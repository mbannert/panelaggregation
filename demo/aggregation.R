# load library and dataset
library(panelaggregation)
data(btsdemo)
head(btsdemo)
computeShares(btsdemo,"question_1","weight",by = c("date_qtrly","group"))

