library(susieR)
susie_analyze = function(pathX, train_n, sim_y, L, prior, s_init) {
  X=as.matrix(readRDS(pathX))[1:train_n,]
  y=sim_y[1:train_n]
  if (!is.list(s_init)){
    fit = susie(X,y,L=L,scaled_prior_variance=prior,track_fit = TRUE)
  } else {
    fit = susie(X,y,s_init=s_init, track_fit = TRUE)
  }
  sets = susie_get_cs(fit, X)
  cs = sets$cs
  purity = sets$purity
  avg_purity = mean(purity[,1])
  cs_index = sets$cs_index
  pip = susie_get_pip(fit)
  num_iter = fit$niter
  beta_est_idx=unlist(cs)
  beta_est_val=coef(fit)[-1][beta_est_idx]
  return(list(fit=fit, sets=sets, cs=cs, cs_index=cs_index, pip=pip, num_iter=num_iter, beta_est_idx=beta_est_idx, beta_est_val=beta_est_val, avg_purity=avg_purity))
}

susie_z_analyze = function(pathR, train_n, ss, L, prior, s_init) {
  R=as.matrix(readRDS(pathR))
  if (!is.list(s_init)){
    fit = susie_z(ss$effect/ss$se, R, L=L, track_fit = TRUE)
  } else {
    fit = susie_z(ss$effect/ss$se, R, L=L,s_init=s_init, track_fit = TRUE)
  }
  sets = susie_get_cs(fit, Xcorr = R)
  cs = sets$cs
  purity = sets$purity
  avg_purity = mean(purity[,1])
  cs_index = sets$cs_index
  pip = susie_get_pip(fit)
  num_iter = fit$niter
  beta_est_idx=unlist(cs)
  beta_est_val=coef(fit)[-1][beta_est_idx]
  return(list(fit=fit, sets=sets, cs=cs, cs_index=cs_index, pip=pip, num_iter=num_iter, beta_est_idx=beta_est_idx, beta_est_val=beta_est_val, avg_purity=avg_purity))
}

susie_bhat_analyze = function(pathR, train_n, ss, L, prior, s_init) {
  R=as.matrix(readRDS(pathR))
  if (!is.list(s_init)){
    fit = susie_bhat(ss$effect, ss$se, R, n = train_n, L=L, scaled_prior_variance=prior, track_fit = TRUE, estimate_prior_variance = TRUE, estimate_residual_variance = FALSE)
  } else {
    fit = susie_bhat(ss$effect, ss$se, R, n = train_n, L=L, scaled_prior_variance=prior, s_init=s_init, track_fit = TRUE)
  }
  sets = susie_get_cs(fit, Xcorr = R)
  cs = sets$cs
  purity = sets$purity
  avg_purity = mean(purity[,1])
  cs_index = sets$cs_index
  pip = susie_get_pip(fit)
  num_iter = fit$niter
  beta_est_idx=unlist(cs)
  beta_est_val=coef(fit)[-1][beta_est_idx]
  return(list(fit=fit, sets=sets, cs=cs, cs_index=cs_index, pip=pip, num_iter=num_iter, beta_est_idx=beta_est_idx, beta_est_val=beta_est_val, avg_purity=avg_purity))
}





