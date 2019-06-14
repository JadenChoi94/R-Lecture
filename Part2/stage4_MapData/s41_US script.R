#지도 시각화
install.packages('ggiraphExtra')
install.packages('maps')
install.packages('mapproj')
library(mapproj)
library(ggiraphExtra)
library(maps)
library(gridExtra)
library(tibble) #필드 추가할때 필요한
library(ggthemes)
library(dplyr)
library(reshape2)
library(extrafont)

windowsFonts(malgun = "맑은 고딕")
theme_update(text = element_text(family = "malgun"))

str(USArrests)
head(USArrests)#지역이름이 필드값이 아님
tail(USArrests)
summary(USArrests)

#필드를 추가해서 지역이름을 옮기자
crime<-rownames_to_column(USArrests, var='state') 
head(crime)
crime$state<-tolower(crime$state) #소문자로 변환
head(crime)

#미국 주 지도 데이터준비
states_map<- map_data('state') #map_data() ggplot2패키지임 이걸 이용해서 데이터프레임으로 가져옴
str(states_map)

#단계 구분도 만들기
ggChoropleth(data=crime,         #지도에 표현할 데이터
             aes(fill=Murder,    #색깔로 표현할 변수
                 map_id=state),  #지역기준 변수
             map=states_map)     #지도 데이터


#인터렉티브 단계 구분도 만들기
ggChoropleth(data=crime,         #지도에 표현할 데이터
             aes(fill=Rape,      #색깔로 표현할 변수
                 map_id=state),  #지역기준 변수
             map=states_map,     #지도 데이터
             interactive = T)    #인터렉티브

ggChoropleth(data=crime,             
             aes(fill=Rape, 
                 map_id=state), 
             map=states_map)+
  ggtitle('미국 주별 살인 범죄 분포') +
  xlab('경도')+
  ylab('위도')+
  theme(plot.title = element_text(family="malgun", face = "bold", hjust = 0.5,
                                  vjust = 2.5, size = 15, color = "darkblue"))
#================================================================================
#4개의 그래프를 한 화면에 보여주기
m<-ggChoropleth(data=crime,             
             aes(fill=Murder,map_id=state), 
             map=states_map) +
  ggtitle('미국 주별 살인 범죄 분포') +
  xlab('경도')+
  ylab('위도')+
  theme(plot.title = element_text(family="malgun", face = "bold", hjust = 0.5,
                                  vjust = 2.5, size = 15, color = "darkblue"))
a<-ggChoropleth(data=crime,             
             aes(fill=Assault,map_id=state), 
             map=states_map) +
  ggtitle('미국 주별 강도 범죄 분포') +
  xlab('경도')+
  ylab('위도')+
  theme(plot.title = element_text(family="malgun", face = "bold", hjust = 0.5,
                                  vjust = 2.5, size = 15, color = "darkblue"))
u<-ggChoropleth(data=crime,             
             aes(fill=UrbanPop,map_id=state), 
             map=states_map) +
  ggtitle('미국 주별 도시비율 분포') +
  xlab('경도')+
  ylab('위도')+
  theme(plot.title = element_text(family="malgun", face = "bold", hjust = 0.5,
                                  vjust = 2.5, size = 15, color = "darkblue"))
r<-ggChoropleth(data=crime,             
             aes(fill=Rape,map_id=state), 
             map=states_map) +
  ggtitle('미국 주별 강간 범죄 분포') +
  xlab('경도')+
  ylab('위도')+
  theme(plot.title = element_text(family="malgun", face = "bold", hjust = 0.5,
                                  vjust = 2.5, size = 15, color = "darkblue"))
windows()
grid.arrange(m,r,a,u, ncol=2,
             top='미국 주별 강력범죄 분포')
