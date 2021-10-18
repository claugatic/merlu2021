library(r4ss)

mydir <- "c:/CEGM/MODEL/merluza/M21/E2021/m00/"
#SS_doRetro(masterdir=mydir, oldsubdir="", newsubdir="retrospectives", years=0:-5)
# okey
retroModels <- SSgetoutput(dirvec=file.path(mydir, "retrospectives",paste("retro",0:-5,sep="")))

retroSummary <- SSsummarize(retroModels)
endyrvec <- retroSummary$endyrs + 0:-5

dc='c:/CEGM/MODEL/merluza/M21/E2021/m00/retro'
SSplotComparisons(retroSummary, endyrvec=endyrvec, legendlabels=paste("Data",0:-5,"years"),plot = TRUE,
print = TRUE, png = TRUE, models = "all",plotdir = dc)



#endyrvec <- retroModels[[1]]$endyr-10:0
pdf(file=paste("m00/retro/recruitsd.pdf"))
SSplotRetroRecruits(retroSummary, endyrvec=endyrvec, cohorts=2010:2020,relative=TRUE, legend=FALSE)
dev.off()





SSmohnsrho(retroSummary, endyrvec = NULL, startyr = NULL, verbose = TRUE)
#SSmohnsrho(retroSummary, endyrvec = 2020, startyr = 2016, verbose = TRUE)
# retrospective analyses
