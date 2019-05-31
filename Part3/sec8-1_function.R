#Function
mat1<-matrix(c(1:6), nrow=2, byrow=T)
a<-rep(1, 3)
sweep(mat1, 2, a)
b<-matrix(c(2, 2))
sweep(mat1, 1, b) # 행 방향으로 sweep

a<-c(1,2,3,4,5); length(a)
length(mat1)
library(googleVis) #googleVis 가 뭐지
length(Fruits)

#수학함수들
log10(10)
sin(pi)
abs(-1) #절대값
V2<-c(1,-2,3,-4)
abs(V2)
ceiling(2.3)
floor(2.3)
ceiling(-2.3)
floor(-2.3)
round(2.6) #반올림
choose(5,3) 
#========================================================
#함수 만들기
myfunc2 <-function(x){
  y=x*x; 
  return(y)
}
myfunc2(-3)
#==========================연습문제======================
func_test1<-function(a,b){
  c=a-b;
  return(c)
}
func_test1(3,2)
func_test1(2,3)

func_test2<-function(a,b){
  god<-abs(func_test1(a,b))
  return(god)
}

func_test2(3,2)
func_test2(2,3)
