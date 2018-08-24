#presimulate.R
#' @title compute beta_sigma given data X and y, use glmnet to estimate beta 
#'                   and return a sigma that could be used for simulate beta
#' @param X an n by p matrix
#' @param y an n vector
#' @return beta.sigma a scalar that can be used for simulating betas
compute_beta_sigma = function(X, y){
  p = dim(X)[2]
  #Use glmnet fit to get beta_hat
  cvfit = glmnet::cv.glmnet(X,y,family='binomial')
  coef = as.numeric(coef(cvfit, s='lambda.min'))
  beta.val = coef[which(coef!=0)][-1]
  beta.sigma = sqrt(var(beta.val))
  return(beta.sigma)
}