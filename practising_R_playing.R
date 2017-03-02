#set working directory for ephys data files
setwd("/home/admin1/Desktop/Data/ephys")
#read ctrl data file
read.csv(file = "160332_ctrl_10xreduced.csv", header =TRUE)
ctrl_firing <- read.csv(file = "160332_ctrl_10xreduced.csv", header =TRUE)
head(ctrl_firing)
dim(ctrl_firing)
??slice
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

Fmu_firing[1:10, ]
plot(Fmu_firing)
#plot is perfect with values in range
max(Fmu_firing[ ,2])
min(Fmu_firing[ ,2])
#", header =TRUE)

#playing with plot colours
plot(Fmu_firing, col="purple")
plot(Fmu_firing, typ="l", col="pink", xlab="Time (ms)")

mean(Fmu_firing[ ,2])


#trying to export plot to svg
svg(filename="Fmu_firing.svg", 
    width=5, 
    height=4, 
    pointsize=12)
my_sc_plot(data)
dev.off()

mean(ctrl_firing[ ,2])

#learning box plots
<<<<<<< HEAD
boxplot(Fmu_firing[ ,2], col="cyan")
=======
boxplot(Fmu_firing[ ,2], col="red")
>>>>>>> e3e647e715852c4e6d8e1c43cd819a8d19aab247
boxplot(ctrl_firing[ ,2])

#can you add two box plots together?
boxplot(Fmu_firing[ ,2], col="magenta")
boxplot(ctrl_firing[ ,2], col="cyan")

boxplot(ctrl_firing, at=1)
boxplot(Fmu_firing, at=2, add=TRUE)


#list files in working directory
list.files()

#millisecond to min conversion

ms_to_min <- function(time) {
  min <- ((Fmu_firing[ ,1] )/60000) 
  return(time)
}

<<<<<<< HEAD
#combine two columns of Vm data from 2 separate files
dim(Fmu_firing)
dim(ctrl_firing)

#note the two columns dont have the same number of entries. So, when combining, need to truncate the extra one
ombined <- cbind(Fmu_firing[1:609100 ,2], ctrl_firing[ 609100,2])

#now playing with boxplot options
#basic boxplot
boxplot(ombined)
#boxplot specifying names of x , with vertical axis labesl
boxplot(ombined, las = 2, names = c("4-MU", "Ctrl"))

#boxplot specifying names of x , with colors for each and axis title labels 
boxplot(ombined, las = 1, names = c("4-MU", "Ctrl"), col = c("royalblue2", "blue"), ylab = 'Vm (mV)', xlab = 'Treatment')

#ggplot playing 

library(ggplot2)

ggplot2::qplot(Fmu_firing[,1], Fmu_firing[,2], xlab= "time (ms)", ylab= "Vm  (mV)") + geom_line(color= "#3333CC") + geom_point(color= "#cc3399")

ggplot2::qplot(Fmu_firing[,1], Fmu_firing[,2], xlab= "time (ms)", ylab= "Vm  (mV)")

ggplot2::ggplot(data=Fmu_firing,aes(x= Time, y= mV)) + 
  geom_line(color= "#3333CC")

# Calculate slope and intercept of line of best fit
coef(lm(mV ~ Time, data = Fmu_firing))

#ggplot with line of best fit, using coefficients calculated and returned above step
ggplot2::ggplot(data=Fmu_firing,aes(x= Time, y= mV)) + 
  +   geom_line(color= "#3333CC") + geom_abline(intercept = -20, slope= 5.7e-6)

# Calculate correlation coefficient
with(Fmu_firing, cor(mV, Time, use = "everything", method = "pearson"))
