library(dplyr)
library(hflights)
View(hflights)

#selecting using coloumn names
hflightssubset=select(hflights,Year,Month,FlightNum)
View(hflightssubset)

#selecting using coloumn numbers
hflightssubset_1=select(hflights,1,4,8)
View(hflightssubset_1)


#selecting variables with particular text string
hflightsstring=select(hflights,contains("Time"))
View(hflightsstring)

#selecting based on coloumn
hflightscol=select(hflights,1:5)
View(hflightscol)

#selecting based on coloumn name- Coloumn name case sensitive
hflightscol_nam=select(hflights,Year:FlightNum)
View(hflightscol_nam)

#slect a coloun with start with particular char string
hflight_start_end = select(hflights,starts_with("Day"),ends_with("Time"))
View(hflight_start_end)

#functions available in R
marks <- read.csv("C:/Users/I340968/Desktop/ed-code/R programming-elective/Week_4/Marks.csv")
View(marks)

#mutate function- used to create a new coloumn- coloumn names are case sensitive
marks_total = mutate(marks,totalmark = Maths+Physics+Chemistry)
View(marks_total)

marks_percent=mutate(marks_total,percenttotal=totalmark/3)
View(marks_percent)

Pass_status=mutate(marks_percent,Result=ifelse(percenttotal>45,"pass","Fail"))
View(Pass_status)

#flitering records in a table based on value
View(mtcars)
mtcarsm4cylinder=filter(mtcars,cyl>4)
View(mtcarsm4cylinder)

#number of cyclinders exactly equal to 4 and mpg >25
mtcarse4cylinder=filter(mtcars,cyl==4,mpg>25)
View(mtcarse4cylinder)

#multiple filter conditions
mtcarse_and=filter(mtcars,cyl==4&mpg>25)
View(mtcarse_and)

mtcarse_or=filter(mtcars,cyl==4 | mpg>25)
View(mtcarse_or) 

#arrange function - acending and decending order
#acending order

mpgac <- arrange(mtcars,mpg)
View(mpgac)

#descending order

mpgde <- arrange(mtcars,desc(mpg))
View(mpgde)

#summarise function.

house <- read.csv("C:/Users/I340968/Desktop/ed-code/R programming-elective/Week_4/house.csv")
View(house)

summarise(house,min_price=min(price))
summarise(house,max_price=max(price))
summarise(house,sum_price=sum(price))

#pipeing is used to do more functions in one line
View(hflights)
hflights %>% select(contains("Time")) %>% filter(AirTime>100)

#na.rm indicate that na values to be removed
hflightssubset_1=hflights %>% filter(UniqueCarrier=="WN") %>% summarise(max(AirTime,na.rm=T))
hflightssubset_1

hflightssubset_2=hflights %>% select(8,11,16) %>% 
  mutate(avg_speed=Distance/AirTime*60) %>% filter(avg_speed>500) %>% arrange(avg_speed)
View(hflightssubset_2)

#to find minimum average speed

hflightssubset_3=hflights %>% select(8,11,16) %>% 
  mutate(avg_speed=Distance/AirTime*60) %>% summarise(min.speed=min(avg_speed,na.rm=T))
View(hflightssubset_3)

hflightssubset_4=hflights %>% filter(UniqueCarrier=="WN") %>% 
  summarise(min_time=min(AirTime,na.rm=T))
View(hflightssubset_4)

hflightssubset_5=hflights %>% filter(UniqueCarrier=="WN") %>% 
  summarise(max_time=max(AirTime,na.rm=T))
View(hflightssubset_5)


#joining of tables

employee_designation = data.frame(Name=c("John","Sam","Raj","Amy","Anne"),
                                  Designation=c("CEO","CTO","SDE","COO","ANAlyst"),stringsAsFactors=FALSE)

employee_designation

employee_salary = data.frame(Name=c("John","Sam","Jason","Adam","Anne"),
                             Salary=c(100000,100010,100210,120121,192012),stringsAsFactors=FALSE)
employee_salary

#left join
join_left=left_join(employee_designation,employee_salary,by="Name")
join_left

#right join

join_right = right_join(employee_designation,employee_salary,by="Name")
join_right

#inner join
join_inner = inner_join(employee_designation,employee_salary,by="Name")
join_inner

#full join
join_full = full_join(employee_designation,employee_salary,by="Name")
join_full


#data table concepts
library(data.table)
View(iris)
class(iris)
as.data.table(iris) -> iris.dt

#selecting row number 2 to 6
iris.dt[2:6]
iris.dt[c(3,5,8)]
iris.dt[Species == "virginica"]
iris.dt[Sepal.Length > 5]

#Applying the above both condition in single condition
filter(iris.dt,Species =="virginica" & Sepal.Length>5)

#And condition
iris.dt[Species == "virginica" & Sepal.Length > 5]

#OR codition
iris.dt[Species == "virginica" | Sepal.Length > 5]

#selecting columns
iris.dt[,3:5]
iris.dt[,c(1,3,5)]
iris.dt[,Sepal.Width:Species]

#fliter out rows and columns as well
View(hflights)
flights_data_table=as.data.table(hflights)
flights_data_table[AirTime>100,c("DepTime","ArrTime","AirTime")]


#calculating mean by depens on spices in iris data table

iris.dt[,mean(Sepal.Width),by=Species]

#calculating mean by depens on spices in iris data table only selcting
#the row with Petal.Length > 4

iris.dt[Petal.Length>1.4,mean(Sepal.Width),by=Species]
