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

Sys.Date()
Sys.time()
date()
class(Sys.Date())
class(as.Date("2019-05-30"))
as.Date("2019-05-30")
as.Date("01-11-2014", format="%d-%m-%Y")
as.Date("2019-05-30", format="%y-%m-%d")
as.Date("190530", format="%y%m%d")
as.Date("2019년 05월 30일", format="%Y년 %m월 %d일")
as.Date("05-30", format="%m-%d")
as.Date(10, origin="2019-05-30")
as.Date(20, origin=date()) #문자열만 가능 
as.Date(20, origin=Sys.Date()) #Sys.Dat-e() 는가능 ;)
as.Date(-10, origin="2019-05-30")
as.Date("2019-05-30") - as.Date("2019-11-08")
as.Date("2019-05-30") +5
as.Date("2019-11-14") - Sys.Date() #수능디데이
as.POSIXct("2019-05-30 09:00:00")-as.POSIXct("2019-11-08 18:00:00")
install.packages("lubridate")
library(lubridate)
now()
date <- now()
year(date)
month(date)
day(date)
month(date, label=T)
wday(date)
wday(date, label=T)
month(date) <- 2; date
date+months(3)
