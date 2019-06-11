#서울시 응답소 2015년 월별 분석

setwd('D:\Workspace\R_Data_Analysis\Part2\stage1_wordcloud\Ex01_seoul\서울시 응답소_2015년전체')
library(rJava) #필수 패키지 로딩
library(KoNLP)
library(wordcloud)
library(stringr)
useSejongDic()
#1월
data1<-readLines("응답소_2015_01.txt")
data2<-sapply(data1, extractNoun, USE.NAMES=F)
head(unlist(data2),30)
data3<-unlist(data2)

txt<-readLines('응답소gsub.txt')
for(i in 1:length(txt)){
  data3<-gsub((txt[i]), '', data3)
}
write(unlist(data3),'응답소_2015_01_1.txt')
data4<-read.table('응답소_2015_01_1.txt')
head(data4)
nrow(data4)
wordcount<-table(data4)
head(sort(wordcount, decreasing=T), 30)

set.seed(1234)
palete<-brewer.pal(8,'Dark2')
wordcloud(names(wordcount), freq=wordcount,scale=c(3, 0.2), rot.per=0.25, min.freq=2, 
          random.order=F, random.color=T, colors=palete)
legend(0.2, 0.9, '서울시 응답소 1월 분석', cex=0.8, fill=NA, border=NA, bg='white', text.col='red',
       text.font=1, box.col='red')
#2월
data1<-readLines("응답소_2015_02.txt")
data2<-sapply(data1, extractNoun, USE.NAMES=F)
head(unlist(data2),30)
data3<-unlist(data2)

txt<-readLines('응답소gsub.txt')
for(i in 1:length(txt)){
  data3<-gsub((txt[i]), '', data3)
}
write(unlist(data3),'응답소_2015_02_1.txt')
data4<-read.table('응답소_2015_02_1.txt')
head(data4)
nrow(data4)
wordcount<-table(data4)
head(sort(wordcount, decreasing=T), 30)

set.seed(1234)
palete<-brewer.pal(8,'Dark2')
wordcloud(names(wordcount), freq=wordcount,scale=c(3, 0.2), rot.per=0.25, min.freq=2,  
          random.order=F, random.color=T, colors=palete)
legend(0.2, 0.9, '서울시 응답소 2월 분석', cex=0.8, fill=NA, border=NA, bg='white', text.col='red',
       text.font=1, box.col='red')
#3월
data1<-readLines("응답소_2015_03.txt")
data2<-sapply(data1, extractNoun, USE.NAMES=F)
head(unlist(data2),30)
data3<-unlist(data2)

txt<-readLines('응답소gsub.txt')
for(i in 1:length(txt)){
  data3<-gsub((txt[i]), '', data3)
}
write(unlist(data3),'응답소_2015_03_1.txt')
data4<-read.table('응답소_2015_03_1.txt')
head(data4)
nrow(data4)
wordcount<-table(data4)
head(sort(wordcount, decreasing=T), 30)

set.seed(1234)
palete<-brewer.pal(8,'Dark2')
wordcloud(names(wordcount), freq=wordcount,scale=c(3, 0.2), rot.per=0.25, min.freq=2,  
          random.order=F, random.color=T, colors=palete)
legend(0.2, 0.9, '서울시 응답소 3월 분석', cex=0.8, fill=NA, border=NA, bg='white', text.col='red',
       text.font=1, box.col='red')
#4월
data1<-readLines("응답소_2015_04.txt")
data2<-sapply(data1, extractNoun, USE.NAMES=F)
head(unlist(data2),30)
data3<-unlist(data2)

txt<-readLines('응답소gsub.txt')
for(i in 1:length(txt)){
  data3<-gsub((txt[i]), '', data3)
}
write(unlist(data3),'응답소_2015_04_1.txt')
data4<-read.table('응답소_2015_04_1.txt')
head(data4)
nrow(data4)
wordcount<-table(data4)
head(sort(wordcount, decreasing=T), 30)

set.seed(1234)
palete<-brewer.pal(8,'Dark2')
wordcloud(names(wordcount), freq=wordcount,scale=c(3, 0.2), rot.per=0.25, min.freq=2, 
          random.order=F, random.color=T, colors=palete)
