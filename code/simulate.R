#' @title beta_sigma Given data X and y, use glmnet to estimate beta 
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

#' @title sim_gaussian_y simulate a normal y from given data matrix X
#' @param X an n by p matrix
#' @param y an n vector
#' @param pve a scalar percentage variance explained
#' @param effect_num a scalar number of true nonzero effects
#' @return Xtrain a 0.8n by p matrix (training data)
#' @return ytrain a 0.8n vector simulated data (training data)
#' @return Xtest a 0.2n by p matrix (test data)
#' @return ytest a 0.2n vector simulated data (training data)
#' @return beta_idx a effect_num-length vector that includes indices of effects
#' @return beta_val a effect_num-length vector that includes beta values 
sim_gaussian_y = function(X, y, pve, effect_num, beta.sigma){
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
  
  if(effect_num==0){
    sim.y = rnorm(n, 0, sd(y)) #null effect problem, how to estimate this sigma???
  }else{
    yhat = X %*% beta
    sigma = sqrt(var(yhat)*(1-pve)/pve) 
    epsilon = rnorm(n, mean = 0, sd = sigma)
    sim.y = yhat + epsilon
  }
  return(list(train_n=train.n, sim_y=sim.y, beta_idx=beta.idx, beta_val=beta.values, effect_num=effect_num))
}

#' @title sim_binary_y simulate a binary y from given data matrix X
#' @param X an n by p matrix
#' @param y an n vector
#' @param effect_num a scalar number of true nonzero effects
#' @param intercept an intercept that controls the proportion of 1s in simulated y
#' @return Xtrain a 0.8n by p matrix (training data)
#' @return ytrain a 0.8n vector simulated data (training data)
#' @return Xtest a 0.2n by p matrix (test data)
#' @return ytest a 0.2n vector simulated data (training data)
#' @return beta_idx a effect_num-length vector that includes indices of effects
#' @return beta_val a effect_num-length vector that includes beta values 
sim_binary_y = function(X, effect_num, beta.sigma, intercept=0){
  X = as.matrix(X)
  n = dim(X)[1]
  p = dim(X)[2]
  train.n = round(0.8*n)
  beta.values = rnorm(effect_num, 0, beta.sigma)
  beta.idx = sample(p, effect_num)
  beta = rep(0,p)
  beta[beta.idx] = beta.values
  yhat = X %*% beta + intercept
  logit.prob = 1/(1+exp(-yhat))   ###Do I need to add epsilon for logistic link???
  sim.y = rbinom(n, 1, logit.prob)
  sim.y[1] = 0 #hard-coded here to avoid elbo error in susie
  sim.y[2] = 1
  return(list(train_n=train.n, sim_y=sim.y, beta_idx=beta.idx, beta_val=beta.values, effect_num=effect_num))
}









