rm(list=ls())
WD<- getwd()
setwd(WD)
library(PBSadmb)
library(xtable)

TABLA1= 			read.table(file = "performanceCM.prn", header = T,na.strings = ",")
TABLA2= 			read.table(file = "pbrcompar.prn", header = T,na.strings = ",")
tabla.1=                xtable(TABLA1)
tabla.2=                xtable(TABLA2)

print.xtable(tabla.1, type="latex", file="perform.tex", append=F, caption.placement="top")
print.xtable(tabla.2, type="latex", file="pbr_comparison.tex", append=F, caption.placement="top")
