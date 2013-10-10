
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
