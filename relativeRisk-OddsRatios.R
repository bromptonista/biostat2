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
