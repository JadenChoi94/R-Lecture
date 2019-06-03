install.packages("reshape2")
library("reshape2")
fruits

melt(fruits,id='year')
melt(fruits, id=c('year','name'))
melt(fruits, id=c('year','name'), variable.name = '변수명', value.name='변수값')
mtest<-melt(fruits, id=c('year','name'), variable.name = '변수명', value.name='변수값')
dcast(mtest, year+name~변수명)
dcast(mtest, name~변수명, sum)

#stringr 패키지
install.packages("stringr")
library("stringr")

fruits<-c('apple','Apple','banana','pineapple')
str_detect(fruits,'A')
str_detect(fruits, '^a')#첫글자
str_detect(fruits, 'e$')#끝글자
str_detect(fruits, '^[aA]')#시작하는 
str_detect(fruits, '[aA]')#대소문자 상관없이
str_detect(fruits, ignore.case('a')) #안됨
str_detect(fruits, regex('a', ignore_case = T))
str_count(fruits, 'a')
str_c('apple','banana') #문자합치기
str_c('Fruits: ', fruits)
str_c(fruits,' name is ', fruits)
str_c(fruits, collapse='')
str_c(fruits, collapse=', ')
str_dup(fruits, 3)
str_length('apple')
str_length(fruits)
str_length('과일')
str_locate(fruits, 'a')
str_replace('apple','p','*')
str_replace('apple','p','++')
str_replace_all('apple','p','*')

fruits<-str_c('apple','/','orange','/','banana')
fruits
str_split(fruits,"/")#리스트 형식

str_sub(fruits, start=1, end=3)
str_sub(fruits, start=6, end=9)
str_sub(fruits, start=-7)
str_sub(fruits, start=-5)

#공백을 제거해줌
str_trim('    apple orange banana    ')
str_trim(' \t apple orange banana    ' )
str_trim('    apple orange banana    \n')