legend(0.2, 0.8, '서울시 응답소 4월 분석', cex=0.8, fill=NA, border=NA, bg='white', text.col='red',
       text.font=1, box.col='red')
#5월
data1<-readLines("응답소_2015_05.txt")
data2<-sapply(data1, extractNoun, USE.NAMES=F)
head(unlist(data2),30)
data3<-unlist(data2)

txt<-readLines('응답소gsub.txt')
for(i in 1:length(txt)){
  data3<-gsub((txt[i]), '', data3)
}
write(unlist(data3),'응답소_2015_05_1.txt')
data4<-read.table('응답소_2015_05_1.txt')
head(data4)
nrow(data4)
wordcount<-table(data4)
head(sort(wordcount, decreasing=T), 30)

set.seed(1234)
palete<-brewer.pal(8,'Dark2')
wordcloud(names(wordcount), freq=wordcount,scale=c(3, 0.2), rot.per=0.25, min.freq=2, 
          random.order=F, random.color=T, colors=palete)
legend(0.2, 0.8, '서울시 응답소 5월 분석', cex=0.8, fill=NA, border=NA, bg='white', text.col='red',
       text.font=1, box.col='red')
#6월
data1<-readLines("응답소_2015_05.txt")
data2<-sapply(data1, extractNoun, USE.NAMES=F)
head(unlist(data2),30)
data3<-unlist(data2)

txt<-readLines('응답소gsub.txt')
for(i in 1:length(txt)){
  data3<-gsub((txt[i]), '', data3)
}
write(unlist(data3),'응답소_2015_06_1.txt')
data4<-read.table('응답소_2015_06_1.txt')
head(data4)
nrow(data4)
wordcount<-table(data4)
head(sort(wordcount, decreasing=T), 30)

set.seed(1234)
palete<-brewer.pal(8,'Dark2')
wordcloud(names(wordcount), freq=wordcount,scale=c(3, 0.2), rot.per=0.25, min.freq=2,  
          random.order=F, random.color=T, colors=palete)
legend(0.2, 0.8, '서울시 응답소 6월 분석', cex=0.8, fill=NA, border=NA, bg='white', text.col='red',
       text.font=1, box.col='red')
#7월 
data1<-readLines("응답소_2015_07.txt")
data2<-sapply(data1, extractNoun, USE.NAMES=F)
head(unlist(data2),30)
data3<-unlist(data2)

txt<-readLines('응답소gsub.txt')
for(i in 1:length(txt)){
  data3<-gsub((txt[i]), '', data3)
}
write(unlist(data3),'응답소_2015_07_1.txt')
data4<-read.table('응답소_2015_07_1.txt')
head(data4)
nrow(data4)
wordcount<-table(data4)
head(sort(wordcount, decreasing=T), 30)

set.seed(1234)
palete<-brewer.pal(8,'Dark2')
wordcloud(names(wordcount), freq=wordcount,scale=c(3, 0.2), rot.per=0.25, min.freq=2, 
          random.order=F, random.color=T, colors=palete)
legend(0.2, 0.8, '서울시 응답소 7월 분석', cex=0.8, fill=NA, border=NA, bg='white', text.col='red',
       text.font=1, box.col='red')
#8월
data1<-readLines("응답소_2015_08.txt")
data2<-sapply(data1, extractNoun, USE.NAMES=F)
head(unlist(data2),30)
data3<-unlist(data2)

txt<-readLines('응답소gsub.txt')
for(i in 1:length(txt)){
  data3<-gsub((txt[i]), '', data3)
}
write(unlist(data3),'응답소_2015_08_1.txt')
data4<-read.table('응답소_2015_08_1.txt')
head(data4)
nrow(data4)
wordcount<-table(data4)
head(sort(wordcount, decreasing=T), 30)

set.seed(1234)
palete<-brewer.pal(8,'Dark2')
wordcloud(names(wordcount), freq=wordcount,scale=c(3, 0.2), rot.per=0.25, min.freq=2,
          random.order=F, random.color=T, colors=palete)
legend(0.2, 0.8, '서울시 응답소 8월 분석', cex=0.8, fill=NA, border=NA, bg='white', text.col='red',
       text.font=1, box.col='red')
