#3-3 취직하기가 정말 어렵네요
setwd('D:/Workspace/R_Data_Analysis/Part2/stage3_StructuredData/mission3-3')
library(reshape2)
library(ggplot2)
library(reshape2)
library(extrafont)
windowsFonts(malgun = "맑은 고딕")
theme_update(text = element_text(family = "malgun"))


jobless<-read.csv('2000-2013년 연령별실업율_연령별평균_세로.csv', stringsAsFactors = FALSE)
jobless
arr_job<-melt(jobless, id=c('연도'),
     variable.name='나이', value.name='실업률')
arr_job

palete = c(brewer.pal(12, 'Paired'), 
           brewer.pal(12, 'Paired'), '#56B4E9')
goojicja<-ggplot(arr_job, aes(x=연도, y=실업률, group=나이, fill=나이, color=나이))+
  geom_line(linetype=1, size=1) +
  geom_point(size=3) +
  geom_hline(yintercept=seq(0,10,1), lty='dotted', size=0.1) +
  theme_classic(base_family="malgun", base_size = 10) +
  ggtitle(paste('연도별 실업률 현황(단위:%) 출처: 통계청')) +
  theme(plot.title = element_text(family="malgun",
                                  face = "bold",
                                  hjust = 0.5, 
                                  size = 15, 
                                  color = "darkblue"))
goojicja
ggplotly(goojicja)
