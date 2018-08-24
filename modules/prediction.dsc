# prediction modules
compute_pred_err_gaussian_smallEffect: compute_pred_err.R + R(pred_err = compute_pred_err(pathX, sim_y, train_n, fit))
  pathX: $pathX
  sim_y: $sim_gaussian_y
  train_n: $train_n
  fit: $fit
  $pred_err: pred_err

compute_pred_err_guassian_largeEffect(compute_pred_err_gaussian_smallEffect):
  sim_y: $sim_gaussian_largeEffect_y
  
compute_pred_err_binary_smallEffect(compute_pred_err_gaussian_smallEffect):
  sim_y: $sim_binary_y
  
compute_pred_err_binary_largeEffect(compute_pred_err_gaussian_smallEffect):
  sim_y: $sim_binary_largeEffect_y  