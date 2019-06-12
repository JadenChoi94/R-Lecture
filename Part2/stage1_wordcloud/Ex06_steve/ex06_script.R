#예제 1-6. 스티브잡스 연설문 분석

setwd('D:/Workspace/R_Data_Analysis/Part2/stage1_wordcloud/Ex06_steve')
library(rJava) #필수 패키지 로딩
library(KoNLP)
library(wordcloud)
library(stringr)
install.packages('tm')
library(tm)
#tm 동작 패키지 확인 
data1<-readLines('tm_test1.txt'); data1
class(data1)
corp1<-Corpus(VectorSource(data1))
corp1

inspect(corp1)
tdm<-TermDocumentMatrix(corp1)
tdm
m<-as.matrix(tdm)
m
corp2 <- tm_map(corp1,stripWhitespace)
corp2 <- tm_map(corp2,tolower) 
corp2 <- tm_map(corp2,removeNumbers) 
corp2 <- tm_map(corp2,removePunctuation) 
#corp2 <- tm_map(corp2,PlainTextDocument) 
#stopword2 <- c(stopwords('en'),"and","but", 'not') 
corp2 <- tm_map(corp2,removeWords,stopwords('en')) 
tdm2 <- TermDocumentMatrix(corp2)
tdm2
m2 <- as.matrix(tdm2)
m2 
class(m2)
colnames(m2)<-c(1:4); m2

freq1<-sort(rowSums(m2), decreasing=T)
head(freq1, 20)
freq2<-sort(colSums(m2), decreasing = T)
head(freq2, 20)

findFreqTerms(tdm2,2) #특정횟수이상 언급된것들만 출력
palete<-brewer.pal(7, 'Set3')
wordcloud(names(freq1), freq = freq1, scale=c(5,1),min.freq=1,
          colors=palete, random.order=F, random.color=T)
legend(0.3, 1 ,"tm Package Test #1 ", cex=1,
       fill=NA, border=NA, bg="white",
       text.col="red",text.font=2,box.col="red")
#스티브잡스 연설문
data1<-readLines('steve.txt'); data1
class(data1)
corp1<-Corpus(VectorSource(data1))
corp1

inspect(corp1)
tdm<-TermDocumentMatrix(corp1)
tdm
m<-as.matrix(tdm)
m
corp2 <- tm_map(corp1,stripWhitespace)
corp2 <- tm_map(corp2,tolower) 
corp2 <- tm_map(corp2,removeNumbers) 
corp2 <- tm_map(corp2,removePunctuation) 
#corp2 <- tm_map(corp2,PlainTextDocument) 
#stopword2 <- c(stopwords('en'),"and","but", 'not') 
corp2 <- tm_map(corp2,removeWords,stopwords('en')) 
tdm2 <- TermDocumentMatrix(corp2)
tdm2
m2 <- as.matrix(tdm2)
m2 
class(m2)
colnames(m2)<-seq(10,590,10); m2

freq1<-sort(rowSums(m2), decreasing=T)
head(freq1, 20)
freq2<-sort(colSums(m2), decreasing = T)
head(freq2, 20)

findFreqTerms(tdm2,2) #특정횟수이상 언급된것들만 출력
palete<-brewer.pal(7, 'Set3')
wordcloud(names(freq1), freq = freq1, scale=c(3,0.5),min.freq=1,
          colors=palete, random.order=F, random.color=T)
legend(0.3, 0.9 ,"Steve jobs 연설문", cex=1,
       fill=NA, border=NA, bg="white",
       text.col="red",text.font=2,box.col="red")

