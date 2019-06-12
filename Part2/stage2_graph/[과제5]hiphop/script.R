#hiphop
setwd('D:/Workspace/R_Data_Analysis/Part2/stage2_graph/[과제5]hiphop')
library(KoNLP) 
library(dplyr)
library(rJava)
library(tm)
library(stringr)
library(wordcloud)
library(RColorBrewer)
library(dplyr)
library(ggplot2)
library(plotrix)
library(extrafont)
useSejongDic()
windowsFonts()
#================================================
data1<-readLines('hiphop.txt')

data1 <- sapply(data1,extractNoun,USE.NAMES=F)
corp1 <- Corpus(VectorSource(data1)) 

tdm <- TermDocumentMatrix(corp1)
tdm
m <- as.matrix(tdm)
m

corp2 <- tm_map(corp1,stripWhitespace)
corp2 <- tm_map(corp2,removeNumbers) 
corp2 <- tm_map(corp2,removePunctuation)
corp2 <- tm_map(corp2,removeWords,stopwords('en'))
 
tdm2 <- TermDocumentMatrix(corp2)
tdm2
m2 <- as.matrix(tdm2)
m2
class(m2)
dim(m2)
colnames(m2)<-c(1:4261)
m2

freq1<-sort(rowSums(m2), decreasing = T)
head(freq1, 20)
freq2<-sort(colSums(m2), decreasing=T)
head(freq2, 100)

palete<-brewer.pal(7, 'Set3')
wordcloud(names(freq1), freq = freq1, scale=c(4,0.7), min.freq=2,
          colors=palete, random.order=F, random.color=T)
legend(0.3, 0.9 ,"hiphop 가사 단어 빈도 분석", cex=1, fill=NA, border=NA, bg="white", 
       text.col="red",text.font=2,box.col="red")

#==================================================================================

top10 <- head(sort(freq1, decreasing=T),10)
top10
write(unlist(freq1),'aa.txt')
rev<-read.table("aa.txt", header=TRUE, fill=TRUE)
rev
nrow(rev)
wordcount<-table(rev)
head(sort(wordcount, decreasing=T),20)
pct <- round(top10/sum(top10) * 100 ,1)  
names(top10)
lab <- paste(names(top10),"\n",pct,"%", sep = '')
lab
#일반 파이
pie(top10, main="hiphop 가사 단어 빈도 분석", col=palete, 
    cex=0.8,labels = lab)
#ggplot로 파이 만들기
str(top10) #데이터프레임으로 바꾸기
df_top10<-as.data.frame(top10)
df_top10

ggplot(df_top10, aes(x='', y=, fill=rev)) +
  geom_bar(width=1, stat='identity')+
  ggtitle('hiphop 가사 단어 빈도 분석')
#===============================================================

