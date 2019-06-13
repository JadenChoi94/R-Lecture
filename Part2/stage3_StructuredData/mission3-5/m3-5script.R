#3-5. 전염병을 미리 막아 보자구요!
setwd('D:/Workspace/R_Data_Analysis/Part2/stage3_StructuredData/mission3-5')
flu<-read.csv('1군전염병발병현황_년도별.csv', header=TRUE)
flu
arr_flu<-melt(flu, id=c('년도별'),
             variable.name='질병', value.name='발병빈도')
arr_flu

palete = c(brewer.pal(12, 'Paired'), 
           brewer.pal(12, 'Paired'), '#56B4E9')
death<-ggplot(arr_flu, aes(x=년도별, y=발병빈도, fill=질병, color=질병, group=질병))+
  geom_line(linetype=1, size=1) +
  geom_point(size=3) + 
  geom_hline(yintercept=seq(0,6000,200), lty='dotted', size=0.1) +
  theme_classic(base_family="malgun", base_size = 10) +
  ggtitle(paste('1군 전염병 발병현황-년도별(단위:건수) 출처 통계청')) +
  theme(plot.title = element_text(family="malgun",
                                  face = "bold",
                                  hjust = 0.5, 
                                  size = 15, 
                                  color = "darkblue"))
death
ggplotly(death)
#=======================================================================================
flu2<-read.csv('1군전염병발병현황_월별.csv', header=TRUE, stringsAsFactors = FALSE)
flu2
arr_flu2<-melt(flu2, id=c('월별'),
              variable.name='질병', value.name='발병빈도')
arr_flu2

palete = c(brewer.pal(12, 'Paired'), 
           brewer.pal(12, 'Paired'), '#56B4E9')
death2<-ggplot(arr_flu2, aes(x=월별, y=발병빈도, fill=질병, color=질병, group=질병))+
  geom_line(linetype=1, size=1) +
  geom_point(size=3) + 
  geom_hline(yintercept=seq(0,1100,50), lty='dotted', size=0.1) +
  theme_classic(base_family="malgun", base_size = 10) +
  ggtitle(paste('1군 전염병 발병현황-년도별(단위:건수) 출처 통계청')) +
  theme(plot.title = element_text(family="malgun",
                                  face = "bold",
                                  hjust = 0.5, 
                                  size = 15, 
                                  color = "darkblue"))+
  theme(axis.text.x=element_text(angle=90, hjust=1, vjust=1,
                                 colour="black", size=8))
death2
ggplotly(death2)
#====================================================================================
#A형간염을 제외한 발생 현황
flu3<-read.csv('1군전염병발병현황_년도별.csv', header=TRUE, stringsAsFactors = FALSE)
flu3<-flu3[,-6]
flu3
arr_flu3<-melt(flu3, id=c('년도별'),
               variable.name='질병', value.name='발병빈도')
arr_flu3

palete = c(brewer.pal(12, 'Paired'), 
           brewer.pal(12, 'Paired'), '#56B4E9')
death3<-ggplot(arr_flu3, aes(x=년도별, y=발병빈도, fill=질병, color=질병, group=질병))+
  geom_line(linetype=1, size=1) +
  geom_point(size=3) + 
  geom_hline(yintercept=seq(0,1100,50), lty='dotted', size=0.1) +
  theme_classic(base_family="malgun", base_size = 10) +
  ggtitle(paste('1군 전염병(A형 제외) 발병현황-년도별(단위:건수) 출처 통계청')) +
  theme(plot.title = element_text(family="malgun",
                                  face = "bold",
                                  hjust = 0.5, 
                                  size = 15, 
                                  color = "darkblue"))+
  theme(axis.text.x=element_text(angle=90, hjust=1, vjust=1,
                                 colour="black", size=8))
death3
ggplotly(death3)
