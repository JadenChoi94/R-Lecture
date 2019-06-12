#예제 2-1.  "제주도 여행코스 추천" 검색어 결과를 그래프로 표시하기

setwd('D:/Workspace/R_Data_Analysis/Part2/stage2_graph/Ex01_Jeju')
library(KoNLP)  
library(wordcloud)
library(stringr)  # <- 패키지를 로딩합니다
useSejongDic() 
mergeUserDic(data.frame(readLines("제주도여행지.txt"), "ncn"))

txt <- readLines("jeju.txt") 
place <- sapply(txt,extractNoun,USE.NAMES=F)
place   
head(unlist(place), 30)
cdata <- unlist(place) 
place <- str_replace_all(cdata,"[^[:alpha:]]","")  # ---한글 , 영어 외는 삭제
place
place<-gsub(' ','',place)

txt<-readLines("제주도여행코스gsub.txt")
txt
for(i in 1:length(txt)){
  place<-gsub((txt[i]),'',place)
}
place
place<-Filter(function(x) {nchar(x)>=2}, place)
write(unlist(place), 'jeju_2.txt')
rev<-read.table("jeju_2.txt")
nrow(rev)
wordcount<-table(rev)
head(sort(wordcount, decreasing=T),30)
#새로운거 ↓↓↓↓↓
top10 <- head(sort(wordcount, decreasing=T),10)
pie(top10,main="제주도 추천 여행 코스 TOP 10")
library(RColorBrewer) 
palete <- brewer.pal(10,"Set3") 
pie(top10,col=palete, radius=1,main="제주도 추천 여행 코스 TOP 10")

pct <- round(top10/sum(top10) * 100 ,1) #round 함수? 
names(top10)
lab <- paste(names(top10),"\n",pct,"%", sep = '') #lab에 옵션 추가하기! 
lab
pie(top10, main="제주도 추천 여행 코스 TOP 10", col=palete, 
     cex=0.8,labels = lab)

#ggplot 으로 바꾸기!
library(ggplot2)
str(top10) #테이블을 데이터프레임으로 바꾸자
df_top10<-as.data.frame(top10)
df_top10
ggplot(df_top10, aes(x='', y=Freq, fill=rev))+
  geom_bar(width=1, stat='identity') +
  coord_polar('y', start=0) #원으로 말기

library(dplyr)
options(digits=2) #R프로그램 전체에 영행을주는, 소수점하고 두자리까지만 출력하겠다
df_top10<-df_top10 %>%
  mutate(pct=Freq/sum(Freq)*100) %>%
  #mutate(ylabel=paste(sprintf('%4.1f', pct), '%', sep=''))
  mutate(ylabel=paste(sprintf('%s\n%4.1f', rev, pct), '%', sep=''))  %>%
  arrange(desc(rev))%>%
  mutate(ypos=cumsum(pct)-0.5*pct)

df_top10
ggplot(df_top10, aes(x='', y=Freq, fill=rev))+
  geom_bar(width=1, stat='identity') +
  geom_text(aes(y=ypos, label=ylabel), color='black') +
  coord_polar('y', start=0) +
  ggtitle("제주도 추천 여행 코스 TOP 10")

install.packages('extrafont')
library(extrafont)
windowsFonts()
windowsFonts(malgun = '맑은고딕')
theme_update(text = element_text(familt='malgun'))

ggplot(df_top10, aes(x='', y=Freq, fill=rev))+
  geom_bar(width=1, stat='identity') +
  coord_polar('y', start=0) +
  ggtitle("제주도 추천 여행 코스 TOP 10") +
  theme(plot.title=element_text(face='bold', hjust=0.5,
                                size=15, color='darkblue'))+
  geom_text(aes(y=ypos, label=ylabel), color='black') 

#bar 형태의 그래프로 표시하기
bchart <- head(sort(wordcount, decreasing=T),10)
bchart
bp <- barplot(bchart,  main = "제주도 추천 여행 코스 TOP 10 ", col = rainbow(10), 
              cex.names=0.7, las = 2,ylim=c(0,25))
pct <- round(bchart/sum(bchart) * 100 ,1)
pct

text(x = bp, y = bchart*1.05, labels = paste("(",pct,"%",")"), col = "black", cex = 0.7)
text(x = bp, y = bchart*0.95, labels = paste(bchart,"건"), col = "black", cex = 0.7)

#옆으로 누운 바 그래프 그리기
barplot(bchart, main="제주도 추천 여행 코스 Top 10", col=rainbow(10),
        xlim=c(0,25), cex.name=0.7, las=1, horiz=T)
text(y = bp, x = bchart*0.9, labels = paste(bchart,"건"), col = "black", cex = 0.7)
text(y = bp, x = bchart*1.15, labels = paste("(",pct,"%",")"), col = "black", cex = 0.7)

#데이터를 3D Pie Chart 로 표현합니다
library(plotrix)
th_pct <- round(bchart/sum(bchart) * 100,1)
th_names <- names(bchart)
th_labels <- paste(th_names,"\n","(",th_pct,")")
th_labels
pie3D(bchart,main="제주도 추천 여행 코스 Top 10",col=rainbow(10),
      cex=0.3,labels=th_labels,explode=0.05)
      
#예제 2-2. 고객 불만 게시판 분석 후 결과를 그래프로 표시하기
