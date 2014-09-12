#' Compute Balances from a Item Shares
#' 
#' This function computes balances (i.e. positive - negative items), from item shares
#' stored in a wide format data.table.
#' 
#' @author Matthias Bannert, Gabriel Bucu
#' @param data_table a data.table in wide format containing item 
#' @param multipliers list containing multipliers of items, assigned by item and column names
#' @export
 computeBalance <- function(data_table, multipliers = list("item:pos" = 1, "item:eq" = 0, "item:neg" = -1)) {
  data_table$balance <- 0
  
  for(item in names(multipliers)) {
    data_table[, balance := balance + multipliers[[item]] * get(item)]
  }
  
  data_table
}