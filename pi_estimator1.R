
setwd("~/Google Drive/Coursera_R/MonteCarlo")

# set the number of runs
Nrun <- 100

#clear any previous values in Pi_est
Pi_est <- c(0)
Pi_est <- Pi_est[0] 

for (i in 0:Nrun) {

  en <- 10000 #number of iterations per run
  X <- runif(en, 0, 1)
  Y <- runif(en, 0, 1)
  R = sqrt(X^2 + Y^2)
  
  # P represents the points within area of the quarter circle
  P = length(R[R<=1])
  
  # P/en represents the area of the quarter circle
  # Pi_est is an estimate of pi
  Pi_est <- c(Pi_est, 4*P/en)
  
}

options(digits=6)
summary(Pi_est, digits=6)
hist(Pi_est)


df <- as.data.frame(cbind(X, Y, R))
df$gp <- "Red"
df$gp[df$R<=1] <- "Blue"

# Plot the points on a square plot
par(pty="s")
plot(df$X, df$Y, col=df$gp)


