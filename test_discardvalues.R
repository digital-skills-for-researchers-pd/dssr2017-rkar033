#set working directory for ephys data files
setwd("/home/admin1/Desktop/Data/ephys")

#read dummy data file
dummyVmdat <- read.csv(file = "dummyephys.csv", header =FALSE)

#plot dummy data
plot(dummyVmdat, typ="l", xlab= "timepoint", ylab= "V")

#list of all time points
print(dummyVmdat[ ,1])

#list of all Vm measurements
print(dummyVmdat[,2])

#list Vm measurements when cell is polarized below 0mV, and find mean
for(displaypolarized) {
  if(dummyVmdat[,2]) < 0 
    (print(dummyVmdat[,2]))
 meanVm <- (mean(dummyVmdat[,2]))
 print(meanVm)
}

for(polarizedVm) {
  if(dummyVmdat[,2]) <-20
  print(dummyVmdat) 
}