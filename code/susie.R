library(susieR)
library(L0Learn)
X=as.matrix(readRDS(pathX)[1:train_n,])
y=sim_y[1:train_n]


if(is.null(s_init)){
  if (estimate_prior_variance==1) {
    fit=susie(X,y,L=L, estimate_prior_variance = TRUE)
  }else if(estimate_prior_variance==0.2){
    fit=susie(X,y,L=L)
  }else{
    fit=susie(X,y,L=L,prior_variance=(pve/L) / (1-pve/L))
  }
}else{
    #L0 initialization
    set.seed(1)
    L0fit = L0Learn.cvfit(X, y, penalty = "L0")
    lambdaIndex = which.min(L0fit$cvMeans[[1]]) # find the optimal lambda, which has minimum cv error
    L0coef = as.numeric(coef(L0fit$fit, lambda = L0fit$fit$lambda[[1]][lambdaIndex]))
    effect.beta = L0coef[which(L0coef!=0)][-1]
    effect.index = (which(L0coef!=0)-1)[-1] 
    set.seed(1)
    if(length(effect.index) == 0){
      fit = susie(X,y)
      s = NULL
    }else{
      s = susie_set_init(effect.index, effect.beta, num_variables=dim(X)[2], prior_variance=0.2, residual_variance=as.numeric(var(y)))
      fit=susie(X,y,s_init=s)
    }
}


cs = susie_get_CS(fit, X)$cs
num_iter = fit$niter
beta_est_idx=unlist(cs)
beta_est_val=coef(fit)[-1][beta_est_idx]





