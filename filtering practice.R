## generate test data with 3 peaks
set.seed(123)
x <- seq(0, 360, length = 20)
y <- abs(rnorm(20, mean = 1, sd = 0.1))
y[5:10] <- c(2, 4, 7, 3, 4, 2)
y <- c(y, 0.8 * y, 1.2 * y)
x <- seq(0, 360, along = y)
y[6] <- y[7]   # test case with 2 neighbouring equal points

## plot the test data
plot(x, y, type="b")

#moving average, with kernals weighting middle value (i.e. point in x) twice as values on either side
yFilter<- filter(y, c(1,2,1), sides = 2, method=c("convolution")) / 4
max(yFilter)
plot(x, yFilter, type = "b")

#moving average, with kernals equally weighted
yFilter<- filter(y, c(1,1,1), sides = 2, method=c("convolution")) / 3
plot(x, yFilter, type= "b")