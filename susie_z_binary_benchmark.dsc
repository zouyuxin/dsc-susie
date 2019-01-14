#!/usr/bin/env dsc

%include modules/simulate
%include modules/susie_z
%include modules/susie_bhat
%include modules/susie
%include modules/score

DSC:
  define:
    susie_summary_all: susie_z, susie_bhat
    susie_all: susie, susie_z, susie_bhat

  run: 
    binary: sim_binary * susie_summary_all * score

  exec_path: modules, code
  R_libs: MASS, glmnet, susieR@stephenslab/susieR
  global:
    pathX: "data/susie_X.rds"
    pathR: "data/susie_R.rds"