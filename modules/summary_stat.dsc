# summary statistics modules
summary_gaussian: summary_stat.R + \
                R(summary_gaussian_res=summary_stat_gaussian(readRDS(pathX), y))
  pathX: $pathX
  y: $sim_y
  $ss: summary_gaussian_res
  
summary_binary: summary_stat.R + \
                R(summary_binary_res=summary_stat_logistic(readRDS(pathX), y))
  pathX: $pathX
  y: $sim_y
  $ss: summary_binary_res