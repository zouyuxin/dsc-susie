# simulate modules
sim_gaussian: simulate.R + \
                R(sim_gaussian_res=sim_gaussian(readRDS(pathX), pve, effect_num, betaSigma))
  pathX: $pathX
  pve: 0.01, 0.02, 0.03, 0.05, 0.1, 0.2, 0.4, 0.5, 0.7, 0.9, 0.99
  effect_num: 1, 2, 3, 5, 10, 20
  betaSigma: NA
  $train_n: sim_gaussian_res$train_n
  $sim_y: sim_gaussian_res$sim_y
  $beta_idx: sim_gaussian_res$beta_idx
  $beta_val: sim_gaussian_res$beta_val
  $mean_corX: sim_gaussian_res$mean_corX
  
sim_gaussian_large(sim_gaussian):
  effect_num: 200

sim_binary: simulate.R + \
                R(sim_binary_res=sim_binary(readRDS(pathX), effect_num, betaSigma))
  pathX: $pathX
  effect_num: 1, 2, 3, 5, 10, 20
  betaSigma: NA
  $train_n: sim_binary_res$train_n
  $sim_y: sim_binary_res$sim_y
  $beta_idx: sim_binary_res$beta_idx
  $beta_val: sim_binary_res$beta_val
  $mean_corX: sim_binary_res$mean_corX
  
sim_binary_large(sim_binary):
  effect_num: 200
