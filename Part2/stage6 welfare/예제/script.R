#데이터 분석 프로젝트
#한국인의 삶을 파악하라!
setwd('D:/Workspace/R_Data_Analysis/Part2/stage6 welfare/예제')
install.packages('foreign')
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)
raw_welfare<-read.spss(file='Koweps_hpc10_2015_beta1.sav', to.data.frame = T)
raw_welfare
#데이터복하하기
welfare<-raw_welfare
#데이터 검토하기
head(welfare)
tail(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)

#변수명바꾸기
welfare<-rename(welfare,
                sex=h10_g3,
                birth=h10_g4,
                marriage=h10_g10,
                religion=h10_g11,
                income=p1002_8aq1,
                code_job=h10_eco9,
                code_region=h10_reg7)
#2.성별에 따른 월급 차이
#성별 변수 검토 및 전처리
#1) 변수 검토하기
class(welfare$sex)

#2)전처리
#이상치확인
table(welfare$sex)
#이상치 결측 처리 (이상치가발생하면 3번쨰 칼럼에 뜸)
welfare$sex<-ifelse(welfare$sex == 9, NA, welfare$sex)
table(welfare$sex)
#결측치 확인 
table(is.na(welfare$sex))

#성별 항목 이름 부여
welfare$sex<-ifelse(welfare$sex==1,'male','female')
table(is.na(welfare$sex))

table(welfare$sex)
qplot(welfare$sex)

#월급변수검토 및 전처리
# 1) 변수 검토하기
class(welfare$income)
summary(welfare$income)
qplot(welfare$income)
qplot(welfare$income)+xlim(0,1000)

#2)전처리
#이상치확인
summary(welfare$income)
#이상치 결측 처리 
welfare$income<-ifelse(welfare$income %in% c(0,9999), NA, welfare$income) #0이나 9999면! 
#결측치 확인 
table(is.na(welfare$income))

#성별 월급 평균표 만들기
sex_income <-welfare %>%
  filter(!is.na(income))%>%
  group_by(sex) %>%
  summarise(mean_income=mean(income))
sex_income
ggplot(data=sex_income, aes(x=sex, y=mean_income, fill=sex))+
  geom_col()

#3. 나이와 월급의 관계
#몇살때 월급을 가장 많이 받을까
# 1) 변수검토
class(welfare$birth)
summary(welfare$birth)
qplot(welfare$birth)

# 2)전처리
# 이상치확인
summary(welfare$birth)
# 결측치 확인 
table(is.na(welfare$birth))
# 이상치 결측 처리 
welfare$birth<-ifelse(welfare$birth == 9999, NA, welfare$birth) 
table(is.na(welfare$birth))
#파생변수 만들기 -나이
welfare$age<-2015-welfare$birth + 1
summary(welfare$age)
qplot(welfare$age)

# 나이에 따른 월급 평균표 만들기
age_income <-welfare %>%
  filter(!is.na(income))%>%
  group_by(age) %>%
  summarise(mean_income=mean(income))
welfare %>%
  filter(!is.na(income))%>%
  group_by(age) %>%
  summarise(mean_income=mean(income)) %>%
  arrange(desc(mean_income)) %>%
  head(5)
head(age_income)
summary(age_income)
ggplot(age_income, aes(x=age, y=mean_income))+
  geom_line()

#4.연령대에 따른 월급차이
#어떤 연령대에 월급이 가장 많을까?
# 파생변수 만들기-연령대
welfare<-welfare %>%
  mutate(ageg=ifelse(age<30,'young',
                     ifelse(age<=59,'middle','old')))
table(welfare$ageg)

#연령대별 월급 평균표 만들기
ageg_income <-welfare %>%
  filter(!is.na(income))%>%
  group_by(ageg) %>%
  summarise(mean_income=mean(income))
ageg_income
ggplot(ageg_income, aes(x=ageg, y=mean_income, fill=ageg))+
  geom_col()+
  scale_x_discrete(limits=c('young','middle','old'))
  
#추가문제
#숫자로 연령대 표기해보기
welfare<-welfare %>%
  mutate(연령대=ifelse(age<30,'20대 이하',
                ifelse(age<40,'30대',
                ifelse(age<50,'40대',
                ifelse(age<60,'50대','60대이상')))))
table(welfare$연령대)

#연령대별 월급 평균표 만들기
연령대_income <-welfare %>%
  filter(!is.na(income))%>%
  group_by(연령대) %>%
  summarise(mean_income=mean(income))
연령대_income
ggplot(연령대_income, aes(x=연령대, y=mean_income, fill=연령대))+
  geom_col()

#==================================================
#연령대별 및 성별 월급 차이
sex_income <-welfare %>%
  filter(!is.na(income))%>%
  group_by(ageg, sex) %>%
  summarise(mean_income=mean(income))
sex_income
#그래프만들기
ggplot(sex_income, aes(x=ageg, y=mean_income, fill=sex))+
  geom_col() +
  scale_x_discrete(limits=c('young','middle','old'))
#분리된 그래프
ggplot(sex_income, aes(x=ageg, y=mean_income, fill=sex))+
  geom_col(position='dodge') +
  scale_x_discrete(limits=c('young','middle','old'))
#라인그래프 만들기
ggplot(sex_income, aes(x=ageg, y=mean_income, fill=sex))+
  geom_line()
#==========================================================================
#6.직업별 월급차이 
class(welfare$code_job)
table(welfare$code_job)
#직업분류코드
list_job<-read_excel('Koweps_Codebook.xlsx', col_names=T, sheet=2)
head(list_job)
dim(list_job)

