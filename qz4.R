## What is the delta method asymptotic standard error of p^ where p^ is X/n where X∼Binomial(n,p)?



########################### HW ####################################################333
## OK - use a two-sample binomial proportion test, where n1=n2=100,p1=0.7,p2=0.15. Use a two-tailed z-test. There's no need to do modeling. You can get the answer in 5 lines of R code (or 1, if you don't use intermediate variables). Hope this helps.

## Question 3: Score statistic =
## TS = (p1_hat - p2_hat) / sqrt(p_hat(1 - p_hat)(1/n1 + 1/n2))
##  where p_hat = (X+Y)/(n1+n2) is the estimate of the common proportion under the
##   null hypothesis
n = 100
p1 = 0.7
p2 = 0.15
TS = (p1 - p2) / sqrt( (85/200)*(1-85/200) * (1/100 + 1/100))



## 4
OR = (45*15)/(21*52)
SE_OR = sqrt(1/45 + 1/15 + 1/21 + 1/52)
int = c(OR + 1.96*SE_OR, OR - 1.96*SE_OR)

## 4.2
sqrt((1-45/66)/45 + (1-15/67)/15) # ~ 0.25


## 3.2
RD = .7 - .15
p = 85/200
TSRD = RD/sqrt(p*(1-p)*(1/50))
TSRD1 = RD/sqrt((.7*(1-.15)/100) + (.15*(1-.7)/100))
dnorm(TSRD) * 2
prop.test(x=c(70,15),n=c(100,100), alternative = c("two.sided"))
