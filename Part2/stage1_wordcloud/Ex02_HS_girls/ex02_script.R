#예제1-2. 여고생은 어디를 가장  고치고 싶을까요?

setwd('d:\Workspace\R_Data_Analysis\Part2\stage1_wordcloud\HS_girls')

library(rJava)
library(KoNLP)
library(wordcloud)
useSejongDic()

data1<-readLines('remake.txt')
data1#파일에서 일은 원시 데이터
data2<-sapply(data1, extractNoun, USE.NAMES=F)
data2 #리스트형태의 명사만 추출된 데이터
data3<-unlist(data2); data3#명사만 추출된 데이터
data3<-Filter(function(x) {nchar(x)<=10}, data3) #10개 이하의 글자만 
data3 #10글자 이상은 제거된 데이터

head(unlist(data3), 30)
data3<-gsub('수','',data3)
data3<-gsub('것','',data3)
data3<-gsub('&','',data3)
data3<-gsub('기','',data3)
data3<-gsub('개','',data3)
data3<-gsub('한','',data3)
data3<-gsub('ㅠㅠㅠㅠ','',data3)
data3<-gsub('\\d+','',data3)
data3<-gsub('쌍수','쌍꺼풀',data3)
data3<-gsub('쌍커플','쌍꺼풀',data3)
data3<-gsub('메부리코','매부리코',data3)
data3<-gsub('\\','',data3)
data3<-gsub(' ','',data3)
data3<-gsub("\\.",'',data3); data3

txt<-readLines('성형gsub.txt')
for(i in 1:length(txt)){
  data3<-gsub((txt[i]), '', data3)
};data3

write(unlist(data3),'remake2.txt')
data4<-read.table('remake2.txt');data4
nrow(data4)
wordcount<-table(data4)
wordcount
head(sort(wordcount, decreasing=T), 30)

set.seed(1234)
palete<-brewer.pal(8,'Dark2')
wordcloud(names(wordcount), freq=wordcount,scale=c(4, 0.5), rot.per=0.25, min.freq=2, family="AppleGothic", 
          random.order=F, ramdom.color=T, colors=palete)
legend(0.3, 0.9, '여고생은 선호하는 성형수술 부위', cex=0.8, fill=NA, border=NA, bg='white', text.col='red',
       text.font=1, box.col='red')
