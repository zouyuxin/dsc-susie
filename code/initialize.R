#initialize.R module
library(L0Learn)
library(susieR)
library(glmnet)

init_susie = function(s_bool,init_method,pathX,sim_y,train_n){
  X=as.matrix(readRDS(pathX)[1:train_n,])
  y=sim_y[1:train_n]
  if (!s_bool) {
    s_init = 0
  } else {
    if (init_method=='L0Learn'){
      set.seed(1)
      L0fit = L0Learn.cvfit(X, y, penalty = "L0")
      lambdaIndex = which.min(L0fit$cvMeans[[1]]) # find the optimal lambda, which has minimum cv error
      L0coef = as.numeric(coef(L0fit$fit, lambda = L0fit$fit$lambda[[1]][lambdaIndex]))
      effect.beta = L0coef[which(L0coef!=0)][-1]
      effect.index = (which(L0coef!=0)-1)[-1]
    } else if (init_method=='glmnet'){
      set.seed(1)
      glm.fit = cv.glmnet(X,y)
      betas = coef(glm.fit, s='lambda.min')
      effect.index = which(betas!=0)[-1]-1
      effect.beta = betas[which(betas!=0)[-1]]
    } else {
      s_init = 0
    }
    if (length(effect.index) == 0) {
      s_init = 0
    } else {
      s_init = susie_set_init(effect.index, effect.beta, num_variables=dim(X)[2], V=0.2, residual_variance=NULL)
    }
  }
  return(s_init)
}



