#3-4. 정규직은 정녕 꿈인가요?

setwd('D:/Workspace/R_Data_Analysis/Part2/stage3_StructuredData/mission3-4')
workdays<-read.csv('고용형태별_취업자현황_근무일수.csv', header=TRUE, stringsAsFactors = FALSE)
workdays
arr_wd<-melt(workdays, id=c('년도'),
              variable.name='근로자', value.name='근무일')
arr_wd

palete = c(brewer.pal(12, 'Paired'), 
           brewer.pal(12, 'Paired'), '#56B4E9')
workshift<-ggplot(arr_wd, aes(x=년도, y=근무일, fill=근로자, color=근로자))+
  geom_line(linetype=1, size=1) +
  geom_point(size=3) +
  geom_hline(yintercept=seq(0,30,5), lty='dotted', size=0.1) +
  theme_classic(base_family="malgun", base_size = 10) +
  ggtitle(paste('고용형태별 근무일수(단위:일) 출처:통계청')) +
  theme(plot.title = element_text(family="malgun",
                                  face = "bold",
                                  hjust = 0.5, 
                                  size = 15, 
                                  color = "darkblue"))
workshift
ggplotly(workshift)
#========================================================================
payment<-read.csv('고용형태별_취업자현황_월급현황.csv', header=TRUE, stringsAsFactors = FALSE)
payment
arr_pm<-melt(payment, id=c('년도'),
             variable.name='근로자', value.name='평균급여')
arr_pm

palete = c(brewer.pal(12, 'Paired'), 
           brewer.pal(12, 'Paired'), '#56B4E9')
monthly<-ggplot(arr_pm, aes(x=년도, y=평균급여, fill=근로자, color=근로자))+
  geom_line(linetype=1, size=1) +
  geom_point(size=3) +
  geom_hline(yintercept=seq(0,2600,200), lty='dotted', size=0.1) +
  theme_classic(base_family="malgun", base_size = 10) +
  ggtitle(paste('고용형태별 급여현황(단위:천원) 출처:통계청')) +
  theme(plot.title = element_text(family="malgun",
                                  face = "bold",
                                  hjust = 0.5, 
                                  size = 15, 
                                  color = "darkblue"))
monthly
ggplotly(monthly)
