library(susieR)
#' @title compute the prediction error given susie fit
#' @param pathX a string the location of X design matrix
#' @param sim_y an n vector simulated y 
#' @param train_n a scalar the number of samples trained
#' @param fit a susie fit object
#' @return pred_err a scalar prediction error
compute_pred_err = function(pathX, sim_y, train_n, fit){
  X.all = as.matrix(readRDS(pathX))
  n = dim(X.all)[1]
  X.test = X.all[(train_n+1):n,]
  y.test = sim_y[(train_n+1):n]
  pred_err = mean((y.test-predict(fit, X.test))^2)
  return(pred_err)
}