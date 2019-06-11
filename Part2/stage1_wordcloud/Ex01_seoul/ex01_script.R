install.packages('rJava')
library(rJava)
install.packages('KoNLP')
library(KoNLP)
install.packages("wordcloud")
library(wordcloud)
useSejongDic()

data1<-readLines("seoul_new.txt")
data1 #파일에서 읽은 Raw 데이터(한글문장)
extractNoun('서울시 버스정책을 역행하는 행위를 고발합니다.')
data2<-sapply(data1, extractNoun, USE.NAMES=F)
data2 #list형태, 명사들만 있는 데이터
head(unlist(data2),30)
data3<-unlist(data2)
data3 #list 형태가 아닌 명사데이터

#원하지않는 내용 걸러내기
data3<-gsub('\\d+', '', data3)
data3<-gsub('서울시', '', data3)
data3<-gsub('서울', '', data3)
data3<-gsub('요청', '', data3)
data3<-gsub('제안', '', data3)
data3<-gsub(' ', '', data3)
data3<-gsub('-', '', data3); data3

#내용중간에 공백 제거 하기
write(unlist(data3),'seoul_2.txt')
data4<-read.table('seoul_2.txt'); data4
head(data4)
nrow(data4)

wordcount<-table(data4); wordcount
head(sort(wordcount, decreasing=T), 20)
data3<-gsub('OO','',data3)
data3<-gsub('님','',data3)
data3<-gsub('개선','',data3)
data3<-gsub('문제','',data3)
data3<-gsub('관리','',data3)
data3<-gsub('민원','',data3)
data3<-gsub('이용','',data3)
data3<-gsub('관련','',data3)
data3<-gsub('시장','',data3)

write(unlist(data3), 'seoul_3.txt')
data4<-read.table('seoul_3.txt')
wordcount<-table(data4)
head(sort(wordcount, decreasing=T), 20)

#Word cloud 그래픽 출력
library(RColorBrewer)

palete<-brewer.pal(8,'dark2')
set.seed(1234)
wordcloud(names(wordcount), freq=wordcount,scale=c(5,0.8), rot.per=0.1, min.freq=1,
          random.order=F, ramdom.color=T, colors=palete)
legend(0.3, 0.8, '서울시 응답소 요청사항 분석',cex=0.8, fill=NA, border=NA, bg='white', text.col='red',
       text.font=2, box.col='red')

v3<-c('봄이 지나면 여름이고 여름이 지나면 가을 입니다.', '그리고 겨울이죠')
extractNoun(v3)
v4<-sapply(v3, extractNoun, USE.NAMES=F)
v4
wordcloud(c(letters, LETTERS, 0:9), seq(1,1000, len=62))

palete<-brewer.pal(9, 'set1')
wordcloud(c(letters, LETTERS, 0:9), seq(1,1000, len=62), colors=palete)
