# simulate modules
sim_gaussian_y: simulate.R + \
                R(sim_gaussian_res=sim_gaussian_y(readRDS(pathX), readRDS(pathy), pve, effect_num, betaSigma))
  pathX: $pathX
  pathy: $pathy
  pve: 0.1, 0.3, 0.5, 0.7, 0.9, 0.99
  effect_num: 0, 1, 5, 10, 20
  betaSigma: $betaSigma
  $train_n: sim_gaussian_res$train_n
  $sim_gaussian_y: sim_gaussian_res$sim_y
  $beta_idx: sim_gaussian_res$beta_idx
  $beta_val: sim_gaussian_res$beta_val
  $effect_number: sim_gaussian_res$effect_num
  
sim_gaussian_largeEffect_y(sim_gaussian_y):
  effect_num: 200
  $sim_gaussian_largeEffect_y: sim_gaussian_res$sim_y

sim_binary_y: simulate.R + \
                R(sim_binary_res=sim_binary_y(readRDS(pathX), effect_num, betaSigma, intercept))
  pathX: $pathX
  effect_num: 0, 1, 5, 10, 20
  intercept: 0
  betaSigma: $betaSigma
  $train_n: sim_binary_res$train_n
  $sim_binary_y: sim_binary_res$sim_y
  $beta_idx: sim_binary_res$beta_idx
  $beta_val: sim_binary_res$beta_val
  $effect_number: sim_binary_res$effect_num
  
sim_binary_largeEffect_y(sim_binary_y):
  effect_num: 200
  $sim_binary_largeEffect_y: sim_binary_res$sim_y