#extract rds from benchmark

library(dscrutils)
dscout_Q1 = dscquery(dsc.outdir='benchmark', targets=c('sim_gaussian', 'susie', 'score', 
                                                    'sim_gaussian.effect_num','sim_gaussian.pve', 'sim_gaussian.mean_corX',
                                                    'susie.avg_purity', 'score.hit', 'score.signal_num',
                                                    'score.cs_medianSize', 'score.top_hit'))
saveRDS(dscout_Q1, 'dscout_Q1.rds')

dscout_Q2 = dscquery(dsc.outdir='benchmark', targets=c('sim_gaussian', 'susie_prior', 'score', 
                                                       'sim_gaussian.effect_num','sim_gaussian.pve', 'sim_gaussian.mean_corX',
                                                       'susie_prior.avg_purity', 'susie_prior.prior', 'score.hit', 'score.signal_num',
                                                       'score.cs_medianSize', 'score.top_hit'))
saveRDS(dscout_Q2, 'dscout_Q2.rds')

dscout_Q3 = dscquery(dsc.outdir='benchmark', targets=c('sim_gaussian_large', 'susie_large', 'score', 
                                                       'sim_gaussian_large.effect_num','sim_gaussian_large.pve', 'sim_gaussian_large.mean_corX',
                                                       'susie_large.avg_purity', 'score.hit', 'score.signal_num',
                                                       'score.cs_medianSize', 'score.top_hit'))
saveRDS(dscout_Q3, 'dscout_Q3.rds')

##########################################################################################################################################
dscout_large = dscquery(dsc.outdir='benchmark', targets=c('susie_large', 'susie_large.fit'))
saveRDS(dscout_large, 'dscout_large.rds')
##########################################################################################################################################

singlecell_Q1 = dscquery(dsc.outdir='singlecell', targets=c('sim_gaussian', 'susie', 'score', 
                                                       'sim_gaussian.effect_num','sim_gaussian.pve', 'sim_gaussian.mean_corX',
                                                       'susie.avg_purity', 'score.hit', 'score.signal_num',
                                                       'score.cs_medianSize', 'score.top_hit'))
saveRDS(singlecell_Q1, 'singlecell_Q1.rds')

singlecell_Q2 = dscquery(dsc.outdir='singlecell', targets=c('sim_gaussian', 'susie_prior', 'score', 
                                                       'sim_gaussian.effect_num','sim_gaussian.pve', 'sim_gaussian.mean_corX',
                                                       'susie_prior.avg_purity', 'susie_prior.prior', 'score.hit', 'score.signal_num',
                                                       'score.cs_medianSize', 'score.top_hit'))
saveRDS(singlecell_Q2, 'singlecell_Q2.rds')

singlecell_Q3 = dscquery(dsc.outdir='singlecell', targets=c('sim_gaussian_large', 'susie_large', 'score', 
                                                       'sim_gaussian_large.effect_num','sim_gaussian_large.pve', 'sim_gaussian_large.mean_corX',
                                                       'susie_large.avg_purity', 'score.hit', 'score.signal_num',
                                                       'score.cs_medianSize', 'score.top_hit'))
saveRDS(singlecell_Q3, 'singlecell_Q3.rds')

##########################################################################################################################################
gsea_Q1 = dscquery(dsc.outdir='gsea', targets=c('sim_gaussian', 'susie', 'score', 
                                                            'sim_gaussian.effect_num','sim_gaussian.pve', 'sim_gaussian.mean_corX',
                                                            'susie.avg_purity', 'score.hit', 'score.signal_num',
                                                            'score.cs_medianSize', 'score.top_hit'))
saveRDS(gsea_Q1, 'gsea_Q1.rds')

gsea_Q2 = dscquery(dsc.outdir='gsea', targets=c('sim_gaussian', 'susie_prior', 'score', 
                                                            'sim_gaussian.effect_num','sim_gaussian.pve', 'sim_gaussian.mean_corX',
                                                            'susie_prior.avg_purity', 'susie_prior.prior', 'score.hit', 'score.signal_num',
                                                            'score.cs_medianSize', 'score.top_hit'))
saveRDS(gsea_Q2, 'gsea_Q2.rds')

gsea_Q3 = dscquery(dsc.outdir='gsea', targets=c('sim_gaussian_large', 'susie_large', 'score', 
                                                            'sim_gaussian_large.effect_num','sim_gaussian_large.pve', 'sim_gaussian_large.mean_corX',
                                                            'susie_large.avg_purity', 'score.hit', 'score.signal_num',
                                                            'score.cs_medianSize', 'score.top_hit'))
saveRDS(gsea_Q3, 'gsea_Q3.rds')

##########################################################################################################################################
random_Q1 = dscquery(dsc.outdir='random', targets=c('sim_gaussian', 'susie', 'score', 
                                                'sim_gaussian.effect_num','sim_gaussian.pve', 'sim_gaussian.mean_corX',
                                                'susie.avg_purity', 'score.hit', 'score.signal_num',
                                                'score.cs_medianSize', 'score.top_hit'))
saveRDS(random_Q1, 'random_Q1.rds')

random_Q2 = dscquery(dsc.outdir='random', targets=c('sim_gaussian', 'susie_prior', 'score', 
                                                'sim_gaussian.effect_num','sim_gaussian.pve', 'sim_gaussian.mean_corX',
                                                'susie_prior.avg_purity', 'susie_prior.prior', 'score.hit', 'score.signal_num',
                                                'score.cs_medianSize', 'score.top_hit'))
saveRDS(random_Q2, 'random_Q2.rds')

random_Q3 = dscquery(dsc.outdir='random', targets=c('sim_gaussian_large', 'susie_large', 'score', 
                                                'sim_gaussian_large.effect_num','sim_gaussian_large.pve', 'sim_gaussian_large.mean_corX',
                                                'susie_large.avg_purity', 'score.hit', 'score.signal_num',
                                                'score.cs_medianSize', 'score.top_hit'))
saveRDS(random_Q3, 'random_Q3.rds')


