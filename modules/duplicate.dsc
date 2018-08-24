# duplicate modules
check_duplicate_cs: check_duplicate_cs.R + R(dup_bool=check_duplicate_cs(cs))
  cs: $cs
  $dup_bool: dup_bool

  
  