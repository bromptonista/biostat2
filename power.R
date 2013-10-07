## Estimating statistical power
## The probability of rejecting the null hypothesis when its false
## 80% is a standard for power in biostats

## calculate the power for a t test using monte carlo
nosim <- 100000
n <- 16
sigma <- 4
mu0 <- 30
mua <- 32
z <- rnorm(nosim)
xsq <- rchisq(nosim, df = 15)
t <- qt(0.95, 15)
mean(z + sqrt(n)*(mua - mu0) / sigma >
     t / sqrt(n - 1) * sqrt(xsq))

## using power.t.test (delta is the 'effect size', which is (mua - mu0) / sigma
## These two are equivalent, and should come out very close to the monte carlo
##  simulation above.
power.t.test(n = 16, delta = 2 / 4, type = "one.sample", alt = "one.sided")
power.t.test(n = 16, delta = 2, sd = 4, type = "one.sample", alt = "one.sided")
