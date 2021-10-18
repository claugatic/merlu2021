rm(list=ls())
WD<- getwd()
setwd(WD)
#source("http://www.rforge.net/NCStats/InstallNCStats.R")

#Incorporacion de los puntos
#require(NCStats)
require(car)
require(MASS)
require(nnet)
require(FSAdata)
require(gdata)

dnip    = read.table('tabledia.prn', head=TRUE)
#out3    = read.table('out3mean.cvs', head=F,sep=",")

#> bmsy
#[1] 284497
#> Fmsy
#[1] 0.412079
#ssb=out3[,2]
#Fy=out3[,1]
#Fyr=Fy/2;
estatus = dnip
#estatus <- data.frame(cbind(mcomun.De$BD, mcomun.De$F))
colnames(estatus) <- c('serie','BD', 'F')
estatus$anio <- 1992:2021
bo <- 744041
FMSY <- .4120
BMSYrel <- .4*bo#284497
xxlim <- c(0, 5)
yylim <-c(0, 4)
Bref <- c(0.,.25,.5,0.95,1.05,5)

#X11()
#par(mgp=c(2.9, 1.8, 0))
#x11()
#png(file=paste("Dc1.png"), height=5, width=5, onefile=TRUE, family='Helvetica', pointsize=12)
png(file=paste("d00.png"))
par(mar=c(5, 7, 4, 2) + 0.1)
par(mgp = c(2, 1, 0))
options(scipen = 10)
plot(estatus$BD,estatus$F, type='n', ylim=yylim, xlim=xxlim, xlab='BD/BDrms', ylab=expression(F/F[mrs]), cex.axis=1.1, cex.lab=1.2,lab=c(20,10,10))
rect(par("usr")[1], par("usr")[4], par("usr")[2], par("usr")[4], col ="white")
# Agotado
rect(Bref[1], yylim[1], Bref[2], 1, col = '#636363', border = '#636363', lty = par("lty"), lwd = par("lwd"))
#sobre-explotado y en riesgo de agotamiento
rect(Bref[2], yylim[1], Bref[4], 1, col = '#7A7A7A', border = '#7A7A7A', lty = par("lty"), lwd = par("lwd"))
#Sobre-explotado
rect(Bref[4], yylim[1], Bref[4], 1, col = '#ADADAD', border = '#ADADAD', lty = par("lty"), lwd = par("lwd"))
#Plena explotacion #EBEBEB'
rect(Bref[4], yylim[1], Bref[5], 1, col = '#C2C2C2', border = '#C2C2C2', lty = par("lty"), lwd = par("lwd"))
#Subexplotado
rect(Bref[5], yylim[1], Bref[6], 1, col = 'grey', border = '#EBEBEB', lty = par("lty"), lwd = par("lwd"))




#===========================================================================
# zona sobre-pesca
rect(0, 1, 5,5, col = 'grey', border = 'darkgrey', lty = par("lty"), lwd = par("lwd"))
#segments(1,0,1,1,col='blue', lty=2,) #OBJETIVO
arrows(1.2, 1.2, 1,1, length = 0.25, angle = 20,code = 2, col = 'blue')
text(1.3,1.3,'PBRobjetivo',cex=0.6,col='blue')
segments(0.5,0,0.5,1,col='red', lty=2,) # limite
arrows(0.6, 1.2, 0.5,1, length = 0.25, angle = 20,code = 2, col = 'red')
text(0.6,1.3,'PBRlímite',cex=0.6,col='red')
text(0.12, 0.4, 'Agotado', srt=90,font=2, cex=0.7, col='white')
text(1, 1.5, 'Sobre Pesca', srt=0,font=2, cex=0.7, col='black') #gray30
text(1.5, 0.4, 'Sub explotado', srt=0,font=2, cex=0.7, col='black')
text(1, 0.4, 'Plena    explotación', srt=90,font=1, cex=0.6, col='black')
#text(0.87, 0.4, 'Explotación', srt=90,font=2, cex=0.7, col='black')
text(0.6, 0.4, 'Sobre explotado', srt=90,font=2, cex=0.7, col='white')
text(0.3, 0.45, 'Sobre explotado &', srt=90,font=2, cex=0.7, col='white')
text(0.38, 0.45, 'Riesgo agotamiento ', srt=90,font=2, cex=0.7, col='white')

lines(estatus$BD[1:30]/BMSYrel, estatus$F[1:30]/FMSY, type='l', pch=1, lty=3, ylim=yylim, xlim=xxlim)
points(estatus$BD[1:30]/BMSYrel, estatus$F[1:30]/FMSY,pch=5, ylim=yylim, xlim=xxlim,cex=0.5,col='blue')
#points(estatus$BD[1:28]/BMSYrel, estatus$F[1:28]/FMSY,pch=1, ylim=yylim, xlim=xxlim)
#points(estatus$BD[28]/BMSYrel, estatus$F[28]/FMSY,pch=19, col='black', ylim=yylim, xlim=xxlim)
text(estatus$BD[1:30]/BMSYrel, estatus$F[1:30]/FMSY,estatus$anio, cex=.8, col='brown')
dev.off()
