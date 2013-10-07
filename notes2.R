##

##################################################################################
##
## Z-Test
## Note: requires assumptions of CLT and large enough sample size
## one-sided 5% type one error
## 0.05 = P(Z >= (C - x) / (sd / sqrt(sample size)))
## where x = sample mean, C is unknown population mean
## To get Z: qnorm(0.95, lower.tail = FALSE)
qnorm(0.95, lower.tail = FALSE) * 0.4 + 12 ## 11.34

## Gosset T (Student T) Test (heavier tailed than the standard normal)
## Use in place of Z-test (or just all the time) for small sample sizes
## Limits the standard normal as sample size gets large, so can always just err on the side of using Gosset T
## Same as Z-test except replace normal quantiles with appropriate Student's T quantiles
##  and n-1 df
## Example: Say we had a sample size of 16 and a pop. mean of 30, some sd, and we
##  want to know what our sample mean would have to be to reject the null hypothesis that
##  the sample mean is less than or equal to the pop. mean at 5% confidence (one-sided)
## Then we get:
##  0.05 = P( (X - 30)/(sd/sqrt(16)) >= t_(1-alpha, 15) | u = 30 )
##  => test statistic: sqrt(16) * (X - 30)/sd
##  => critical t-value: t_(1-alpha, 15) = 1.75
##
## If we wanted a two-sided test (to test that hypothesis that u != 30):
## alpha = P( abs( (X - 30)/(sd/sqrt(16)) ) > t_(1-alpha/2, 15) | u = 30 )
##
## Note: it is harded to reject the null under two-sided test, so if didnt reject under
##  one-sided, wont reject under two-sided
##
## What it looks like, shaded for two-sided 5% with 15 df (like example)
xval <- seq(-4, 4, length.out = 1000)
yval <- dt(xval, 15)
plot(xval, yval, type = "l", lwd = 3, xlab = "", ylab = "")
x <- seq(qt(0.975, 15), 4, length.out = 100)
polygon(c(x,rev(x)), c(dt(x, 15), rep(0,length(x))), col = "salmon")
text(qt(0.99,15)+.5, .05, "2.5%", cex = 2)
text(qt(0.975, 15), 0.02, as.character(round(qt(0.975, 15), 2)), cex = 2)
x <- seq(qt(.025, 15), -4, length = 100)
polygon(c(x,rev(x)), c(dt(x, 15), rep(0, length(x))), col = "salmon")
text(qt(0.01,15)-.5, .05, "2.5%", cex = 2)
text(0, 0.1, "95%", cex = 2)
abline(v = 0, lty = 2)

## T distribution in R:
## To get the critical value for the above example:
## qt(1-0.05, 15, lower.tail=FALSE)
## To calculate the probability of obtaining a test statistic of, say, 0.8 under 15 df:
## pt(0.8, 15, lower.tail = FALSE)
##
## T-test in R:
## # independent 2-group t-test
## t.test(y~x) # where y is numeric and x is a binary factor

## # independent 2-group t-test
## t.test(y1,y2) # where y1 and y2 are numeric

## # paired t-test
## t.test(y1,y2,paired=TRUE) # where y1 & y2 are numeric

## # one sample t-test
## t.test(y,mu=3) # Ho: mu=3

## Paired and unpaired t-test, two-sided 5%
bpress <- read.table(text = "Baseline 	Week 2
140 	138
138 	136
150 	148
148 	146
135 	133", header = TRUE, sep = "\t")
boxplot(bpress$Baseline, bpress$Week.2)
sampsize = 5
mean1 = mean(bpress$Baseline)
mean2 = mean(bpress$Week.2)
