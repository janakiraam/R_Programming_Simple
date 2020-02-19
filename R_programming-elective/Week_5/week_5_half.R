house <- read.csv("C:/Users/I340968/Desktop/ed-code/R programming-elective/Week_5/house.csv")
View(house)
hist(house$price)
hist(house$price,col="red",xlab="Price of the house",ylab = "No of house")


#function of series of colours.
#colfun(6) in line 10 give 10 different shade of the colfun clours

colfun<-colorRampPalette(c("blue","green","red"))
hist(house$price,col=colfun(6),xlab="Price of the house",ylab = "No of house")

#main syntax for changing the header of chart
hist(house$price,col=colfun(6),xlab="Price of the house",
     ylab = "No of house",main="Price Distrubution of House")


library(ggplot2)
ggplot(house,aes(x=rooms,y=price,col=rooms,group = 1))+geom_boxplot()
