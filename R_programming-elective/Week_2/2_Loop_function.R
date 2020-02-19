#Relational operators

v1<-c(19,34,56,11)
v2<-c(23,34,32,11)
v1==v2
v1>v2
v1>=v2
v1<v2
v1<=v2

#logical operator
v1[2]>v2[1]&v1[4]==v2[4]
v1[2]>v2[1]|v1[4]==v2[4]
v1[2]>v2[1]&!(v1[4]!=v2[4])

#if then else condition - CONDITIONAL STATEMENTS

sub1 <- 76.8
sub2 <- 98
sub3 <- 60
pass_min <-250
total_mark <- sub1+sub2+sub3
if(total_mark > pass_min)
{
  "You have passed the exam"
}else
{
  additional_marks = pass_min - total_mark
  v1<-"you have not passed the exam"
  v2<-additional_marks
  print(v1)
  message("The additional mark required are:", v2)
  print(v2)
}

# Multiple level of if then else condition.
total_marks <- 100
if(total_marks > 80)
{
  "Excellent"
}else if (total_marks > 70)
{
  "Good"
}else if (total_marks > 60)
{
  "Average"
}else
{
  "Bad Performance"
}

#While loop

money_for_shopping <- 60
i<-1
while(money_for_shopping > 0)
{
  v1<-i
  v2<-"lets go for shop"
  v3<-"th time"
  v4<-paste(v2,v1,v3)
  print(v4)
  i=i+1
  money_for_shopping <- money_for_shopping -20
  money_left <- money_for_shopping
  v5<-"money left is:"
  v6<-paste(v5,money_left)
  print(v6)
}

#for loop

v7<-1:10
v7
for ( e in v7)
  {
  if(e==8)
    break
  if(e==4)
    next
  v8<-print(e)
  v8
}
print("loop completed")

# repeating loops 

i<-10
repeat
  {
  v1<-"my value is:"
  v2<-paste(v1,i)
  print(v2)
  i=i+1
   if(i==50)
     break
  }

#predefined functiom
View(mtcars)
?mtcars
nrow(mtcars)
ncol(mtcars)
str(mtcars)

#top records
head(mtcars)
head(mtcars,10)
head(mtcars,14)
tail(mtcars)
tail(mtcars,10)

sort(mtcars$mpg) #acending order
sort(mtcars$mpg,decreasing = T) #decending order

#frequeency distribution

table(mtcars$cyl)

#frequncy distribution in probability or percentage 
prop.table(table(mtcars$cyl))

prop.table(table(mtcars$cyl))*100

#basic mathematical function

mean(mtcars$mpg)
sum(mtcars$mpg)
min(mtcars$mpg)
max(mtcars$mpg)

#apply function
View(iris)
apply(iris[1:4],2,mean)
mean(iris$Sepal.Length)
mean(iris$Sepal.Width)

#apply function on row
apply(iris[1:4],2,mean) 
apply(iris[1:4],1,mean) 
#(three parameter are no.of redords,1 indicate operation on row or 2 operation on column,operation)

table(iris$Species)


#tapply function
tapply(iris$Sepal.Length,iris$Species,mean)
#getting mean value based on species

tapply(iris$Sepal.Length,iris$Species,min)


#map_dbl() function

View(mtcars)
library(purrr)
map_dbl(mtcars,mean)
map_dbl(mtcars,min)
map_dbl(mtcars,max)
map_dbl(mtcars,sd)


#invoke map function
invoke_map(list(mini_sepal_length="max",max_sepal_lenth="min"),
           list(iris$Sepal.Length,iris$Sepal.Length)) #max and min function will be taken

#userdefined / customized functions:

#step 1: buliding a function:
fun1 <- function()
{
  print(4)
}

#step2 : execution of the function
fun1()

#user defined input
fun2 <- function(x)
{
  print(x)
}
fun2("R programming")
fun2(100)
fun2(c(1:10))

fun2(list(c(T,F,F,T),c(1,2),c("a","bsa")))
fun2(list(list(c(12,13),c("R","Programming"))))

power2<-function(x){x^2}
power2(2)
power2(5)

addition <- function(x,y){x+y}
addition(10,20)
addition(5,power2(2)) #function inside a function

#loops and functions
col_mean_all_value <- function(x){
  for (i in x){
    print(mean(i))
  }
}

col_mean_all_value(iris[-5])


##local variable and global variable in R

fun7<-function()
{
  x<-20  #x and Y are local variable
  y<-40
  x+y
}
fun7()


x<-50 #x outside the function so global variable
fun8<-function()
{
  y<-40
  x+y
}
fun8()


#explicilty defining a varible in function and global variable comes back
#local variable get precidence compare to global variable
fun9<-function()
{
  x<-10
  y<-20
  x+y
}
fun9()
x


#another example of customized function

normailize<-function()
{
  v1<-(iris$Sepal.Length)-min(iris$Sepal.Length)
  v2<-(max(iris$Sepal.Length)-min(iris$Sepal.Length))
  v3<-v1/v2
  print(v3)
}
normailize()


#OR

normailize_1<-function(x){(x-range(x)[1])/(max(x)-min(x))}
normailize_1(iris$Sepal.Length)


#How? 

range(iris$Sepal.Length)
range(iris$Sepal.Length)[1]
min(iris$Sepal.Length)
