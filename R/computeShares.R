#' Compute Weighted Shares By Group
#' 
#' This function computes weighted shares from a data.table. 
#' computeShares is performance optimized and designed to
#' work well in bulk operations. The function returns a data.table.
#' 
#' @author Matthias Bannert, Gabriel Bucur, Oliver Müller
#' @param data_table a data.table
#' @param variable character name of the variable to focus on. The variable must be in the data.table
#' @param weight character name of the data.table column that contains a weight. 
#' @param by character vector of the columns to group by
computeShares <- function(data_table, variable, weight, by) {
  
  old_key <- key(data_table)
  setkeyv(data_table, c(by, variable))
  
  if (is.null(weight)) {
    res_dt <- data_table[CJ_unique(data_table, c(by, variable)), list(share = .N)]
  } else {
    res_dt <- data_table[CJ_unique(data_table, c(by, variable)), list(share = sum(get(weight)))]
  }
  
  res_dt[is.na(share), share := 0][, share := share / sum(share), by = by]
  
  setkeyv(data_table, old_key)
  res_dt
}
