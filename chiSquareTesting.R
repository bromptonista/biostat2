## Testing equality of proportions using Chi-squared statistic
## Note: chi square always does two-sided test (becuase of squared difference)
## statistic = sum ( ( observed - expected )^2 / expected )
##
## here,
## - the expected are the expeceted number of counts under the null hypothesis,
## - the sum is over all four cells,
## - the statistic follows chi-squared distribution with 1 df,
## - the Chi-squared statistic is exactly the sqaure of the difference in proportions
##   of the Score statistic

## Example: given the following table compute the pval,
## trt  side.effects none total
## X    44           56   100
## Y    77           43   120
## sum  121          99   220
##
## Expected for each cell: (column sum / total sample size) *  row sum
## i.e for O_11 (the first cell): (121/220) * 100 = 55
statistic = (44-55)^2/55 + (77-66)^2/66 + (56-45)^2/45 + (43-54)^2/54 # 8.96
## Compare statistic to chisquare with 1 df and reject for high values
pchisq(8.96, 1, lower.tail = FALSE) ## 0.002 pvalue

## R simplifed calculations:
dat <- matrix(c(44, 77, 56, 43), 2)
chisq.test(dat) # note this version has slightly different result (better), it accounts for the fact that counts are discrete and we are getting asymptotic pvalue
chisq.test(dat, correct = FALSE) ## this returns the same as above, no continuity correction
