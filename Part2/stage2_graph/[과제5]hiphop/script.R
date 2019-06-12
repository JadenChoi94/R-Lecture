#hiphop
setwd('D:/Workspace/R_Data_Analysis/Part2/stage2_graph/[과제5]hiphop')
library(KoNLP) 
library(dplyr)
library(rJava)
library(tm)
library(wordcloud)
library(RColorBrewer)
library(dplyr)
library(ggplot2)
library(plotrix)
library(extrafont)
useSejongDic()
#================================================
data1<-readLines('hiphop.txt'); data1

data1 <- sapply(data1,extractNoun,USE.NAMES=F)
corp1 <- Corpus(VectorSource(data1)) 
data3 <- tm_map(corp1,stripWhitespace)
data3 <- tm_map(data3,removeNumbers) 
data3 <- tm_map(data3,removePunctuation)
data3 <- tm_map(data3,tolower)
data3 <- tm_map(data3,removeWords,stopwords('en'))
data3

tdm <- TermDocumentMatrix(data3)
tdm

m <- as.matrix(tdm)
m

data3<-tm_map(data3,tolower)

tdm2 <- TermDocumentMatrix(data3)
tdm2

m2 <- as.matrix(tdm2)
m2

class(m2)
dim(m)

freq1<-sort(rowSums(m2), decreasing = T)
head(freq1, 20)

colnames(m)<-c(1:4261)
freq1<-sort(rowSums(m2), decreasing=T)
head(freq1, 100)
freq2<-sort(colSums(m2), decreasing=T)
head(freq2, 100)

palete<-brewer.pal(7, 'Set3')
wordcloud(names(freq1), freq = freq1, scale=c(4,0.7), min.freq=2,
          colors=palete, random.order=F, random.color=T)
legend(0.3, 0.8 ,"hiphop 가사 단어 빈도 분석", cex=1, fill=NA, border=NA, bg="white", 
       text.col="red",text.font=2,box.col="red")

#==================================================================================
top10 <- head(sort(freq1, decreasing=T),10)
top10
palete <- brewer.pal(10,"Set3") 
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

write(unlist(df_top10),'aa.txt')

ggplot(df_top10, aes('', top10))+
  geom_bar(stat='identity', width=1)
  coord_polar('y', start=0)
#===============================================================

