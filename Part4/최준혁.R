install.packages("ggplot2")
library(ggplot2)
mpg
View(mpg)


#1번
a<-filter(mpg, displ<=4); a
b<-filter(mpg, displ>=5); b
a%>%
  summarise(average_hwy=mean(hwy))
b%>%
  summarise(average_hwy=mean(hwy))
#2번
mpg %>%
  group_by(manufacturer)%>%
  summarise(average_cty=mean(cty))
'''
mpg%>%
  filter(manufacturer %in% c('audi','toyota')) %>%
  group_by(manufacturer) %>%
  summarise(average=mean(cty)
'''
#3번
mpg %>%
  filter(manufacturer %in% c('chevrolet',       ))
  summarise(average=mean(hwy))

#4번
mpg %>%
  select(class, cty)->k; k

#5번
k %>%
  filter(class=='compact')%>%
  summarise(average_cty=mean(cty, na.rm=TRUE))
k %>%
  filter(class=='suv')%>%
  summarise(average_cty=mean(cty, na.rm=TRUE))
'''
mpg%>%
  filter()
  group_by()
  summarise()
'''
#6번
mpg %>%
    filter(manufacturer=='audi')%>%
    arrange(desc(hwy))%>%
    head(5)

#7-1번
mpg2<-mpg

mpg2 %>%
  mutate(합산연비변수=hwy+cty)%>%

    
#7-2번
mpg2 %>%
  mutate(평균연비변수=합산연비변수/2) %>%

#7-3번
mpg %>%
  arrange(desc(평균연비변수)) %>%
  head(3)
#7-4번
mpg%>%
  mutate(합산연비변수=hwy+cty)%>%
  mutate(평균연비변수=합산연비변수/2)%>%
  arrange(desc(평균연비변수)) %>%
  head(3)
#8번
mpg%>%
  group_by(class)%>%
  summarise(average_displ=mean(displ, na.rm=TRUE))
#9번
mpg%>%
  group_by(class)%>%
  summarise(average_cty=mean(cty, na.rm=TRUE))%>%
  arrange(desc(average_cty))
#10번
mpg %>%
  group_by(manufacturer)%>%
  summarise(average_hwy=mean(hwy, na.rm=TRUE))%>%
  arrange(desc(average_hwy))%>%
  head(3)
#11번
mpg%>%
  group_by(manufacturer)%>%
  filter(class=='compact')%>%
  arrange(desc(class))


