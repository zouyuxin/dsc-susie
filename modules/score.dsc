# score modules
score: score.R + R(score_res=compute_scores(cs, beta_idx, pip))
  cs: $cs
  beta_idx: $beta_idx
  pip: $pip
  $hit: score_res$hit
  $signal_num: score_res$signal_num
  $cs_medianSize: score_res$cs_medianSize
  $top_hit: score_res$top_hit
  $dup_bool: score_res$dup_bool
  