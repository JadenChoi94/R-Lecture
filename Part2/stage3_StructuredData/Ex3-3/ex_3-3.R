#예제 3-3: 서울시 주요 구의 의원 현황을 구글 챠트로 보여주기


library(googleVis)
data <- read.csv("2013년_서울_구별_주요과목별병원현황_구글용.csv",header=T)
data
hos <- gvisColumnChart(data,options=list(title="지역별 병원현황",
       height=400,weight=500))
header<-hos$html$header
header<-gsub('charset=utf-8','charset=euc-kr', header)
header
hos$html$header<-header
plot(hos)
