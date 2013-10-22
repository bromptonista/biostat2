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

## Comparing two binomials
## Example: Test to see if proportion of side effects is the same in two groups.
## Let X ~ Binomial(p1, n1) and p1_hat = X/n1
## Let Y ~ Binomial(p2, n2) and p2_hat = Y/n2
## Score test of the hypothesis, H0: p1 = p2
## Versus H1: p1 != p2, H2: p1 > p2, H3: p2 > p1
## The Score Statistic (normally distributed for large n1 and n2):
##   TS = (p1_hat - p2_hat) / sqrt(p_hat(1 - p_hat)(1/n1 + 1/n2))
##  where p_hat = (X+Y)/(n1+n2) is the estimate of the common proportion under the
##   null hypothesis
##
## Alternatively, the Wald interval:
##  TS = (p1_hat - p2_hat) / sqrt( p1_hat(1-p1_hat)/n1 + p2_hat(1-p2_hat)/n2 )
## Which has a confidence interval:
##  p1_hat - p2_hat +- Z_(1-alpha/2) * sqrt( p1_hat(1-p1_hat)/n1 + p2_hat(1-p2_hat)/n2 )
## Note: p1_hat(1-p1_hat)/n1 + p2_hat(1-p2_hat)/n2  is the SE here

## Bayesian and Likelihood inference for two binomial proportions
## Bayesian:
## Consider putting independent Beta(alpha1, beta1) and Beta(alpha2, beta2) on p1 and p2
## Then the posterior is:
##  Lik(p1, p2) ~ p1^(x + alpha1 - 1)*(1 - p1)^(n1 + beta1 - 1) * p2^(y + alpha2 - 1)*
##    (1 - p2)^(y + beta2 - 1)
## Hence under this (potentially naive) prior, the posterior for p1 and p2 are
##  independent betas
## And, the easiest way to explore this posterior is via Monte Carlo
## Example ir R:
x <- 11; n1 <- 20; alpha1 <- 1; beta1 <- 1; ## uniform prior (alpha, beta = 1)
y <- 5; n2 <- 20; alpha2 <- 1; beta2 <- 1;
p1 <- rbeta(1000, x + alpha1, n1 - x + beta1)
p2 <- rbeta(1000, y + alpha2, n2 - y + beta2)
rd <- p2 - p1 ## looking at risk difference (i.e. risk of side effects)
plot(density(rd))
quantile(rd, c(0.025, 0.975))
mean(rd)
median(rd)
