# analyze modules
susie_gaussian: susie.R
  pathX: $pathX
  train_n: $train_n
  sim_y: $sim_gaussian_y
  L: 20
  pve: 0.1, 0.3, 0.5, 0.7, 0.9, 0.99
  estimate_prior_variance: 0, 0.2, 1
  s_init: NULL
  $fit: fit
  $cs: cs
  $beta_est_idx: beta_est_idx
  $beta_est_val: beta_est_val
  $num_iter: num_iter
  
susieL0_gaussian: susie.R
  pathX: $pathX
  train_n: $train_n
  sim_y: $sim_gaussian_y
  pve: 0.1, 0.3, 0.5, 0.7, 0.9, 0.99
  estimate_prior_variance: 0, 0.2, 1
  s_init: 1
  $fit: fit
  $cs: cs
  $beta_est_idx: beta_est_idx
  $beta_est_val: beta_est_val
  $s: s
  $num_iter: num_iter
  
susie_gaussian_largeEffect(susie_gaussian):
  sim_y: $sim_gaussian_largeEffect_y
  L: 210
  
susieL0_gaussian_largeEffect(susieL0_gaussian):
  sim_y: $sim_gaussian_largeEffect_y
  
  
susie_binary(susie_gaussian):
  sim_y: $sim_binary_y
  
susieL0_binary(susieL0_gaussian):
  sim_y: $sim_binary_y
  
susie_binary_largeEffect(susie_gaussian):
  sim_y: $sim_binary_largeEffect_y
  L: 210
  
susieL0_binary_largeEffect(susieL0_binary):
  sim_y: $sim_binary_largeEffect_y