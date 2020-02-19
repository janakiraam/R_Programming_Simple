#1. loading required library and data
library(dplyr)
library(ggplot2)
house_1=read.csv("C:/Users/I340968/Desktop/ed-code/R programming-elective/Week_5/housingdata_v2.0.csv")
View(house_1)

#2. Understanding data structure
nrow(house_1)
summary(house_1)
names(house_1)
str(house_1)

#3. Scatter plot creadite record on x-axis and income on y-axis
ggplot(house_1,aes(y=Income,x=Credit_Record))+geom_point(col="coral")
house_1$Credit_Record=as.factor(house_1$Credit_Record)
ggplot(house_1,aes(y=Income,x=Credit_Record))+geom_point(col="coral")
#the difference is before converting as factor the x-value has been taken
#in a range between 0 to 1 but after convertion x-axis value are 0 and 1

#4.scatter plot between in-come on x-axis and property on y-axis
ggplot(house_1,aes(x=Income,y=PropertyValue))+geom_point()
#4.1 Col argument depending on no_kids
ggplot(house_1,aes(x=Income,y=PropertyValue,col=No_kids))+geom_point()

#4.2 adding size argument depends on no_kids
ggplot(house_1,aes(x=Income,y=PropertyValue,col=No_kids),size=No_kids)+geom_point()

#4.3 smooth line adding
ggplot(house_1,aes(x=Income,y=PropertyValue,col=No_kids),size=No_kids)+geom_point()+geom_smooth()


#5.ggplot comparson with base plot
#5.1 scatter plot- color according to no_kids

plot(house_1$PropertyValue~house_1$Income,col=house_1$No_kids)

#5.2 changing no of kids to factor
house_1$No_kids=as.factor(house_1$No_kids)

#5.3  making the plot same as 5.1
plot(house_1$PropertyValue~house_1$Income,col=house_1$No_kids)

#5.4 Recreating same plot using ggplot.

ggplot(house_1,aes(x=Income,y=PropertyValue,col=No_kids))+geom_point()

#6. Asethethics

#6.1 Map incomet to x and property value to y
ggplot(house_1,aes(y=PropertyValue,x=Income))+geom_point()

#6.2 Revese for the first
ggplot(house_1,aes(x=PropertyValue,y=Income))+geom_point()

#6.3Map Income to x and Property Value to y and No of kids to col
ggplot(house_1,aes(y=PropertyValue,x=Income,col=No_kids))+geom_point()

#6.4 Change on shape and size of above plot
ggplot(house_1,aes(y=PropertyValue,x=Income,col=No_kids))+geom_point(shape=14,size=3)


#7.Geometry
#7.1 scatter-plot x- Income and Y - PropertyValue
ggplot(house_1,aes(y=PropertyValue,x=Income))+geom_point()

#7.2 geom_jitter()
ggplot(house_1,aes(y=PropertyValue,x=Income))+geom_jitter()
#ggplot(house_1,aes(y=PropertyValue,x=Income))+geom_jitter(aes(colour = No_kids))

#7.3 Width as 0.1 in geom_jitter
ggplot(house_1,aes(y=PropertyValue,x=Income))+geom_jitter(width = 0.1)

#8.Histrogram:
#8.1 Univariant histrogram on income
hist(house_1$Income)

#8.2 binwidth to 100
ggplot(house_1,aes(x=Income))+geom_histogram(binwidth = 100)

#8.3 density to y
ggplot(house_1,aes(x=Income))+geom_histogram(aes(y=..density..))

#8.4 set fill attribute
ggplot(house_1,aes(x=Income))+geom_histogram(aes(y=..density..),fill="#377EB8")

#9.Bar plot

#9.1 bar plot for property_purchase
ggplot(house_1,aes(x=Property_Purchased))+geom_bar()

#9.2 position -stack
ggplot(house_1,aes(x=Property_Purchased))+geom_bar(position = position_stack())

#9.3 position -fill
ggplot(house_1,aes(x=Property_Purchased))+geom_bar(position = position_fill())

#9.4 position -dodge
ggplot(house_1,aes(x=Property_Purchased))+geom_bar(position = position_dodge())


#10 Overlapping bar
#10.2 posn_d definintion in above plot
posn_d <- position_dodge(width = 0.7)
ggplot(house_1,aes(x=Property_Purchased))+geom_bar(position = posn_d)

#11.overlapping histrograms
#11.1 color defined by income
ggplot(house_1,aes(x=Income,fill=HasCar))+geom_histogram(binwidth = 50)

#11.2 position is identity
ggplot(house_1,aes(x=Income,fill=HasCar))+geom_histogram(position = position_identity())

#12.Faceting
#12.1 scatter plot between income and property value 
ggplot(house_1,aes(y=Income,x=PropertyValue))+geom_point()

#12.2 Separate row according to HasCar
ggplot(house_1,aes(y=Income,x=PropertyValue))+geom_point()+
  facet_grid(.~HasCar)

#12.3 In 12.2 separte by no_kids
ggplot(house_1,aes(y=Income,x=PropertyValue))+geom_point()+
  facet_grid(.~No_kids)

#12.4 In 12.2 separte by no_kids and hascar
ggplot(house_1,aes(y=Income,x=PropertyValue))+geom_point()+
  facet_grid(.~HasCar)+facet_wrap(.~No_kids)

