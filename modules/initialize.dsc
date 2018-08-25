# initialize module
init_susie: initialize.R + \
                        R(s_init=init_susie(s_bool,init_method,pathX,sim_y,train_n))
  pathX: $pathX
  sim_y: $sim_y
  train_n: $train_n
  s_bool: 0
  init_method: 0
  $s_init: s_init
  
init_susieL0(init_susie):
  s_bool: 1
  init_method: "L0Learn"
  

  

  