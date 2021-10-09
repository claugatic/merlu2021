library(tidyverse)
library(r4ss)
library(optimbase)


if(!"ChAnchoS" %in% installed.packages())
	devtools::install_github("lee-qi/ChAnchoS")

library(ChAnchoS)

rep.dir <- here::here("boot/Reports")
repnames <- list.files(rep.dir)
keyvec <- repnames %>% str_remove("Report") %>% str_remove(".sso")
Nboot <- length(repnames)
truerep <- SS_output(dir=here::here("boot"))
reps <- SSgetoutput(keyvec=keyvec,dirvec=rep.dir,
					getcovar=F,getcomp=F,forecast=F)
reps$truerep <- truerep
sumreps <- SSsummarize(reps)



reclutamiento <- SS_extract_vals(sumreps,"recruits")
biomasa <- SS_extract_vals(sumreps,"SpawnBio")
F <- SS_extract_vals(sumreps,"Fvalue")



year=seq(1990,2050)
library(reshape)
require(ggplot2)


bio=biomasa$est
rec=reclutamiento$est
Fs=F$est
colnames(bio)=c("1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023","2024","2025","2026",
"2027","2028","2029","2030","2031","2032","2033","2034","2035","2036","2037","2038","2039","2040","2041","2042","2043","2044",
"2045","2046","2047","2048","2049","2050")
colnames(rec)=c("1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023","2024","2025","2026",
"2027","2028","2029","2030","2031","2032","2033","2034","2035","2036","2037","2038","2039","2040","2041","2042","2043","2044",
"2045","2046","2047","2048","2049","2050")
colnames(Fs)=c("1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023","2024","2025","2026",
"2027","2028","2029","2030","2031","2032","2033","2034","2035","2036","2037","2038","2039","2040","2041","2042","2043","2044",
"2045","2046","2047","2048","2049","2050")



btr=biomasa$tru
recr=reclutamiento$tru
Fr=F$tru

mat1=  rbind(bio,btr)
mat2= rbind(rec,recr)
mat3= rbind(Fs,Fr)

m1=  bio
m2=  rec
m3=  Fs

databio=melt(mat1)
datarec=melt(mat2)
dataf=melt(mat3)

colnames(databio)=c("sim","year","valor")
colnames(datarec)=c("sim","year","valor")
colnames(dataf)=c("sim","year","valor")

datset1=databio
datset1 <- datset1[datset1$year<2021,,]
datset2=datarec
datset2 <- datset2[datset2$year<2021,,]
datset3=dataf
datset3 <- datset3[datset3$year<2021,,]

pdf(file=paste("Figuras/1.pdf"))
ggplot(datset1, aes(x = year, y = valor,group=sim)) +
 geom_line()+geom_line(data=databio[databio$sim=="btr",],colour="red")
dev.off()

pdf(file=paste("Figuras/2.pdf"))
ggplot(datset2, aes(x = year, y = valor,group=sim)) +
 geom_line()+geom_line(data=datarec[datarec$sim=="recr",],colour="red")
dev.off()

pdf(file=paste("Figuras/3.pdf"))
ggplot(datset3, aes(x = year, y = valor,group=sim)) +
 geom_line()+geom_line(data=dataf[dataf$sim=="Fr",],colour="red")
dev.off()


# MRE y MARE
#btr
#rec
#Fr
#dimensiones ie.31
m1=m1[,1:31]
m2=m2[,1:31]
m3=m3[,1:31]
#Dimens variale
btr=btr[1:31]
rec=rec[1:31]
Fr=Fr[1:31]
fila=dim(reclutamiento$est)[1]

mia=ones(nx = fila, ny = 31)


ma1=rep(btr,fila)
ma2=rep(rec,fila)
ma3=rep(Fr,fila)
dim(ma1) <- c(31,fila)
dim(ma2) <- c(31,fila)
dim(ma3) <- c(31,fila)

ma1=t(ma1)
ma2=t(ma2)
ma3=t(ma3)

oper1=(m1-ma1)/ma1;
oper1

oper2=(m2-ma2)/ma2;
oper2

oper3=(m3-ma3)/ma3;
oper3
#(BD-(ones(400,1)*BD_v))./(ones(400,1)*BD_v);


# Para histograma
data1=oper1[,28:31]
colnames(data1)=c("2017","2018","2019","2020")
odat1=melt(data1)
colnames(odat1)=c("sim","año","valor")
p1<-ggplot(odat1, aes(x=valor))+ geom_histogram(color="black",bins=30)+ggtitle("Biomasa")+
geom_vline(xintercept = 0,linetype="dashed", color = "red")+facet_wrap(~ año,ncol=2)+
 facet_wrap(~ año,ncol=2)
pdf(file=paste("B.pdf"))
p1
dev.off()


# Elava rep
data2=oper2[,28:31]
colnames(data2)=c("2017","2018","2019","2020")
odat2=melt(data2)
colnames(odat2)=c("sim","año","valor")
p2<-ggplot(odat2, aes(x=valor))+ geom_histogram(color="black",bins=30)+ggtitle("Reclutamiento(miles)")+
geom_vline(xintercept = 0,linetype="dashed", color = "red")+facet_wrap(~ año,ncol=2)+
 facet_wrap(~ año,ncol=2)
pdf(file=paste("R.pdf"))
p2
dev.off()


# Elava rep
data3=oper3[,28:31]
colnames(data3)=c("2017","2018","2019","2020")
odat3=melt(data3)
colnames(odat3)=c("sim","año","valor")

p3<-ggplot(odat3, aes(x=valor))+ geom_histogram(color="black",bins=30,alpha=1)+ggtitle("Mortalidad por pesca")+
geom_vline(xintercept = 0,linetype="dashed", color = "red")+facet_wrap(~ año,ncol=2)+xlim(-3, 3)
pdf(file=paste("F.pdf"))
p3
dev.off()





# Mare y MRE
#data1=as.matrix(data1)
#data2=as.matrix(data2)
#data3=as.matrix(data3)
#MRE
mre1=mean(oper1)
mre_sd1=sd(oper1)
mre1a=mean(abs(oper1))
mre_sd1a=sd(abs(oper1))


mre2=mean(oper2)
mre_sd2=sd(oper2)
mre2a=mean(abs(oper2))
mre_sd2a=sd(abs(oper2))



mre3=mean(oper3)
mre_sd3=sd(oper3)
mre3a=mean(abs(oper3))
mre_sd3a=sd(abs(oper3))


# tablas
tablax=data.frame(list(MRE1=mre1,sd1=mre_sd1,MRE2=mre2,sd2=mre_sd2,MRE3=mre3,sd3=mre_sd3 ))
tablax
tablay=data.frame(list(MARE1=mre1a,sd1=mre_sd1a,MARE2=mre2a,sd2=mre_sd2a,MARE3=mre3a,sd3=mre_sd3a ))
tablay
tablag=cbind(tablax,tablay)
tablag
write.table(tablag, file = "performanceCM.prn", sep = " ", col.names = T,qmethod = "double")


#reclut <- SS_extract_vals(sumreps,"recruits")
#Fmort <- SS_extract_vals(sumreps,"Fvalue")
