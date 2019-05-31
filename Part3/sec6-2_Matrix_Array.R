#Matrix

mat1 <-matrix(c(1,2,3,4))
mat1
mat2 <- matrix(c(1,2,3,4), nrow=2); mat2
mat2 <- matrix(c(1,2,3,4), nrow=2, byrow=T); mat2
mat2[1,1]
mat2[1,]
mat2[,1]

mat4<-matrix(seq(1:9), nrow=3, byrow=T); mat4
mat4<-rbind(mat4, c(10,11,12)); mat4
mat4<-cbind(mat4, c(13,14,15,16)); mat4

mat5<-matrix(c('a','b','c','d'), nrow=2, byrow=T)
mat5<-cbind(mat5, c('e','f'))
mat5

colnames(mat5) <-c('First', 'Second','Third')
mat5
#=================================================================
#연습문제
season <-matrix(c("봄", "여름", "가을","겨울"), nrow=2); season
season <-matrix(c("봄", "여름", "가을","겨울"), nrow=2, byrow=T); season
season[,2]
season_2<-rbind(season, c("초봄","초가을")); season_2
season_3<-cbind(season_2, c("초여름", "초겨울","한겨울")); season_3

#Array!
array1 <-array(c(1:12), dim=c(4,3)); array1
array1 <-array(c(1:12), dim=c(4,3), byrow=T); array1 #안됨!!!
array2 <-array(c(1:36), dim=c(3,3,4)); array2 #3행3열짜리가 4개!
array2[1,,]

#List
list1<-list(name='홍길동', address='전국', Tel='010-1234-5678', Age=300); list1
list1[1]
list1$name
list1[1:2]
list1$birth <-'1719-10-23'; list1
list1$name <-c('홍길동','rlarlfehd'); list1
list1$birth<-NULL; list1 #삭제

