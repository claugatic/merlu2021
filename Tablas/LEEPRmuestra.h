rm(list=ls())
WD<- getwd()
setwd(WD)
library(PBSadmb)
library(xtable)

TABLA1= 			read.table(file = "muestra.prn", header = T,na.strings = ",")
tabla.1=                xtable(TABLA1)
print.xtable(tabla.1, type="latex", file="muestra.tex", append=F, caption.placement="top")
