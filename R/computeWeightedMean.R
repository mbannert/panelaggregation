#' Compute Weighted Mean by Group
#' 
#' This function computes the weighted mean of variable groups from a data.table. 
#' computeWeightedMean is performance optimized and designed to
#' work well in bulk operations. The function returns a data.table.
#' 
#' @author Matthias Bannert, Gabriel Bucur
#' @param data_table a data.table
#' @param variable character name of the variable to focus on. The variable must be in the data.table
#' @param weight character name of the data.table column that contains a weight. 
#' @param by character vector of the columns to group by
#' @import data.table
#' @example demo/aggregation.R
#' @export
computeWeightedMean <- function(data_table, variable, weight, by) {
  
  if (is.null(weight)) {
    res_dt <- data_table[, list(wavg = mean(eval(as.name(variable)), na.rm = TRUE)), by = by]
  } else {
    res_dt <- data_table[, list(wavg = weighted.mean(eval(as.name(variable)), 
                                                     eval(as.name(weight)), na.rm = TRUE)), 
                         by = by]
  }
  
  setnames(res_dt, 'wavg',variable)
  res_dt
}
