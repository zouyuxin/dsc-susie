#' @title sim_gaussian simulates a normal y from given data matrix X
#' @param X an n by p matrix
#' @param y an n vector
#' @param pve a scalar percentage variance explained
#' @param effect_num a scalar number of true nonzero effects
#' @param beta.sigma a scalar that used for simulating betas
#' @return train_n a scalar number of trainning samples
#' @return sim_y an n vector simulated gaussian y
#' @return beta_idx a effect_num-length vector that includes indices of effects
#' @return beta_val a effect_num-length vector that includes beta values 
#' @return mean_corX mean of correlations of X (lower triangular entries of correlation matrix of X)
sim_gaussian = function(X, y, pve, effect_num, beta.sigma){
  if (is.na(beta.sigma)){
    beta.sigma = 0.5
  }
  X = as.matrix(X)
  n = dim(X)[1]
  p = dim(X)[2]
  train.n = round(0.8*n)
  
  beta.values = rnorm(effect_num, 0, beta.sigma)
  #possibilities for selecting beta.idx:
  # 1) randomly draw effect_num genes (use this now)
  # 2) draw effect_num genes that have largest variances
  # 3) draw effect_num genes that are not correlated with each other
  # 4) draw effect_num genes that are correlated with each other.
  beta.idx = sample(p, effect_num)
  beta = rep(0,p)
  beta[beta.idx] = beta.values
  if (effect_num==1){
    mean_corX = 1
  } else {
    effectX = X[,beta.idx]
    corX = cor(effectX)
    mean_corX = mean(abs(corX[lower.tri(corX)]))
  }
  if(effect_num==0){
    sim.y = rnorm(n, 0, sd(y)) 
  }else{
    yhat = X %*% beta
    sigma = sqrt(var(yhat)*(1-pve)/pve) 
    epsilon = rnorm(n, mean = 0, sd = sigma)
    sim.y = yhat + epsilon
  }
  return(list(train_n=train.n, sim_y=sim.y, beta_idx=beta.idx, beta_val=beta.values, mean_corX=mean_corX))
}


#' @title sim_binary simulates a binary y from given data matrix X
#' @param X an n by p matrix
#' @param y an n vector
#' @param effect_num a scalar number of true nonzero effects
#' @param beta.sigma a scalar that used for simulating betas
#' @return train_n a scalar number of trainning samples
#' @return sim_y an n vector simulated binary y
#' @return beta_idx a effect_num-length vector that includes indices of effects
#' @return beta_val a effect_num-length vector that includes beta values 
#' @return mean_corX mean of correlations of X (lower triangular entries of correlation matrix of X)
sim_binary = function(X, effect_num, beta.sigma){
  if (is.na(beta.sigma)){
    beta.sigma = 0.5
  }
  X = as.matrix(X)
  n = dim(X)[1]
  p = dim(X)[2]
  train.n = round(0.8*n)
  beta.values = rnorm(effect_num, 0, beta.sigma)
  beta.idx = sample(p, effect_num)
  beta = rep(0,p)
  beta[beta.idx] = beta.values
  if (effect_num==1){
    mean_corX = 1
  } else {
    effectX = X[,beta.idx]
    corX = cor(effectX)
    mean_corX = mean(abs(corX[lower.tri(corX)]))
  }
  #yhat = X %*% beta + intercept
  yhat = X %*% beta
  logit.prob = 1/(1+exp(-yhat))   
  sim.y = rbinom(n, 1, logit.prob)
  sim.y[1] = 0 #hard-coded here to avoid elbo error in susie
  sim.y[2] = 1
  return(list(train_n=train.n, sim_y=sim.y, beta_idx=beta.idx, beta_val=beta.values, mean_corX=mean_corX))
}









