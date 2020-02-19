#1. Importing necessary library and data

library(dplyr)
library(data.table)
house <- read.csv("C:/Users/I340968/Desktop/ed-code/R programming-elective/Week_4/housingdata_v2.0.csv")
View(house)

#2. a) Number of observations  - 505
nrow(house)

#2. b) total number of variables - 11

ncol(house)

#3. c) number of continous variable 

lapply(house,class)


#3.select and mutate functions

#selecting gender, education and income
house_subset=select(house,Gender,Education,Income)
head(house_subset,5)

#selecting coloumn from gender to loan period
house_subset1 = select(house,Gender:Loan_Period)
head(house_subset1,5)


#selecting all coloumn except record and gender
house_subset2=house[, !names(house) %in% c("Record", "Gender")]
View(house_subset2)

#============another way==================
house_subset21=house[,3:ncol(house)]
View(house_subset21)

#use mutate() new varaiable creation

var1 = mutate(house,g1=PropertyValue/Income)
head(var1,5)

var2 = mutate(house,g2=PropertyValue/Loan_Period)
head(var2,5)

#4. Filter and Arrange
#4.1.property value based filtering 

g3<- filter(house,PropertyValue<80000 | PropertyValue > 150000)
nrow(g3) #to find number of rows
head(g3,5)

#4.2. Property value and income based filtering

g4<- filter(house,PropertyValue>1000000 & Income < 3185)
nrow(g4) #to find number of rows
head(g4,5)

#4.3.Income < 3185 still purchased property 

g5<- filter(house,Income < 3185 & Property_Purchased=='Y')
nrow(g5) #to find number of rows
head(g5,5)

#################arrange()###############

#4.4 bought df - observation when property_purchased

bought <- filter(house, Property_Purchased=='Y')
nrow(bought)

#4.5 arrange by income 
bought_income <- arrange(bought,Income)
View(bought_income)
head(bought_income,5)

#4.5 arrange bought by geneder
bought_gender <- arrange(bought,Gender)
View(bought_gender)
head(bought_gender,5)

#4.6 group by Gender and education
gpge <- bought%>% group_by(Gender,Education)
head(gpge,5)

#4.7 Property not purchased and observation.
not_bought <- filter(house, Property_Purchased=='N')
nrow(not_bought)

#4.8 not_bought arrange by income
not_bought_income <- arrange(not_bought,Income)
View(not_bought_income)
head(not_bought_income,5)

#4.9 not_bought arrangement by gender

not_bought_Gender <- arrange(not_bought,Gender)
View(not_bought_Gender)
head(not_bought_Gender,5)

#4.10 not_bought group by gender and education
ngpge <- not_bought%>% group_by(Gender,Education)
head(gpge,5)

#4.11 arrange house according to gender and desc income
housegi <- arrange(house,Gender,desc(Income))
View(housegi)
head(housegi,5)

#5.Summarise function:
#5.1 MIN and MAX income
summarise(house,min_income=min(Income),max_income=max(Income))

#5.2 MIN,MAX,Avg,SD,IQR
summarise(house,min_income=min(Income),max_income=max(Income),SD_inocme=sd(Income),
          avg_income=sum((Income)/nrow(house)),IQR_income=IQR(Income))


summarise(house,min_pv=min(PropertyValue),max_pv=max(PropertyValue),SD_pv=sd(PropertyValue),
          avg_pv=sum(PropertyValue)/nrow(house),IQR_pv=IQR(PropertyValue))


summarise(house,min_lp=min(Loan_Period),max_lp=max(Loan_Period),SD_lp=sd(Loan_Period),
          avg_lp=sum(Loan_Period)/nrow(house),IQR_lp=IQR(Loan_Period))

#6.Pipeing function
pip_1 = house %>% mutate(var1=PropertyValue/Income) %>% filter(var1>50)%>%summarise(var_mean=mean(var1))
pip_1

#7.pipeing groupby
grouping <- house %>% group_by(Education)%>% summarise(avg_income=sum(Income)/nrow(house),avg_value=sum(PropertyValue)/nrow(house))%>% arrange(avg_income,avg_value)
grouping
