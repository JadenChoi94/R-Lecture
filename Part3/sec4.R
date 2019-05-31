cat(5/2)
print(5%/%2) #몫
cat(5%%2)    #나머지

100000+100000
1/1000000
1/100000
1/10000
1/1000

'1' + '2'

as.numeric('1')+as.numeric('2')
'apple'+'pen'
first<-1
first

class(1)
class('1')

3 & 0
3 & 1
3 | 0
!0
!3
class(!0)

cat(1,NA,2)
cat(1,NULL,2)
sum(1,NA,2)
sum(1,NULL,2)
sum(1, NA, 2, na.rm=T) #중요
sum(1,NULL,2, null.rm=T)

class(rm)
class(NA)

setwd("d:/Workspace/R_Data_Analysis/Part3/data")
txt1 <- read.csv("factor_test.csv")
txt1

factor1<-factor(txt1$blood)
factor1
gender1 <-factor(txt1$sex)
gender1
summary(factor1)
summary(gender1)

View(txt1)
