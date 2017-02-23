#read 4-mu data file
read.csv(file = "160311_4mu_10xreduced.csv", header =TRUE)
Fmu_firing <- read.csv(file = "160311_4mu_10xreduced.csv", header =TRUE)
head(Fmu_firing)
dim(Fmu_firing)

#plot 4-mu time series data as a line graph
plot(Fmu_firing, typ="l", col="pink", xlab="Time (ms)", ylab= "Vm  (mV)")
