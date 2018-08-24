# dsc-susie

This is a Dynamic Statistical Comparison for testing SuSiE performance given a design matrix X, e.g. from GTEx, single-cell, or GSEA data.

Our intention is to investigate if SuSiE has a good interpretation (i.e. catch right effects in the selected sets) in the context of different X structures.

# The goal:

The goal is to compare several versions of SuSiE (e.g. using initialization or not, estimating prior variance or not) for different data sets using various numbers of effects. 

Inputs:

  - $pathX a string path for an n by p design matrix X (n is the number samples, p is the number of genes) 
  - $pathy a string path for an n vector y 
  - effect_num: a scalar the number of nonzero effects
  - pve: a scalar proportion variance explained
  - s_init: 1 denotes using L0Learn initialization, 0 otherwise
  - estimate_prior_variance: 0 denotes do not estimate prior variance, 0.2 denotes that using default prior variance 0.2, 1 denotes estimating prior variance from data
  
Outputs:

  - $fit a susie fit
  - $cs a susie cs
  - $n_iter a scalar number of iterations
  - $pred_err a scalar prediction error using 80% training and 20% testing
  - $cs_length a scalar number of confidence sets selected by SuSiE
  - $hit a scalar the number of cs sets that includes at least a true effect
  - $dup_bool a boolean 1 if there are duplicates among confidence sets, 0 otherwise 
  
# Data and simulation

Given a design matrix X and a binary vector y, we estimate the variance of y using glmnet and construct a simulated y both quantitatively and binarily (e.g. using logistic link). When creating a simulated y, we also allow for various number of effects (e.g. effect_num = 0, 1, 5, 10, 200). 

Input:
  - file path of data X and y

Output:
  - $sim_gaussian_y an n vector a simulated gaussian y
  - $sim_gaussian_largeEffect_y an n vector a simulated gaussian y when number of effects is 200
  - $sim_binary_y an n vector a simulated binary y
  - $sim_binary_largeEffect_y an n vector a simulated binary y when number of effects is 200

# Methods

  - susie for simulated gaussian y for small number of effects with or without initialization
  - susie for simulated gaussian y for large number of effects with or without initialization
  - susie for simulated binary y for small number of effects with or without initialization
  - susie for simulated binary y for large number of effects with or without initialization

# Run DSC

The main DSC file is `benchmarks.dsc`. To see what is available:

```
./benchmark.dsc -h
```

before running, 
```
rm -Rf benchmark.scripts.html benchmark.html benchmark

```

and to run the benchmark:

```
dsc benchmark.dsc --replicate 10
```

Or to run a minimal test benchmark, eg
```
dsc benchmark.dsc --truncate
```