#9월
data1<-readLines("응답소_2015_09.txt")
data2<-sapply(data1, extractNoun, USE.NAMES=F)
head(unlist(data2),30)
data3<-unlist(data2)

txt<-readLines('응답소gsub.txt')
for(i in 1:length(txt)){
  data3<-gsub((txt[i]), '', data3)
}
write(unlist(data3),'응답소_2015_09_1.txt')
data4<-read.table('응답소_2015_09_1.txt')
head(data4)
nrow(data4)
wordcount<-table(data4)
head(sort(wordcount, decreasing=T), 30)

set.seed(1234)
palete<-brewer.pal(8,'Dark2')
wordcloud(names(wordcount), freq=wordcount,scale=c(3, 0.2), rot.per=0.25, min.freq=2, 
          random.order=F, random.color=T, colors=palete)
legend(0.2, 0.8, '서울시 응답소 9월 분석', cex=0.8, fill=NA, border=NA, bg='white', text.col='red',
       text.font=1, box.col='red')
#10월
data1<-readLines("응답소_2015_10.txt")
data2<-sapply(data1, extractNoun, USE.NAMES=F)
head(unlist(data2),30)
data3<-unlist(data2)

txt<-readLines('응답소gsub.txt')
for(i in 1:length(txt)){
  data3<-gsub((txt[i]), '', data3)
}
write(unlist(data3),'응답소_2015_10_1.txt')
data4<-read.table('응답소_2015_10_1.txt')
head(data4)
nrow(data4)
wordcount<-table(data4)
head(sort(wordcount, decreasing=T), 30)

set.seed(1234)
palete<-brewer.pal(8,'Dark2')
wordcloud(names(wordcount), freq=wordcount,scale=c(3, 0.2), rot.per=0.25, min.freq=2,  
          random.order=F, random.color=T, colors=palete)
legend(0.2, 0.8, '서울시 응답소 10월 분석', cex=0.8, fill=NA, border=NA, bg='white', text.col='red',
       text.font=1, box.col='red')
#11월
data1<-readLines("응답소_2015_11.txt")
data2<-sapply(data1, extractNoun, USE.NAMES=F)
head(unlist(data2),30)
data3<-unlist(data2)

txt<-readLines('응답소gsub.txt')
for(i in 1:length(txt)){
  data3<-gsub((txt[i]), '', data3)
}
data3<-Filter(function(x) {nchar(x)>1}, data3)
write(unlist(data3),'응답소_2015_11_1.txt')
data4<-read.table('응답소_2015_11_1.txt')
head(data4)
nrow(data4)
wordcount<-table(data4)
head(sort(wordcount, decreasing=T), 30)

set.seed(1234)
palete<-brewer.pal(8,'Dark2')
wordcloud(names(wordcount), freq=wordcount,scale=c(3, 0.2), rot.per=0.25, min.freq=2,  
          random.order=F, random.color=T, colors=palete)
legend(0.2, 0.8, '서울시 응답소 11월 분석', cex=0.8, fill=NA, border=NA, bg='white', text.col='red',
       text.font=1, box.col='red')
#12월
data1<-readLines("응답소_2015_12.txt")
data2<-sapply(data1, extractNoun, USE.NAMES=F)
head(unlist(data2),30)
data3<-unlist(data2)

txt<-readLines('응답소gsub.txt')
for(i in 1:length(txt)){
  data3<-gsub((txt[i]), '', data3)
}
data3<-Filter(function(x) {nchar(x)>1}, data3)
write(unlist(data3),'응답소_2015_12_1.txt')
data4<-read.table('응답소_2015_12_1.txt')
head(data4)
nrow(data4)
wordcount<-table(data4)
head(sort(wordcount, decreasing=T), 30)

set.seed(1234)
palete<-brewer.pal(8,'Dark2')
wordcloud(names(wordcount), freq=wordcount,scale=c(4, 0.2), rot.per=0.25, min.freq=2, 
          random.order=F, random.color=T, colors=palete)
legend(0.2, 0.8, '서울시 응답소 12월 분석', cex=0.8, fill=NA, border=NA, bg='white', text.col='red',
       text.font=1, box.col='red')