#welfare에 직업명 결합
welfare<-left_join(welfare, list_job, id='code_job')
welfare %>%
  filter(!is.na(code_job)) %>%
  select(code_job, job) %>%
  head(10)

#직업별 월급 평균표 만들기
job_income<-welfare %>%
  filter(!is.na(job) & !is.na(income)) %>%
  group_by(job) %>%
  summarise(mean_income =mean(income))
head(job_income)

#상위10개 추출
top10<-job_income %>%
  arrange(desc(mean_income)) %>%
  head(10)
top10
#그래프 만들기
ggplot(top10, aes(x=reorder(job, -mean_income),
                  y=mean_income, fill=job))+
  geom_col()+
  coord_flip()

#하위10개군
bottom10<-job_income %>%
  arrange(mean_income) %>%
  head(10)
bottom10
ggplot(top10, aes(x=reorder(job, -mean_income),
                  y=mean_income,fill=job))+
  geom_col()+
  coord_flip()+
  ylim(0,850)

#성별 직업 빈도 분석
#남성
job_male<-welfare %>%
  filter(!is.na(job)&sex=='male') %>%
  group_by(job)%>%
  summarise(n=n()) %>%
  arrange(desc(n)) %>%
  head(10)
job_male
#여성
job_female<-welfare %>%
  filter(!is.na(job)&sex=='female') %>%
  group_by(job)%>%
  summarise(n=n()) %>%
  arrange(desc(n)) %>%
  head(10)
job_female

ggplot(data=job_male, aes(x=reorder(job,n), y=n))+
  geom_col()+
  coord_flip()
ggplot(data=job_female, aes(x=reorder(job,n), y=n))+
  geom_col()+
  coord_flip()

#종교유무에 따른 이혼율
welfare$religion<-ifelse(welfare$religion==1, 'yes',' no')
table(welfare$religion)
qplot(welfare$religion)

class(welfare$marriage)
table(welfare$marriage)

welfare$group_marriage<-ifelse(welfare$marriage==1, 'marriage',
                               ifelse(welfare$marriage==3,'divorce', NA))
table(welfare$group_marriage)
table(is.na(welfare$group_marriage))
qplot(welfare$group_marriage)

# 1)종교유무에 따른 이혼율 표 만들기
# 이혼 추출
religion_marriage<-welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(religion, group_marriage)%>%
  summarise(n=n())%>%
  mutate(tot_group=sum(n)) %>%
  mutate(pct=round(n/tot_group*100,1))
religion_marriage

# 2) 그래프 만들기
divorce<-religion_marriage %>%
  filter(group_marriage=='divorce')%>%
  select(religion, pct)
divorce
ggplot(divorce, aes(x=religion, y=pct))+
  geom_col()

#연령대 및 종교 유무에 따른 이혼율 분석
ageg_marriage<-welfare %>%
  filter(!is.na(group_marriage))%>%
  group_by(ageg, group_marriage)%>%
  summarise(n=n())%>%
  mutate(tot_group=sum(n))%>%
  mutate(pct=round(n/tot_group *100,1))
ageg_marriage

#초년 제외, 이혼추출
ageg_divorce<-ageg_marriage %>%
  filter(ageg!='young'&group_marriage=='divorce')%>%
  select(ageg, pct)
ageg_divorce
ggplot(ageg_divorce, aes(x=ageg, y=pct))+
  geom_col()

#연령대 밑 종교 유무에 따른 이혼율 표
ageg_religion_marriage<-welfare %>%
  filter(!is.na(group_marriage)&ageg!='young')%>%
  group_by(ageg, religion, group_marriage)%>%
  summarise(n=n())%>%
  mutate(tot_group=sum(n))%>%
  mutate(pct=round(n/tot_group*100, 1))
ageg_religion_marriage

#연령대 및 종교 유무별 이혼율 표 만들기
df_divorce<-ageg_religion_marriage %>%
  filter(group_marriage=='divorce')%>%
  select(ageg, religion, pct)
df_divorce
ggplot(df_divorce, aes(x=ageg, y=pct, fill=religion))+
  geom_col(position='dodge')

#지역변수 검토 및 전처리하기
# 1)변수 검토

class(welfare$code_region)
table(welfare$code_region)
list_region<-data.frame(code_region=c(1:7),
                        region=c('서울',
                                 '수도권(인천/경기',
                                 '부산/경남/울산',
                                 '대구/경북',
                                 '대전/충남',
                                 '강원/충북',
                                 '광주/전남/전북/제주도'))
list_region
welfare<-left_join(welfare, list_region, id='code_region')
welfare%>%
  select(code_region, region)%>%
  head
# 지역별 연령대 비율표 만들기
region_ageg<-welfare %>%
  group_by(region, ageg) %>%
  summarise(n=n()) %>%
  mutate(tot_group=sum(n))%>%
  mutate(pct=round(n/tot_group*100, 2))
head(region_ageg)
ggplot(region_ageg, aes(x=region, y=pct, fill=ageg))+
  geom_col()+
  coord_flip()+
  scale_x_discrete(limits=order)
  #young, middle, old 순으로 보여주기

#노년층 비율 높은 순으로 막대 정렬하기
list_order_old<-region_ageg %>%
  filter(ageg=='old')%>%
  arrange(desc(pct))
list_order_old

#지역명 순서 변수 만들기

region_ageg$ageg<-factor(region_ageg$ageg,
                         level=c('old','middle','young'))
class(region_ageg$ageg)
levels(region_ageg$ageg)
