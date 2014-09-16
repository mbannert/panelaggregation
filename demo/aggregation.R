# load library and dataset
library(panelaggregation)
data(btsdemo)
head(btsdemo)
level1 <- computeShares(btsdemo,"question_1","weight",by = c("date_qtrly","group"))

# adapt the levels to positive, equal and negative
# in order to suit the naming defaults. other levels work too, 
# but you'd need to specify multipliers in computeBalance then
levels(btsdemo$question_1) <- c("pos","eq","neg")

# compute balance, don't have to do much here, because
# 3 items is the default
level1_wbalance <- computeBalance(level1)

# Select a particular grouping combination and a timeseries that 
# should be extracted from the data_table
ts1 <- extractTimeSeries(level1_wbalance,
                  "date_qtrly",
                  list(group = "C"),
                  freq = 4,
                  variable = "balance")

# Plot a standard R ts using the plot method for ts
plot(ts1)


