## Question 1:
## 11.3 or lower

## Question 2:
## A pharmaceutical company is interested in testing a potential blood pressure lowering medication. Their first examination considers only subjects that received the medication at baseline then two weeks later. The data are as follows (SBP in mmHg)
## Test the hypothesis that there was a mean reduction in blood pressure. Compare the difference between a paired and unpaired test for a two sided 5% level test.
## Paired and unpaired two-sided t-tests at 5%
bpress <- read.table(text = "Baseline 	Week 2
140 	138
138 	136
150 	148
148 	146
135 	133", header = TRUE, sep = "\t")
p2 <- plot(bpress[,1], bpress[,2])
abline(lm(bpress[,2] ~ bpress[,1]))

## difference between tests vs the average between tests
## called a "mean difference plot"
p3 <- plot((bpress[,1] + bpress[,2])/2, bpress[,2]-bpress[,1])
bpdiff <- bpress[,1] - bpress[,2]

n <- sum(!is.na(bpdiff)) ## sample size
diff_mean<- mean(bpdiff)
diff_sd <- sd(bpdiff)
testStat <- sqrt(n) * mean(bpdiff)/sd(bpdiff)
2 * pt(abs(testStat), n-1, lower.tail = FALSE)
## Using builtin R function
t.test(bpdiff)
## Note: the data are constant, all participants decreased by 2 bp

## Unpaired
t.test(bpress[,1],bpress[,2])
mean1 = mean(bpress$Baseline)
sd1 = sd(bpress$Baseline)
mean2 = mean(bpress$Week.2)
sd2 = sd(bpress$Week.2)
testStat <-
cor1 <- cor(bpress[,1], bpress[,2]) ## correlation = 1
## Reject using matched, fail to reject using unpaired

## Question 3:
## Brain volumes for 9 men yielded a 90 % confidence interval of 1,077 cc to 1,123 cc. Would you reject in a two sided 5% hypothesis test of H0:¦Ì=1,078?
## testStat <= abs(2 * qt(.1, 8)
mean1 <- (1077 + 1123) /  2 ## 1100
zwid <- qnorm(0.025) * 2 ## standard normal conf width
twid <- qt(0.025, 8, lower.tail = FALSE) * 2 ## t conf width
tsd <- sqrt(9) * (1123 - 1077) / twid
testStat <- abs(sqrt(9) * (1078 - 1100) / tsd)
testStat <= abs(qt(0.025, 8) * 2)
## Fail to reject

## Question 4:
## In an effort to improve efficiency, hospital administrators are evaluating a new triage system for their emergency room. In an validation study of the system, 5 patients were tracked in a mock (simulated) ER under the new and old triage system. Their waiting times in natural log of hours were:
triage <- read.table(text = "Subject 	1 	2 	3 	4 	5
New 	0.929 	-1.745 	1.677 	0.701 	0.128
Old 	2.233 	-2.513 	1.204 	1.938 	2.533", header = TRUE, sep = "\t")
## Give a Pvalue for the test of the hypothesis that the new system resulted in lower waiting times for a one sided t test.
dif <- as.numeric(triage[1,2:6] - triage[2,2:6])
pt(sqrt(5) * mean(as.numeric(dif))/sd(as.numeric(dif)), 4)

t.test(as.numeric(triage[2,2:6]), as.numeric(triage[1,2:6]), alternative = c("greater"), paired = TRUE)
## p-value = 0.1405

## Question 5:
## Refer to the previous question. Give a 95% T confidence interval for the ratio of the waiting times (recall that the measurements were natural logged).
new <- as.numeric(triage[1,2:6])
old <- as.numeric(triage[2,2:6])
exp(mean(new - old) + c(-1, 1) * qt(0.975, 4) * sd(new - old) / sqrt(5))
## 0.09, 2.49

## Question 6:
## (X - Y) / (S_p * sqrt(1/n_x + 1/n_y)), S_p is common standard deviation
Sp = sqrt((8*1.5^2 + 8*1.8^2)/16)
pt(-4/(Sp * sqrt(1/9 + 1/9)), 16) * 2 ## 0.0001

## Question 7:
## [x + Z_(1-a) * s/sqrt(n), inf], WRONG
## [x - Z_(1-a) * s/sqrt(n), inf]

## Question 8:
## Researchers would like to conduct a study of n healthy adults to detect a four year mean brain volume loss of .01 mm3. Assume that the standard deviation of four year volume loss in this population is .04 mm3. What would be the value of n needded for 90% power of type one error rate of 5% one sided test versus a null hypothesis of no volume loss?
(-0.04 * (qnorm(.1) - qnorm(0.95))/0.01)^2 ## ~ 140 sample size
qnorm(.05)
((qnorm(0.05) * 0.04 )/ .01)^2
## around 50, wrong

## Question 9:
pnorm(qnorm(.975) - (2/12)*sqrt(288))/2 ### 10% power
pnorm(qnorm(.975) - (2/12)*sqrt(288)) ### 20% power, WRONG
## around 40 %, wRONG
pnorm(qnorm(.975)-(2 * sqrt(287)/12)) * 2

## Question 10:
## Power goees up
## Power goes down, WRONG

## Question 11:
## Limits to 5%
qnorm(0.95)

## Question 12:
## t distribution

## Question 13:
## X large, u0 small, sigma is small
