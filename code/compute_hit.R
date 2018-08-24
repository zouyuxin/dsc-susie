#compute_hit.R
#' @title compute the number of right cs sets that contain at least a true signal
#'        we assume that if a suse cs set contains true signal, then that set is 'hit' 
#' @param cs a list a susie cs set from susie fit 
#' @param beta_idx a vector of index for true signals
#' @return hit a scalar the number of right cs sets
compute_hit = function(cs, beta_idx){
  cs.length = length(cs)
  hit = 0
  if (cs.length!=0){
    for (i in 1:cs.length){
      if (any(cs[[i]]%in%beta_idx)) hit=hit+1
    }
  }
  return(list(hit=hit, cs_length=cs.length))
}




