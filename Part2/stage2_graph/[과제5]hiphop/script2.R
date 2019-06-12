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
windowsFonts(malgun = "맑은 고딕")
theme_update(text = element_text(family = "malgun"))
#
txt <- readLines("hiphop.txt")
corp1 <- Corpus(VectorSource(txt))
# 특수문자 제거
corp2 <- tm_map(corp1,stripWhitespace)
corp2 <- tm_map(corp1,removePunctuation)
# 명사만 추출
nouns <- sapply(corp2, extractNoun, USE.NAMES = F)
class(nouns)
nouns
# 단어별 빈도표 작성
wordcount <- table(unlist(nouns))
df_word <- as.data.frame(wordcount, stringsAsFactors = F)

#  변수명 수정
names(df_word) # 자동으로 Var1, Freq 생성됨
df_word
df_word <-rename(df_word, word = Var1)

# 두 글자 이상 단어 추출
df_word <- filter(df_word, nchar(word)>=2)
df_word

# 빈도순 정렬 후 상위 10개 단어만 추출
top10 <- df_word %>%
  arrange(desc(Freq)) %>%
  head(10)
top10

palete<-brewer.pal(7, 'Set3')
wordcloud(words = df_word$word, freq = df_word$Freq,  min.freq = 2,
  random.order =  F,  rot.per = 0.1,  scale = c(3,0.3),
  colors = palete)
legend(0.3, 0.9 ,"hiphop 가사 단어 빈도 분석", cex=1, fill=NA, border=NA, bg="white", 
       text.col="red",text.font=2,box.col="red")
#=============================================
str(top10) 
# 파이차트
ggplot(top10, aes(x='', y=Freq, fill=word)) +
  geom_bar(width=1, stat='identity') +
  ggtitle('hiphop 가사 단어 빈도 분석') +
  coord_polar("y", start = 0) +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue"))
#막대그래프
ggplot(top10, aes(x=word, y=Freq, fill=word)) +
  geom_bar(stat='identity') +
  ggtitle('hiphop 가사 단어 빈도 분석')+
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue"))
 
options(digits = 2)
top10 <- top10 %>%
  mutate(pct = Freq / sum(Freq) * 100) %>%
  mutate(ylabel = paste(sprintf("%s\n%4.1f", word, pct), '%', sep='')) %>%
  arrange(desc(word)) %>%
  mutate(ypos = cumsum(pct) - 0.5*pct)
top10

