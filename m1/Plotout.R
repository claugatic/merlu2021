#-----------------------------
# Para mas informacion de r4ss
# https://github.com/r4ss/r4ss
# ?r4ss
#-----------------------------

library(r4ss)
rm(list=ls()) 
WD<- getwd() 
setwd(WD)     
repfile <- SS_output(dir=WD)
mod.sum <- SSsummarize(list(repfile))
SStableComparisons(mod.sum)


 TOTAL_like 135.92500
2             Survey_like  -7.16760
3           Age_comp_like 112.14900
4        Parm_priors_like  28.16140
5    Recr_Virgin_millions 813.58600
6               SR_LN(R0)  13.60920
7       SR_RkrPower_steep   0.74661
8       NatM_p_1_Fem_GP_1   0.33000
9      L_at_Amax_Fem_GP_1  65.00000
10     VonBert_K_Fem_GP_1   0.15000
11 SSB_Virgin_thousand_mt 903.93900
12            Bratio_2017   1.08159
13          SPRratio_2016   0.56978



Label     model1
 TOTAL_like 138.414000

2             Survey_like  -3.058450
3           Age_comp_like 110.527000
4        Parm_priors_like  27.806500
5    Recr_Virgin_millions 825.907000
6               SR_LN(R0)  13.624200
7       SR_RkrPower_steep   0.784013
8       NatM_p_1_Fem_GP_1   0.330000
9      L_at_Amax_Fem_GP_1  65.000000
10     VonBert_K_Fem_GP_1   0.150000
11 SSB_Virgin_thousand_mt 917.627000
12            Bratio_2017   1.170080
13          SPRratio_2016   0.554065




SS_plots(repfile)

SSMethod.TA1.8(repfile, "age", 3)








SS_tune_comps(repfile, fleets = "all", option = "Francis",
digits = 6, write = TRUE)





SS_plots(tmp, uncertainty=T,datplot = T, png=T, aalresids = T,btarg=0.4,
         minbthresh=0.2,  forecast=T)