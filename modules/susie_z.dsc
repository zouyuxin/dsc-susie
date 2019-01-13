# susie modules
susie_z: susie.R + \
              R(susie_res = susie_z_analyze(pathR, train_n, ss, L, prior, s_init))
  pathR: $pathR
  ss: $ss
  train_n: $train_n
  L: 20
  prior: 0.2
  s_init: 0
  $fit: susie_res$fit
  $sets: susie_res$sets
  $cs: susie_res$cs
  $cs_index: susie_res$cs_index
  $pip: susie_res$pip
  $num_iter: susie_res$num_iter
  $beta_est_idx: susie_res$beta_est_idx
  $beta_est_val: susie_res$beta_est_val
  $avg_purity: susie_res$avg_purity
  
susie_z_large(susie_z):
  L: 201
  
susie_z_init(susie_z):
  s_init: $s_init
  
susie_z_prior(susie_z):
  prior: 0.01, 0.02, 0.03, 0.05, 0.1, 0.2, 0.4, 0.5, 0.7, 0.9, 0.99
