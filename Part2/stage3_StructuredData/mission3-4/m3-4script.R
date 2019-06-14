#3-4. 정규직은 정녕 꿈인가요?
library(reshape2)
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
#========================================================================
#code from teacher
# 고용형태별 근무일수
setwd('D:/Workspace/R_Data_Analysis/Part2/stage3_StructuredData/mission3-4')
regular <- read.csv('고용형태별_취업자현황_2007_2013년.csv')
regular <- select(regular, 고용형태, X2007, X2008, X2009, X2010, X2011, X2012, X2013) 
regular
regular <- regular[c(-1,-3,-6,-7,-8,-13),] # 빈행 삭제
regular
regular_melt <- melt(regular, id=c('고용형태'),
                     variable.name='연도', value.name='근무일수')
regular_melt$연도 <- gsub("X", "", regular_melt$연도)# X지우기 
ggplot(regular_melt, aes(x=연도,y=as.numeric(근무일수), fill=고용형태,
                         color=고용형태, group=고용형태)) +
  geom_line(linetype=1, size=1) +
  geom_point(shape=19, size=3) +
  geom_hline(yintercept=seq(10,25,1), lty='dashed', size=0.1) +
  #  lims(y=c(0,25)) +
  #  scale_y_continuous(limits = c(10, 25)) +
  #  ylim(0,25)+
  theme_bw(base_family='malgun',base_size = 15) +
  theme(axis.title.x = element_blank()) + #선
  theme(axis.title.y = element_blank()) + #선
  theme(axis.text.x  = element_text(angle=45, hjust=1)) + #x축 기울기
  ggtitle('고용형태별 근무일수(단위:일) 출처:통계청') +
  theme(plot.title = element_text(family="malgun", face = "bold", hjust = 0.5,
                                  vjust = 2.5, size = 15, color = "darkblue"))

# 고용형태별 급여현황
regular_m <- read.csv('고용형태별_취업자현황_2007_2013년.csv',header=T)
regular_m
regular_m <- select(regular_m,고용형태,X2007.4,X2008.4,X2009.4,X2010.4,X2011.4,X2012.4,X2013.4) 
regular_m <- regular_m[c(-1,-3,-6,-7,-8,-13),]

colnames(regular_m) <- c('고용형태','2007','2008','2009','2010','2011','2012','2013')
regular_m_melt <- melt(regular_m,id=c('고용형태'),variable.name='연도',value.name='월급여')
regular_m_melt$월급여 <- gsub(",","",regular_m_melt$월급여)

ggplot(regular_m_melt, aes(x=연도, y=as.numeric(월급여), fill=고용형태,
                           color=고용형태, group=고용형태)) +
  geom_line(linetype=1, size=1) +
  geom_point(shape=19, size=3) +
  geom_hline(yintercept=seq(500,3000,100), lty='dashed', size=0.1) +
  theme_bw(base_family='malgun', base_size = 10) +
  theme(axis.title.x = element_blank()) +
  theme(axis.title.y = element_blank()) +
  theme(axis.text.x  = element_text(angle=45, hjust=1)) +
  ggtitle('고용형태별 급여현황(단위:천원) 출처:통계청') +
  theme(plot.title = element_text(family="malgun", face = "bold", hjust = 0.5,
                                  vjust = 2.5, size = 15, color = "darkblue"))