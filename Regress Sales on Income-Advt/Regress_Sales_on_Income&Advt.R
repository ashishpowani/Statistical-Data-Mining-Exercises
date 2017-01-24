#Get the forecast library
library (forecast)
Sales <-read.csv(file.choose())

head(Sales)
View(Sales)

SalesRegression <- lm(SALES~., data=Sales)
#SalesRegression <- lm(SALES~ADVT+INCOME,data=Sales)
summary(SalesRegression)

par(mfrow=c(1,2))

plot(SALES~., data=Sales)

abline(lm(SALES~ADVT, data=Sales))
abline(lm(SALES~INCOME, data=Sales))

lm(SALES~., data=Sales)

###############################################
#  Call:
#    lm(formula = SALES ~ ., data = Sales)

#  Residuals:
#    Min       1Q   Median       3Q      Max 
#  -22.6876  -6.0687   0.6043   7.0523  28.5334 

#  Coefficients:
#    Estimate Std. Error t value Pr(>|t|)   
#  (Intercept)  36.8948    24.9629   1.478   0.1536   
#  ADVT          5.0691     2.5397   1.996   0.0585 . 
#  INCOME        0.8081     0.2816   2.870   0.0089 **
  ---
#    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#  Residual standard error: 12.66 on 22 degrees of freedom
#  Multiple R-squared:  0.452,	Adjusted R-squared:  0.4022 
#  F-statistic: 9.074 on 2 and 22 DF,  p-value: 0.001338
