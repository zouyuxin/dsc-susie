#!/usr/bin/env dsc

%include modules/presimulate
%include modules/initialize
%include modules/simulate
%include modules/summary_stat
%include modules/susie_z
%include modules/susie_bhat
%include modules/susie
%include modules/score

DSC:
  define:
    susie_all: susie, susie_z, susie_bhat
    susie_all_large: susie_large, susie_z_large, susie_bhat_large
  run: 
    gaussian: sim_gaussian * summary_gaussian * susie_all * score
    gaussian_large: sim_gaussian_large * summary_gaussian * susie_all_large * score
    binary: sim_binary * summary_binary * susie_all * score
    binary_large: sim_binary_large * summary_binary * susie_all_large * score

  exec_path: modules, code
  R_libs: MASS, glmnet, susieR@stephenslab/susieR
  global:
    pathX: "data/susie_X.rds"
    pathR: "data/susie_R.rds"