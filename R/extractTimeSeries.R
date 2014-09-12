#' Extract a Time Series from a Data.table 
#' 
#' This functions extracts time series from data.table columns and returns object of class ts. 
#' @author Matthias Bannert, Gabriel Bucur
#' @param data_table a data.table 
#' @param time_column character name of the column which contains the time index
#' @param group_list list
#' @param freq integer value either 4 denoting quarterly frequency or 12 denoting quarterly frequency
#' @param variable character name of the column which contains the item that is extracted from the data.table
#' @export 
extractTimeSeries <- function(data_table, time_column, group_list, freq, variable) {
  
  old_key <- key(data_table)
  setkeyv(data_table, names(group_list))
  
  # Cross Join is used because J is not a function
  # and cannot be do.called
  dt_subset <- data_table[do.call("CJ", group_list)]
  
  start_date <- min(as.Date(dt_subset[[time_column]]))
  year <- as.numeric(format(start_date, "%Y"))
  
  if (freq == 4) {
    period <- (as.numeric(format(start_date, "%m")) - 1) / 3 + 1
  } else if(freq == 12) {
    period <- as.numeric(format(start_date, "%m"))
  } else {
    stop("Not a standard frequency.")
  }
  
  setkeyv(dt_subset, time_column)
  setkeyv(data_table, old_key)
  
  ts(dt_subset[[variable]], start = c(year, period), frequency = freq)
}
