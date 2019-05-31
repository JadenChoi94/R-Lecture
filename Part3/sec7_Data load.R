#Load and Save Data
list.files()
scan1<-scan('scan_1.txt'); scan1
scan2<-scan('scan_2.txt'); scan2 #1.00 2.00 3.00 4.00
scan2<-scan('scan_2.txt', what=""); scan2
scan3 <-scan('scan_3.txt',what=""); scan3
scan4 <-scan('scan_4.txt',what=""); scan4 #char 로 나옴

input<-scan() #사용자 입력받기 숫자
input<-scan(what="") #String 형태로 단어만 입력받음 문장안됨

input3<-readline() #문장 입력받음
a quick brown fox
input3

input4<-readline("R u okay?:")
input5<-readLines('scan_4.txt')
input5

fruits <-read.table('fruits.txt')
fruits
fruits <-read.table('fruits.txt', header = T) #중요
fruits
fruit2<-read.table('fruits_2.txt'); fruit2
fruit2<-read.table('fruits_2.txt', skip=2); fruit2
fruit2<-read.table('fruits_2.txt', nrows=2); fruit2
f2top<-read.table('fruits_2.txt', nrow=2)
f2bottom<-read.table('fruits_2.txt',skip=3)
f2top; f2bottom

fruit3<-read.csv('fruits_3.csv')#header 가 관건
fruit3
fruit4<<-read.csv('fruits_4.csv') #헤더가 없는 경우
fruit4
fruit4<<-read.csv('fruits_4.csv', header=F) #헤더가 없다는걸 알려줘야함
fruit4
label<-c('No','NAME','PRICE','QTY')
fruit4<-read.csv(fruits_4.csv, header = F, col.names=label)
fruit4

install.packages("googleVis")
library(googleVis)
install.packages("sqldf")
library(sqldf)
Fruits
write.csv(Fruits, "Fruits_sql.csv", quote=F,row.names=F)
fruits_2<-read.csv.sql("Fruits_sql.csv", sql="SELECT*FROM file WHERE Year =2008")
fruits_2

install.packages("XLConnect")
library(XLConnect)

data1<-loadWorkbook("fruits_6.xls", create=T)
data2<-readWorksheet(data1, sheet="sheet1", startRow=1, endRow=8, startCol=1, endCol=5) #시작행 끝행 지정가능
data2

fruits6<-read.delim("clipboard", header=T)
fruits6

install.packages('readxl')
library(readxl)

fruits7 <- read_excel("fruits_6.xls", # path
sheet = "Sheet1", # sheet name to read 
range = "A2:D6", # cell range to read from
col_names = TRUE, # TRUE to use the first row as column names
col_types = "guess", # guess the types of columns
na = "NA") # Character vector of strings to use for missing values
fruits7

