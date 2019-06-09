#조건문 
myabs<-function(x){
  if (x>=0){
    return (x)
  }
  else {
    return (-x)
  }
}
myabs(-4)
myabs(4.5)

mf<-function(x){
  if(x>0) {
    return(x*2)
  } else if (x==0){
    return(0) 
  } else {
    return(-2 * x)
  }
}
mf(5)
mf(0)
mf(-4)

n<-scan()
result<-ifelse(n%%2==0,'짝','홀')
result
#=====================연습문제======================
#1
myf1<-function(x){
  #return(ifese(x>5,1,0))
  if(x>5){
    return (1)
  } else (x<=5){
    return(0)
  }
}

#2
myf2<-function(x){
  #return(ifese(x>0,1,0))
  if(x>0){
    return (1)
  } else (x<0){
    return(0)
  }
}

#3
myf3<-function(a,b){
  #return(ifese(x>y,x-,y-))
  if(a>b){
    return (a-b)
  } else (b>a){
    return(b-a)
  }
}

#4
myf4<-function(x){
  if(x<0) {
    return (0)
  } else if (1<=x && x<=5){
    return(1)
  } else (x>=5){
    return (10)
  } else {
    return (-1)
  }
}

#5
myf5<-function(x){
  if(x=='y'||x=='Y'){
    return ('Yes')
  } else{
  return('Not Yes')
  }
}
#ans<-scan(what="") 이래야 문자입력받음

#추가문제 어렵
myintF<-function(a,b,c){
  D=b*b -4*a*c
  if(D>0){
    return(2)
  } else if(D==0){
    return (1)
  } else {
    return(0)
  }
}

myrealD<-function(a,b,c) {
  D=b*b - 4*a*c
  print(D)
  if(abs(D)<1e-5){
    return (1)
  } else if(D>0) {
    return(2)
  } else {
    return(0)
  }
}
a<- 1.0000000000000001
b<- -2.000000000000001
c<- 1.000000000000002
myrealD(a,b,c)
