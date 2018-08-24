#check_duplicate_cs.R
#' @title check the produced if confidence sets are duplicated 
#' @param cs a list a susie cs set from susie fit 
#' @return a boolean 1 if duplicated, 0 otherwise
check_duplicate_cs = function(cs){
  cs.length = length(cs)
  if (cs.length==0){
    return(0)
  }else{
    
    cs.vec = unlist(cs)
    if (sum(duplicated(cs.vec))>0){
      return(1)
    }else{
      return(0)
    }
  }
  
}