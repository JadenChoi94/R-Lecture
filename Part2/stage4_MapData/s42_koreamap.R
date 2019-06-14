#대한민국 시도별 인구 결핵 환자 구분도

install.packages('stringi')
library(stringi)
library(devtools)
library(dplyr)
library(ggiraphExtra)
library(ggplot2)

devtools::install_github('cardiomoon/kormaps2014')
library(kormaps2014)
str(changeCode(korpop1))

korpop1<-rename(korpop1,
                pop=총인구_명,
                name=행정구역별_읍면동)

str(changeCode(korpop1))
head(changeCode(korpop1))


ggChoropleth(data=korpop1,             #지도에 표현할 데이터
             aes(fill=pop,map_id=code, #색깔로 표현할 변수, 지역기준 변수
                 toolkit=name),        #지도위에 표시할 지역명
             map=kormap1,              #지도 데이터
             interactive = T)          #인터렉티브 마우스 움직임에 반응
#결핵환자수
str(changeCode(tbc)) #인코딩작업 한글이라 깨지기때문에 하는거임

ggChoropleth(data=tbc,            #지도에 표현할 데이터
             aes(fill=NewPts,     #색깔로 표현할 변수,
                 map_id=code,     #지역기준 변수
                 toolkit=name),   #지도위에 표시할 지역명
             map=kormap1,         #지도 데이터
             interactive = T) 
