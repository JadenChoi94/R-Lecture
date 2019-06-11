#예제1-3. 제주도 추천여행코스찾기

setwd('D:\Workspace\R_Data_Analysis\Part2\stage1_wordcloud\Ex03_Jeju')
library(rJava) #필수 패키지 로딩
library(KoNLP)
library(wordcloud)
library(stringr)
useSejongDic()

mergeUserDic(data.frame(readLines("제주도여행지.txt"), 'ncn'))

txt<-readLines("jeju.txt"); txt
place<-sapply(txt, extractNoun, USE.NAMES=F)
place
head(unlist(place), 30)
cdata<-unlist(place)
place<-str_replace_all(cdata,"[^[:alpha:]]","") #--한글, 영어외는 삭제
place
place<-gsub(' ','',place)
txt<-readLines("제주도여행코스gsub.txt")
txt
cnt_txt<-length(txt)
cnt_txt
i<-1

for(i in 1:cnt_txt){
  place<-gsub((txt[i]),'',place)
}

place
place<-Filter(function(x) {nchar(x)>=2}, place)
write(unlist(place), 'jeju_2.txt')
rev<-read.table("jeju_2.txt")
nrow(rev)
wordcount<-table(rev)


set.seed(1234)
palete<-brewer.pal(8,'Dark2')
wordcloud(names(wordcount), freq=wordcount,scale=c(5, 0.2), rot.per=0.25, min.freq=2, family="AppleGothic", 
          random.order=F, ramdom.color=T, colors=palete)
legend(0.2, 0.9, '제주도 추천 여행 코스 분석', cex=0.8, fill=NA, border=NA, bg='white', text.col='red',
       text.font=1, box.col='red')
