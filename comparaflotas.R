#-----------------------------
# Para mas informacion de r4ss
# https://github.com/r4ss/r4ss
# ?r4ss
#-----------------------------

library(r4ss)
rm(list=ls()) 
WD<- getwd() 
setwd(WD)     


# directories where models were run need to be defined
# Modelo 1 sin descarte, modelo 2 con descarte
#mod1 <- 'c:/CEGM/MODEL/merluza/M21/ES/m1sd/'#mod2          con descarte
#mod2 <- 'c:/CEGM/MODEL/merluza/M21/ES/m2l/' #mod1 sin descarte
#mod3 <- 'c:/CEGM/MODEL/merluza/M21/ES/m3/' #mod1 sin descarte
#mod4 <- 'c:/CEGM/MODEL/merluza/M21/ES/m4/' #mod1 sin descarte
#mod3 <- 'c:/CEGM/MODEL/merluza/M21/ES/m3/' #mod1 sin descarte

m00 <- 'c:/CEGM/MODEL/merluza/M21/E2021/m00/'
m01 <- 'c:/CEGM/MODEL/merluza/M21/E2021/m01/'
m1 <- 'c:/CEGM/MODEL/merluza/M21/E2021/m1/'
m2 <- 'c:/CEGM/MODEL/merluza/M21/E2021/m2/'
m3 <- 'c:/CEGM/MODEL/merluza/M21/E2021/m3/'
m4 <- 'c:/CEGM/MODEL/merluza/M21/E2021/m4/'
m5 <- 'c:/CEGM/MODEL/merluza/M21/E2021/m5/'
#m6 <- 'c:/CEGM/MODEL/merluza/M21/E2021/m00bad/'

dc='c:/CEGM/MODEL/merluza/M21/E2021/scompara/'




# read two models
m00 <- SS_output(dir=m00)
m01 <- SS_output(dir=m01)
m1 <- SS_output(dir=m1)
m2 <- SS_output(dir=m2)
m3 <- SS_output(dir=m3)
m4 <- SS_output(dir=m4)
m5 <- SS_output(dir=m5)
#m6 <- SS_output(dir=m6)
mod.sum <- SSsummarize(list(m00,m01,m1,m2,m3,m4,m5));

t1=SStableComparisons(mod.sum)
t1


# Tablas de likelihood



# create list summarizing model results




# Hacer figuras de comparaciones
#SSplotComparisons(mod.sum)

SSplotComparisons(mod.sum, subplots = 1:20, plot = TRUE,
print = TRUE, png = TRUE, models = "all",legendlabels=c("m00","m01","m1","m2","m3","m4","m5"),
endyrvec = "default", indexfleets = NULL, indexUncertainty = FALSE,
indexQlabel = TRUE, indexQdigits = 4, indexSEvec = "default",
indexPlotEach = FALSE, labels = c("Year", "Spawning biomass (t)",
"Fraction of unfished", "Age-0 recruits (1,000s)",
"Recruitment deviations", "Index", "Log index", "1 - SPR", "Density",
"Management target", "Minimum stock size threshold", "Spawning output",
"Harvest rate"), col = NULL, shadecol = NULL, pch = NULL,
lty = 1, lwd = 2, spacepoints = 10, staggerpoints = 1,
initpoint = 0, tickEndYr = TRUE, shadeForecast = TRUE,
xlim = "default", ylimAdj = 1.05, xaxs = "i", yaxs = "i",
type = "o", uncertainty = TRUE, shadealpha = 0.1, legend = TRUE,
legendloc = "topright",
legendorder = "default", legendncol = 1, sprtarg = NULL,
btarg = NULL, minbthresh = NULL, pwidth = 6.5, pheight = 5,
punits = "in", res = 300, ptsize = 10, cex.main = 1,
plotdir = dc, filenameprefix = "", densitynames = c("SSB_Virgin",
"R0"), densityxlabs = "default", rescale = TRUE, densityscalex = 1,
densityscaley = 1, densityadjust = 1, densitysymbols = TRUE,
densitytails = TRUE, densitymiddle = FALSE, densitylwd = 1,
fix0 = TRUE, new = TRUE, add = FALSE, par = list(mar = c(5, 4, 1,
1) + 0.1), verbose = TRUE, mcmcVec = FALSE,
show_equilibrium = TRUE)




t1=SStableComparisons(mod.sum)
t1


#SSMethod.TA1.8(mode1, "age", 3)

#SS_tune_comps(mode1, fleets = "all", option = "Francis",
#digits = 6, write = TRUE)

write.table(t1, file = "pbrcompar.prn", sep = " ", col.names = T,qmethod = "double")

