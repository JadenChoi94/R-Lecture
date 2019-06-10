#Anscombe's Qiartet
#기술통계량(평균(x), 평균(y), 분산(x) 분산(y) 상관계수, 회귀식)
#동일한 4개의 데이터셋
anscombe
str(anscombe)
ans_x_mean<-anscombe %>%
  select(x1,x2,x3,x4) %>%
  summarise_each(list(mean), x1,x2,x3,x4); ans_x_mean

ans_y_mean<-anscombe %>%
  select(y1,y2,y3,y4) %>%
  summarise_each(list(mean), y1,y2,y3,y4); ans_y_mean

ans_x_var<-anscombe %>%
  select(x1,x2,x3,x4) %>%
  summarise_each(list(var), x1,x2,x3,x4); ans_x_var

ans_y_var<-anscombe %>%
  select(y1,y2,y3,y4) %>%
  summarise_each(list(var), y1,y2,y3,y4); ans_y_var

p1<-ggplot(anscombe) +
  geom_point(aes(x1, y1), color='darkorange', size=3) +
  theme_bw()+
  scale_x_continuous(breaks=seq(0,20,2))+
  scale_y_continuous(breaks=seq(0,12,2))+
  geom_abline(intercept = 3, slope=0.5, color='cornflowerblue')+
  expand_limits(x=0, y=0)+
  labs(title='dataset 2'); p1

p4<-ggplot(anscombe) +
  geom_point(aes(x4, y4), color='darkorange', size=3) +
  theme_bw()+
  scale_x_continuous(breaks=seq(0,20,2))+
  scale_y_continuous(breaks=seq(2,14,2))+
  geom_abline(intercept = 3, slope=0.5, color='cornflowerblue')+
  expand_limits(x=0, y=0)+
  labs(title='dataset 4'); p4
