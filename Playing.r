#Playing with R: initialising .csv files: 
*2 column. [ ,1] is time (ms), [ ,2] is cell membrane potential (mV). 
*Entries in [1, 1:2] are 'headers' so TRUE

#set working directory for ephys data files.Used terminal pwd to print location
setwd("/home/admin1/Desktop/Data/ephys")
#read ctrl data file
read.csv(file = "160332_ctrl_10xreduced.csv", header =TRUE)
ctrl_firing <- read.csv(file = "160332_ctrl_10xreduced.csv", header =TRUE)
#print a preview of first few lines in the data array
head(ctrl_firing)
#dimension of data file 
dim(ctrl_firing)
??slice
#checking the first 10 recorded time points, against original data file.
ctrl_firing[1:10, ]
plot(ctrl_firing)
#plot is strange. Max values displayed are out of range. Check this
max(ctrl_firing[ ,2])
min(ctrl_firing[ ,2])

#read 4-mu data file
read.csv(file = "160311_4mu_10xreduced.csv", header =TRUE)
Fmu_firing <- read.csv(file = "160311_4mu_10xreduced.csv", header =TRUE)
head(Fmu_firing)
dim(Fmu_firing)
??slice
Fmu_firing[1:10, ]
plot(Fmu_firing)
#plot is perfect with values in range
max(Fmu_firing[ ,2])
min(Fmu_firing[ ,2])
", header =TRUE)

#playing with plot colours
plot(Fmu_firing, col="purple")
plot(Fmu_firing, typ="l", col="pink")
??plot
?plot
mean(Fmu_firing[ ,2])
