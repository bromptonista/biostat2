## R code for the standard normal

qnorm(.95) ## returns the Z-value corresponding to 95% confidence interval

xval <- seq(-3.2, 3.2, length = 1000)
yval <- dnorm(xval)
plot(xval, yval, type = "l", axes = TRUE, frame = FALSE, lwd = 3, xlab = "", ylab = "")
x <- seq(qnorm(0.95), 3.2, length = 100)
polygon(c(x, rev(x)), c(dnorm(x), rep(0, length(x))), col = "salmon")
x1 <- seq(qnorm(0.05), -3.2, length = 100)
polygon(c(x1,rev(x1)), c(dnorm(x1), rep(0, length(x1))), col = "salmon")

## add some summary stats
text(mean(x), mean(dnorm(x)) + 0.2, "%95", cex = 2)
text(mean(x1), mean(dnorm(x1)) + 0.2, "%5", cex = 2)
abline(v = 0, lty = 2)
text(0,0.2, "Da Mean")
text(qnorm(0.95)+0.7, .1, "1.645", cex = 2)
text(qnorm(0.05)-0.7, .1, "-1.645", cex = 2)

f <- function(x) {0.4 + (.4/3)*x }
integrate(f, -3,0)
curve(f, add = TRUE)
curve(f)

qnorm(0.05)
x <- seq(qnorm(0.05), -3.2, length = 100)
polygon(c(x,rev(x)), c(dnorm(x), rep(0, length(x))), col = "salmon")

polygon(x = c(-3,0, 0), y = c(0, .4, 0),fillOddEven = TRUE, density = c(50))



