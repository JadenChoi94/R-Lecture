install.packages("googleVis")

data(Andrew)
Andrew
storm1<-gvisMap(Andrew, 'LatLong','Tip',
                options=list(showTip=TRUE, showLine=TRUE, enableScrollWheel=TRUE,
                             mapType='hybrid', UseMapTypeControl=TRUE,
                             width=800, height=400))
plot(storm1)
#===========================================================================================
setwd('D:/Workspace/실습용_데이터')
loc <- read.csv("서울시구청위치정보_new.csv",header=T)
loc
hoffice <- gvisMap(loc, "LATLON" , "name",
            options=list(showTip=TRUE, showLine=TRUE, enableScrollWheel=TRUE,
            mapType='normal', useMapTypeControl=TRUE,
            width=1000,height=400))
plot(hoffice)
#===========================================================================================
CityPopularity
ex1 <-gvisGauge(CityPopularity, options=list(min=0, max=800, 
                        greenFrom=500, greenTo=800, 
                        yellowFrom=300, yellowTo=500,
                        redFrom=0, redTo=300, width=400, height=300))
plot(ex1)
#===========================================================================================
fruits=data.frame(month=c("JAN","FEB","MAR"),
                  apple=c(30,10,20),
                  orange=c(20,40,30))
line <- gvisLineChart(fruits)
plot(line)

line2 <- gvisLineChart(fruits,"month",c("apple","orange"),
         option=list(series="[{targetAxisIndex:0}, {targetAxisIndex:1}]",
            vAxes="[{title:'apple'},{title:'orange'}]" ))
plot(line2)

line3 <- gvisLineChart(fruits,xvar="month",yvar=c("apple","orange"),
                    options=list(series="[{color:'blue',targetAxisIndex:0,
                    linewidth:1,lineDashStyle:[1,10,1,10,1,10]},
                    {color:'red',targetAxisIndex:1,
                    linewidth:2,lineDashStyle:[4,1]}]",
                     vAxes="[{title:'apple'},{title:'orange'}]" ))
plot(line3)
#===========================================================================================
gbar <- gvisBarChart(fruits)
plot(gbar)
