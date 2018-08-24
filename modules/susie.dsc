# susie modules
susie: susie.R + \
              R(susie_res = susie_analyze(pathX, train_n, sim_y, L, prior, s_init))
  pathX: $pathX
  sim_y: $sim_y
  train_n: $train_n
  L: 20
  prior: 0.2
  s_init: NULL
  $fit: susie_res$fit
  $sets: susie_res$sets
  $cs: susie_res$cs
  $cs_index: susie_res$cs_index
  $pip: susie_res$pip
  $num_iter: susie_res$num_iter
  $beta_est_idx: susie_res$beta_est_idx
  $beta_est_val: susie_res$beta_est_val
  
susie_large(susie):
  L: 201
  
susie_init(susie):
  s_init: $s_init
  
susie_prior(susie):
  prior: 0.01, 0.1, 0.3, 0.4, 0.5, 0.7, 0.9, 0.99




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