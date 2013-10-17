## Hypothesis tests for binomial proportions
## Consider H_0: p = p_0 for a binomial proportion
## Score statistic = (p_hat - p_0) / sqrt( p_0*(1 - p_0) / n)
## where p_hat is the sample proportion and sqrt( p * (1-p)/n) ) is the standard error
## Under the null hypothesis (p = p_0) the SE is then; sqrt( p_0 * (1-p_0)/n)
## So, we are taking the difference in the sample mean and the pop. mean (under the
##  null hypothesis) and normalizing it by dividing by the standard error
##
## The above statistic follows a Z distribution for large n, and performs better than
## the Wald statistic,
## (p_hat - p_0) / sqrt( p_hat(1 - p_hat) / n)
## Difference between Wald test and Score test is that the Wald test uses standard error of
##  the sample (p_hat) instead of SE of p_0

## To get confidence intervals:  Invert the test statistic
## Inverted Wald:
##                p_hat +- Z_(1-alpha/2) * sqrt(p_hat * (1 - p_hat)/n)

## Example: Testing two drugs for side effects
## Goal: Test if Drug A's percentage of users with side effects is > 10 %
## H_0: p_A = 0.1 versus H_a: p_A > 0.1
## say, p_hat = 0.55, n = 20
## Test statistic: (0.55 - 0.1) / sqrt(0.1 * 0.9/20) = 6.7
## We reject: pvalue = P(Z > 6.7) ~ 0 (one-sided Z ~ 1.65, two-sided Z ~ 2)

## Exact binomial test: using the binomial distribution to calculate a pvalue instead
##  of the standard normal:
##     P(X_A >= 11) = sum((20 choose x) * .1^x * .9^(20-x)) from x = 11 to 20 ~ 0
## In R:
pbinom(10, 20, .1, lower.tail = FALSE)
binom.test(11, 20, .1, alternative = "greater") # pvalue 7e-7

