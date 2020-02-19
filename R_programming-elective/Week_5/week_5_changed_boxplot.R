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


#defining the buckets into to certain number of categories 
hist(house$price,breaks=4)

#scatter plot functionality
plot(house$price~house$living_area) #plot(y~x)
plot(house$price~house$living_area,col="red")

#with changing labes in x-axis and y-axis
plot(house$price~house$living_area,col="red",xlab="Living area",ylab = "Price")

#changing shape of plotting blubble with pch function.
#pch range from 0 to 25. Each value associated with certain shape

plot(house$price~house$living_area,col="red",xlab="Living area",ylab = "Price",pch=0)

#ploting based on price and land value
plot(house$land_value~house$price,col="red",xlab="Price",ylab = "Land Value",pch=0)

colfun<-colorRampPalette(c("purple","green","red"))
plot(house$price~house$living_area,col=colfun(5),pch=4)

#box plot
boxplot(house$price) #easly able to find the outlier values

#classifying the box plot with in two differet way
boxplot(house$price~house$waterfront)
boxplot(house$price~house$rooms)

#adding colour to box plot
boxplot(house$price~house$waterfront,col=c("palegreen4","cadetblue"))

View(iris)
plot(iris$Sepal.Length~iris$Petal.Length)
#to color based on species
plot(iris$Sepal.Length~iris$Petal.Length,col=iris$Species)


#piechart
unique(house$air_cond) #to find what all the unique value available
#table to find the frequency
table(house$air_cond)

pie(table(house$air_cond),col=c("Red","green"))

library(ggplot2)
ggplot(iris,aes(x=Petal.Length,y=Sepal.Length,col=Species))+geom_point()

#different shape for different species
ggplot(iris,aes(x=Petal.Length,y=Sepal.Length,shape=Species))+geom_point()

#histrogram using ggplot
ggplot(house,aes(x=price))+geom_histogram()

#col is boundary color
ggplot(house,aes(x=price))+geom_histogram(fill="palegreen4",col="red")


ggplot(house,aes(x=price,fill=air_cond))+geom_histogram(col="darkmagenta") 
#(the above result shows house with airconditioner and without airconditioner but do subtraction)

#for non-stack histrogram use position withouut col
ggplot(house,aes(x=price,fill=air_cond))+geom_histogram(position="identity") 

#for getting histrogram as percentage you can use fill in position
ggplot(house,aes(x=price,fill=air_cond))+geom_histogram(position="fill") 


fi <- filter(house,price>600000)
View(fi)

#bar plot functionality
ggplot(house,aes(x=waterfront))+geom_bar(fill="cadetblue")

#scatter plot between two variables
ggplot(house,aes(y=price,x=living_area))+geom_point(col="coral")

#further refining the points bases of room variable
ggplot(house,aes(y=price,x=living_area,col=rooms))+geom_point()

#density plot
ggplot(house,aes(x=price))+geom_density()
ggplot(house,aes(x=price))+geom_density(fill="red")

ggplot(house,aes(x=price,fill=waterfront))+geom_density()
ggplot(house,aes(x=price,fill=air_cond))+geom_density()

#transparancy level with help of alpha( alpha value ranges from 0 to 1)
ggplot(house,aes(x=price,fill=air_cond))+geom_density(alpha=.5)

#smooth curve
ggplot(house,aes(x=price,y=living_area))+geom_smooth()

#split by water front variable
ggplot(house,aes(x=price,y=living_area,col=waterfront))+geom_smooth()

#In above graph there will be shared area which is confidence intervel
#removing confidence intervel
ggplot(house,aes(x=price,y=living_area,col=waterfront))+geom_smooth(se=F)

#visulaize smoothen curve and point as well
ggplot(house,aes(x=price,y=living_area))+geom_smooth()+geom_point()

#spliting by heat
ggplot(house,aes(x=price,y=living_area,col=heat))+geom_smooth(se=F)+geom_point()

#boxplot
house$rooms = as.integer(house$rooms)#session
str(house)#checking for changes
ggplot(house,aes(x=rooms,y=price))+geom_boxplot()

ggplot(house, aes(rooms, price)) +
  geom_boxplot(aes(group = cut_width(rooms, 1)))

ggplot(house,aes(y=price,x=rooms))+geom_boxplot()
ggplot(house,aes(y=price,x=rooms,col=rooms))+geom_boxplot()
ggplot(house,aes(y=price,x=rooms,fill=rooms))+geom_boxplot()

ggplot(house, aes(y=price, x=rooms , group=1))+geom_boxplot()
ggplot(house,aes(x=rooms,y=price,col=rooms,group=1))+geom_boxplot();
#voilin plot
ggplot(house,aes(x=waterfront,y=price))+geom_violin()
ggplot(house,aes(x=waterfront,y=price,fill=air_cond))+geom_violin()

#faceting
ggplot(house,aes(y=price,x=living_area,col=fuel))+geom_point()+
  facet_grid(.~fuel)

#faceting histrogram
ggplot(house,aes(x=price,fill=heat))+geom_histogram()+facet_grid(.~heat)

#box plot
ggplot(house,aes(y=price,x=fuel,fill=air_cond))+geom_boxplot()+facet_grid(.~air_cond)
ggplot(house,aes(y=price,x=fuel,fill=air_cond))+geom_boxplot()+facet_grid(.~fuel)

#changing theme layer
ggplot(house,aes(y=price,x=living_area,col=heat))+geom_point()+
  geom_smooth()+theme(panel.background = element_rect("coral"))

#assigning colour to the plot
ggplot(house,aes(y=price,x=living_area,col=heat))+geom_point()+
  geom_smooth()+theme(panel.background = element_rect("coral"),plot.background = element_rect("red"))

#word cloud
library(wordcloud2)
View(demoFreq)
wordcloud2(demoFreq)
wordcloud2(demoFreq,shape = "star",size=.7)
