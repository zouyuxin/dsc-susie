library(susieR)
susie_analyze = function(pathX, train_n, sim_y, L, prior, s_init) {
  X=as.matrix(readRDS(pathX))[1:train_n,]
  y=sim_y[1:train_n]
  if (!is.list(s_init)){
    fit = susie(X,y,L=L,scaled_prior_variance=prior,track_fit = TRUE)
  } else {
    fit = susie(X,y,s_init=s_init, track_fit = TRUE)
  }
  sets = susie_get_CS(fit, X)
  cs = sets$cs
  purity = sets$purity
  avg_purity = mean(purity[,1])
  cs_index = sets$cs_index
  pip = susie_get_PIP(fit, cs_index)
  num_iter = fit$niter
  beta_est_idx=unlist(cs)
  beta_est_val=coef(fit)[-1][beta_est_idx]
  return(list(fit=fit, sets=sets, cs=cs, cs_index=cs_index, pip=pip, num_iter=num_iter, beta_est_idx=beta_est_idx, beta_est_val=beta_est_val, avg_purity=avg_purity))
}








