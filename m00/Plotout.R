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
SS_plots(repfile)



SS_tune_comps(repfile, fleets = "all", option = "Francis",
digits = 6, write = TRUE)
SSMethod.TA1.8(repfile, "age", 3)



mod.sum <- SSsummarize(list(repfile))
SStableComparisons(mod.sum)











