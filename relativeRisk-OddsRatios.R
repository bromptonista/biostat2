## Example: randomized trial with 40 subjects taking two drugs (20 each group) where
##  the active ingredients were the same but the had different expedients (pill vs capsule)
## - Consider counting the number of subjects with side effects for each drug.
seffs <- data.frame(drug = c("A","B"), side.effects = c(11, 5), None = c(9, 15),
                    total = c(20, 20))
## Question: does drug A have a statistically higher probability of side effects than drug
##  B?
## Let X ~ Binomial(n1, p1) and p1_hat = X/n1 ##Drug A
## Let Y ~ Binomial(n2, p2) and p2_hat = Y/n2 ##Drug B

## Relative Risk
## The relative risk is defined as p1/p2 (thinking of p1 and p2 as population proportions)
## The natural estimator for the the relative risk:
##                      RR_hat = p1_hat/p2_hat = (X/n1)/(Y/n2)
##   where p1_hat and p2_hat are estimators of pop. prop.
##
## The standard error for the log of RR_hat: (logs are good for ratios)
##           SE_(log RR_hat)_hat = ((1 - p1)/(p1*n1) + (1 - p2)/(p2*n2))^(1/2)
## Then exponentiate the resulting interval to get an interval for RR

## Odds Ratio
## (Odds of SE drug A)/(Odds of SE drug B) = (p1/(1-p1))/(p2/(1-p2)) = p1(1-p2)/p2(1-p1)
## The sample odds ratio just plugs in values for p1 and p2:
##  OR_hat = (p1_hat/(1-p1_hat)) / (p2_hat/(1-p2_hat)) =

## Example:
## For relative risk:
pA_hat = 11/20 # .55
pB_hat = 5/20 # .25
RR_AoverB_hat = .55/.25 # 2.2
SE_logRR_AoverB_hat = sqrt( (1-pA_hat)/.55*20 + (1-pB_hat)/.25*20 ) # 0.44
## Interval for the log RR
log_RR = c(log(2.2) + 1.96 * 0.44,log(2.2) - 1.96 * 0.44) # [-0.07, 1.65]
## Interval for RR
intervalRR = exp(log_RR) # [0.93, 5.21]

## Odds ratio AoverB
OR_AoverB = (11*15)/(9*5)
SE_logOR_AoverB_hat = sqrt( 1/11 + 1/9 + 1/15 + 1/5 ) ## sqrt of 1 / cell counts
## Interval for log OR
log_OR = c(log(3.67) + 1.96*.68, log(3.67) - 1.96*.68)
intervalOR = exp(log_OR)

## Risk difference
RD_AminusB_hat= pA_hat - pB_hat # 0.55 - 0.25 = 0.30
SE_AminusB_hat = sqrt( (.55*.45)/20 + (.25*.75)/20 ) # .15
## Interval: .3 +- 1.96*.15 = [.15, .45]
