# presimulate modules
compute_beta_sigma: presimulate.R + R(res=compute_beta_sigma(readRDS(pathX),readRDS(pathy)))
  pathX: $pathX
  pathy: $pathy
  $betaSigma: res
