# 1. odd number to ODD and even number to EVEN

c<-1:100
for(e in c){
 
  if(e%%2==0)
    print("EVEN")
  else
    print("ODD")
}

#2.iris data set with sepal.length greater than 6.5

#View(iris)
G<-c(iris$Sepal.Length)
i<-0
for ( e in G){
  if(e>6.5)
    i=i+1
}
print(i)

#another way
#nrow(iris[iris$Sepal.Length>6.5,])

#3.co2 data set mean 'uptake'Type mississippi and treatment 'chilled'

#View(CO2)
v1<- (CO2$Type=="Mississippi" & CO2$Treatment=="chilled")
v2<- CO2[v1,]
result<- mean(v2$uptake)
result

#CO2[CO2$Type=="Mississippi" & CO2$Treatment=="chilled",]


#4. Getting mean, meadian,min and max value of uptake with respect to treatment

tapply(CO2$uptake,CO2$Treatment,min)
tapply(CO2$uptake,CO2$Treatment,max)
tapply(CO2$uptake,CO2$Treatment,median)
tapply(CO2$uptake,CO2$Treatment,mean)


#5. swiss using invoke_map find minimum 'fertility' and max 'Infant.morality'
#View(swiss)
invoke_map(list(min_fertility="min",max_infant_moratility="max"),
           list(swiss$Fertility,swiss$Infant.Mortality))

#6. Customize function dice which will give random number between 1-6
dice <- function(){runif(1, min=1, max=6) }
dice()
# for generating integer value between 1-6
dice <- function(){sample(1:6,1,replace=T)}
dice()



