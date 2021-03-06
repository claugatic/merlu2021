
#-----------------------------
# Para mas informacion de r4ss
# https://github.com/r4ss/r4ss
# ?r4ss
#-----------------------------

library(r4ss)
library(reshape)
require(ggplot2)
rm(list=ls()) 
WD<- getwd() 
setwd(WD)     
repfile <- SS_output(dir=WD)


SS_tune_comps(repfile, fleets = "all", option = "Francis",digits = 6, write = TRUE)

SS_tune_comps(repfile, fleets = "all", option = "MI",digits = 6, write = TRUE)


mire=repfile
names(mire)
#mire$natage

mire$exploitation
mire$exploitation$Artesanal_nd

m=mire$exploitation
d <- m[m$Yr<2021,,]
data=melt(d,id.vars = c("Yr","Seas","F_report"))
dat<-subset(data,select=c(Yr,variable,value));
colnames(dat) <- c("año","flota","F")
dat
###########################################################################




pdf(file=paste("plots/flotas.pdf"),width = 8, height = 4)
ggplot(dat, aes(x=año, y=F, group=flota)) +  geom_line(aes(color=flota))+  geom_point(aes(color=flota))+
labs(y = "F",x="año")+theme_classic()
dev.off()



write.table(m, file = "tablaF.prn", sep = " ", col.names = T,qmethod = "double")

muestra=mire$Age_comp_Eff_N_tuning_check
write.table(muestra, file = "muestra.prn", sep = " ", col.names = T,qmethod = "double")



#reclut <- SS_extract_vals(sumreps,"recruits")
#Fmort <- SS_extract_vals(sumreps,"Fvalue")
