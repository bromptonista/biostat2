## Matched Data
## How to use paired data:
## One option: take the difference between the paired observations and do a
##  one-sample t-test of H0: ud = 0 (mean difference = 0) vs.
##  Ha: ud != 0 (or one of the other two alternatives, ie. < or >, one-sided tests)
## The test statistic in this case would be:
##  the average of the differences - the hypothesised mean (typically 0)
##  divided by the standard deviation of the differences over the sqrt of the sample
##  size of the differences: (X_d - u0_d) / (S_d / sqrt(n_d))
## Then compare this statistic to either a Z statistic or a t_(n_d - 1), i.e.
##  a two-sided (or one-sided) t statistic with n_d - 1 df
