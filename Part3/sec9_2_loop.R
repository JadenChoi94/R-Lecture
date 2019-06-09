#반복문
no <-5
while (no<50) {
  print(no)
  no<-no+1
}

num<-0
while(num<5){
  print(num)
  if(num==3)
    break
  num<-num+1
}

num<- -1
while(num<=10){
  num<-num+1
  if(num%%2==1)
    next
  print(num)
}

#FOR
for(i in 1:10) {
  print(i)
}

sum<-0
for(i in 1:100){
  sum<- sum+i
}
print(sum)

sum<-0
for(i in 1:100)
  if(i%%3==0){
    sum<-sum+i
}
print(sum)

multiple <-function(limit, num) {
  sum <-0
  for (i in 1:limit){
    if(i%%num==0)
      sum<-sum+i
    }
    return(sum)
  }
}
multiple(1000, 4)
#==============================
library(stringr)

for(i in 1:5){
  line<-''
  for(k in 1:i){
    line<-str_c(line, '#')
  }
  print(line)
}

for(i in 1:10){
  line<-''
  if(i!=1){
    for(k in 1:(i-1))
       line<-str_c(line, '')
  }
  for (k in i:10){
    line <-str_c(line, '#')
  }
  print(line)
}
#구구단 
for(i in 1:9){
  for(k in 1:9) {
    print(paste(i, "x", k, "=", i*k))
  }
}
#다이아몬드
diamond <- function(max) {
  
  # Upper triangle
  space <- max - 1
  for (i in 0:(max - 1)) {
    for (j in 0:space) cat(" ")
    for (j in 0:i) cat("# ")
    cat("\n")
    space <- space - 1
  }
  
  # Lower triangle
  space = 1;
  for (i in (max - 1):1) {
    for (j in 0:space) cat(" ")
    for (j in 0:(i - 1)) cat("# ")
    cat("\n")
    space <- space + 1
  }
}
diamond(10)

#약수
yaksoo<-function(k){
  for(n in 1:k) {
    if(k%%n==0) {
      print(n)
    } 
  }
}
yaksoo(20)

'''
divisors <- function(x){
  #  Vector of numberes to test against
  y <- seq_len(x)
  #  Modulo division. If remainder is 0 that number is a divisor of x so return it
  y[ x%%y == 0 ]
}
divisors(21)

divisors <- function(number) {
  x <- c(1:number)
  for(i in 1:number){
    if(number/i == c(x)) {
      paste(i)
    }
  }
  return(i)
}
divisors(10)
'''
#=====================연습문제=========================
var1<-read.csv("채소.txt", header=TRUE, fileEncoding = 'utf8')
var1
