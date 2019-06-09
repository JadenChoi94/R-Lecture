#sqldf() 패키지활용
install.packages("sqldf")
library(sqldf)
library(googleVis)
Fruits
sqldf('select * from Fruits')
sqldf('select * from Fruits where Fruit=\'Apples\'')
sqldf("select * from Fruits where Fruit='Apples'") # 위와같다
sqldf('select * from Fruits limit 3, 5') #세번째 데이터를 5개 출력 #limit사용법
sqldf('select * from Fruits order by Year desc') #내림차순
sqldf('select Fruit, sum(Sales) from Fruits group by Fruit') #중요 ↓↓↓
sqldf('select Fruit, sum(Sales), sum(Expenses), sum(Profit) from Fruits group by Fruit')
sqldf('select Year, avg(Sales), avg(Expenses), avg(Profit) from Fruits group by Year')
sqldf('select Year, avg(Sales), avg(Expenses), avg(Profit) from Fruits group by Year order by Profit desc')
sqldf('select min(Sales), max(Sales) from Fruits')
sqldf('select * from Fruits where Sales = 81') # sub query! ↓↓↓↓↓↓
sqldf('select * from Fruits where Sales = (select min(Sales) from Fruits)')
sqldf('select * from Fruits where Expenses = (select max(Expenses) from Fruits)')
#다중행 sub query! ↓↓↓↓↓↓
sqldf('select * from Fruits where Sales IN (select Sales from Fruits where expenses=78)')

song <-read.csv("song.csv", header = FALSE, fileEncoding = 'utf8') #POINT
song
names(song)<-c('_id','title','lyrics','girl_group_id')
song

girgrp<-read.csv("girl_group.csv", header=FALSE, fileEncoding = 'utf8')
girgrp
names(girgrp)<-c('_id','name','debut')
girgrp

sqldf("SELECT gg._id, gg.name, gg.debut, s.title
      FROM girgrp AS gg
      INNER JOIN song AS s
      ON gg._id = s.girl_group_id") 

sqldf("SELECT gg._id, gg.name, gg.debut, s.title
      FROM girgrp  gg
      INNER JOIN song  s
      ON gg._id = s.girl_group_id") #AS 없어도 됨

#outerjoin 은 안됨!       

#UPDATE하기:데이터 변경하기
Fruits
sqldf(c('UPDATE Fruits SET Profit=40 where Fruit=/'Apples/' AND year=2008', 'select * from Fruits'))
sqldf(c('delete Fruits SET Profit=40 where Fruit=/'Apples/' AND year=2008', 'select * from Fruits'))
