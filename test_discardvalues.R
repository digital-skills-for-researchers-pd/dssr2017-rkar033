#set working directory for ephys data files
setwd("/home/admin1/Desktop/Data/ephys")

#read dummy data file, a two column series that mimicks a typical electrophys data file:
dummyVmdat <- read.csv(file = "dummyephys.csv", header =TRUE)

#note this dataframe contains points where a cell is initially polarised (considered healthy), 
#vs depolarised for a long period (consider unhealthy), ideally my final analysis 

#basic r line graph of dummy data, without markers (typ="l"), and axis labels
plot(dummyVmdat, typ="l", xlab= "timepoint", ylab= "V")

#generate list of all time points
print(dummyVmdat[ ,1])

#generate list of all Vm measurements, and work out overall mean of Vm 
print(dummyVmdat[,2])
mean(dummyVmdat[,2])

#extract Vm measurements when dummy cell is polarized below 0mV, and find mean
extractVm <- subset(dummyVmdat, dummyVmdat[,2] <= 0)
print(extractVm)
mean(extractVm[,2])

#extract Vm measurements when cell is polarized below 0mV at time points before t=8, and find mean
#this is learning to subset entries using two variables
extractVm <- subset(dummyVmdat, dummyVmdat[,1] <8 & dummyVmdat[,2] <= 0)
print(extractVm)
mean(extractVm[,2])

#extract Vm measurements when cell is polarized below -20mV at time points before t=8, and find mean
extractVm <- subset(dummyVmdat, dummyVmdat[,1] <8 & dummyVmdat[,2] <= -20)
print(extractVm)
mean(extractVm[,2])

#trying out ggploting of this data. 
#Note this takes more computational power, so graphs on real electrophys files take ages to run
library(ggplot2)
#basic scatter plot of dummy data in ggplot
ggplot2::qplot(dummyVmdat[,1], dummyVmdat[,2], xlab= "time", ylab= "V")

#basic ggplot, isnt working at the moment when specifying x and y as part of aesthetic arguement :(
ggplot2::ggplot(data= dummyVmdat, aes(x= Time, y= V)) + geom_point()

# ggplot, specifying x and y vectors within  data frame. Also made it a line plot
ggplot2::qplot(x= dummyVmdat[,1], y= dummyVmdat[,2], xlab= "time", ylab= "V") + 
  geom_line(color= "#3333CC")

#The following defines the base layer of the ggplot. Need to add layers to this, as follows
#ggplot2::ggplot(x= dummyVmdat[,1], y= dummyVmdat[,2], xlab= "Time", ylab= "V") + geom_line(color= "black")
ggplot2::ggplot(data= dummyVmdat, aes(x= Time, y= V)) + 
  geom_point(alpha= 0.2, colour= "blue") + 
  geom_line(colour =  "red", alpha= 0.4)

#ggplot including fitting models. Default method is loess- join the dots. 
#Specifying method= "lm" instead computes a linear model
ggplot2::ggplot(data= dummyVmdat, aes(x= Time, y= V)) + 
  geom_point(alpha= 0.8, colour= "blue") + 
  geom_line(alpha= 0.5, colour= "cyan") + 
  geom_smooth(level= 0.95, colour= "pink") #+
  #xlim or ylim in coord_cartesian argument pretty much work as a magnifying glass
  #coord_cartesian(xlim = -0.4:8)
 
#Now trying to ggplot the dummy data points only where Vm is <-20 mV
#ggplot extracted Vm dataframe, where Vm is polarized below -20mV.
extractVm <- subset(dummyVmdat, dummyVmdat[,2] <= -20)
print(extractVm)
mean(extractVm[,2])
ggplot2::ggplot(data= extractVm, aes(x= Time, y= V))
ggplot2::qplot(extractVm[,1], extractVm[,2])
ggplot2::ggplot(extractVm[,1], extractVm[,2])

# Learned that the best way to work with time series data is to start with a moving average calculation
#Assign variable v to column two (Vm) of data
V <- dummyVmdat[,2]
returnValue(V)

#calculate moving mean in V, effectively smoothing fluctuations in the i points 
#note specify the calculation to account for both sides flanking i point: 2 sides; 
#note default filter method arguement is set to "convolution" ie Filter(method = c("convolution")
#to work out moving mean of every two values from 1 to i, evenly weighted, use kernel 1,1
#need to divide by 2, because the filter kernel size is 2
filter(V, c(1,1), sides = 2, method=c("convolution")) / 2

#calculate moving mean in V as the running mean equally weighted over 3 values; 
filter(V, c(1,1,1), sides=2, method=c("convolution")) / 3

#extract Vm measurements when cell is polarized below -20mV at time points before t=8, and find mean
extractV <- subset(dummyVmdat, dummyVmdat[,1] <8 & dummyVmdat[,2] <= -20)
print(extractV)
mean(extractV[,2])
               