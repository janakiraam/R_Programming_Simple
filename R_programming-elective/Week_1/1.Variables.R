# creating list and assigning names.

climate <- list(c(72,34,21,23,42),c('Y','N','Y','Y','Y','N'))
class(climate)
names(climate)<-c("Temperature","Rain")
climate
temperature <- c(72,78,90,34,56,23)
preciptation<- c(100,110,111,123,121,143)
climate_matrix<-matrix(c(temperature,preciptation),nrow=2,ncol=6)
climate_matrix
climate_matrix1<-matrix(c(temperature,preciptation),nrow=2,ncol=6,byrow=T)
climate_matrix1

#giving row name and column name for matrix
rownames<-c("temperature","preciptation")
colnames<-c("mon","tue","wed","thr","fri","sat")
climate_matrix2<-matrix(c(temperature,preciptation),nrow=2,ncol=6,
                        byrow=T,dimnames = list(rownames,colnames))
climate_matrix2

#another way of creating matrix
M1<-matrix(c(12,23,45,21,34,33),nrow=2)
M1
m2<-matrix(c(134,21,23,12,12,54),nrow=2)
m2
result<-M1*m2
result

#creating dataframe in R
cd <- data.frame(day_of_week=c(1,2,3,4,5),
                day=c("Sunday","monday","tuesday","wenesday","Thrusday"),
                temp=c(12,14,12,24,12),
                preci=c(40,44,56,23,65),
                rain=c("Y","N","Y","Y","Y"),
                date=as.Date(c("2017-12-31","2018-01-01","2018-01-02","2018-01-03","2018-01-04")))
str(cd)

cd_1 <- data.frame(day_of_week=c(1,2,3,4,5),
                 day=c("Sunday","monday","tuesday","wenesday","Thrusday"),
                 temp=c(12,14,12,24,12),
                 preci=c(40,44,56,23,65),
                 rain=c("Y","N","Y","Y","Y"),
                 date=as.Date(c("2017-12-31","2018-01-01","2018-01-02","2018-01-03","2018-01-04")),
                 stringsAsFactors = FALSE)
str(cd_1)

#indexing data frames
result<-cd_1[1:4,]
result
result_1<-cd_1[,2:3]
result_1
result_2<-cd_1[1:4,2:3]
result_2

#concarding data frames:

cd_3 <- data.frame(day_of_week=c(6,7),
                   day=c("Friday","Saturday"),
                   temp=c(12,14),
                   preci=c(40,44),
                   rain=c("Y","Y"),
                   date=as.Date(c("2018-01-05","2018-01-06")),
                   stringsAsFactors = FALSE)
cd_1
cd_3
cd_final<-rbind(cd_1,cd_3)
cd_final

#subsetting data
two <- seq(2,20,2)
two
two[1]
two[c(2,5,9)]
two[-1]
two[-1:-3]

#subsetting list
car<-list(name=c("BMW","Jaguar","Audi"),cost=c(10000,20000,40000),
          color=c("red","blue","blacl"))
car

class(car)

car$name

class(car$name)
class(car$cost)
car[1]
car[[1]]
car[[2]]
car[[1]][1]

#view syntax

View(mtcars)
class(mtcars)
mtcarssub = mtcars[1:5,]
mtcarssub = mtcars[1:5,1:7]
mtcars$mpg
mpgonly=mtcars$mpg
mpgonly

View(iris)

#concept of packages
#step 1: install the package
library(MASS)
library(help=MASS)

View(Boston)
