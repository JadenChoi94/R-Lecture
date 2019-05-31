vec1<-c(1,2,3,4,5)
vec1[3] 
vec1[-3] #3번째 인덱스만 빼고
vec1[2:(length(vec1)-2)] #첫숫자는 시작위치, 마지막은 뒤에서부터 뺄 숫자 수
vec1[-1:-3]
vec1[2]<-6; vec1
vec1<-c(vec1, 7); vec1
class(c(vec1, 7))
vec1[9]<-0; vec1 #인덱스를 건너뛰고 추가하면 NA
append(vec1,c(10), after=3) #after=3은 인덱스를 뜻함
vec1<-append(vec1,c(10,14,16), after=5); vec1

#벡터 연산하기
c(1,2,3)+c(4,5,6)
c(1,2,3)+1
var1 <-c(1,2,3)
var2<-c(4,5,6)
var1+var2
#타입이 다른건 연산 안됨
union(var1, var2)
var4<-c(1,2,3,4,5)
var1+var4
var1 - var2
var2<-c(3,4,5)
setdiff(var1,var2)#차집합
setdiff(var2, var1)

intersect(var1, var2) #교집합
fruits <-c(10,20,30); fruits
names(fruits)<-c('apple', 'banana','mango')
fruits

var5<-seq(1:6); var5
var6 <-seq(2, -2); var6

even <-seq(2,10,2); even #시작값, 끝값, 증분
odd <-seq(1,10,2); odd
var8<-rep(1:3,2); var8 #repeat
var9<-rep(1:3, each=2); var9
length(var1)

5%in% even
4 %in% even

#연습문제
date4<-seq(from=as.Date('2015-01-01'), to=as.Date('2015-01-31'), by=1)
date4
#===========================================================================
vec1<-c('사과', '배','감','버섯','고구마'); vec1
vec1[-3]
#===========================================================================
vec2<-c('봄','여름','가을','겨울')
vec3<-c('봄','여름','늦여름','초가을')
union(vec2,vec3)
setdiff(vec2, vec3)
intersect(vec2, vec3)
