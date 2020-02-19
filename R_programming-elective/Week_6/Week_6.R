v1 = "Edureka session about R"
v2 = 'Edureka session\'s about R'
v1
v2
class(v1)
class(v2)

#number to charac
x=7.89765
x
x=as.character(x)
x

#changing the formate

x=7.8989809809
x
format(x,digits=1,scientific=TRUE)
format(x,digits=2,scientific = TRUE) #if digits is 2 the resukt will show 2 digits spaces

#formatc function
formatC(x,format="f",digits=1) #not show in scentific but show in fixed way
formatC(x,format="e",digits=1) #to see the result in exponetial formate
formatC(x,format="g",digits=1) #it will give result in scentific denotion incase it saves the space

#paste function

distance_covered <- c(70,84,88,100)
day_of_week <- c("Mon","Tue","Wed","Thru")
Expense_raised <- c(100,200,300,400)

distance_covered1<-paste(distance_covered,"KM",sep="")#the default separator is sapces
distance_covered1
day_of_week1<-paste(day_of_week,":",sep="")
day_of_week1
Expense_raised1<-paste(Expense_raised,"$",sep="")
Expense_raised1

#vector consolidation using paste function

final_vector <- paste(day_of_week1,distance_covered1,Expense_raised1,sep="-")
final_vector

final_vector1 <- paste(day_of_week1,distance_covered1,Expense_raised1,sep="-",collapse = ":")
final_vector1

#str_c function
library(stringr)
v1<-c(NA,"India",NA,"USA")
v2<-c("Manhattan","Delhi","Arizona","Newyork")

#the difference between str_c and paste is str_c doesnot use space while
#printing the output
paste(v1,v2)
str_c(v1,v2)
str_c(v1,"-",v2)

#extracting texgt string
str_sub(v2,1,3)
str_sub(v1,1,3)

#extracting text from string from last position
str_sub(v2,-3,-1)

#pattern in a string- give result in logical value

sting_v=c("Manhattan","Delhi","Arizona","Newyork")
str_detect(sting_v,pattern = fixed("na"))

#count the number of times the pattern has occured
str_count(sting_v,pattern = fixed("na"))

#string split
string_v = c("Guitar;voilin","samba;salsa;Ballet;Tango;kabuki")
string_v
str_split(string_v,pattern = ";")

#to remove the multi-level hierarchy in str_split
str_split(string_v,pattern = ";",simplify = TRUE)

#string replace function - replace in first occurance of the pattern
str_replace(string_v,pattern = ";",replacement = "&")

#replacing all the occurance of pattern
str_replace_all(string_v,pattern = ";",replacement = "&")

library(tm)
tweets_v=read.csv("C:/Users/I340968/Desktop/ed-code/R programming-elective/Week_6/Tweets4.csv",
                  stringsAsFactors = FALSE)
View(tweets_v)

tweets_v2=tweets_v$Tweets
View(tweets_v2)

#vector source to make source as vector
tweets_for_mining <- VectorSource(tweets_v2)
tweets_for_mining
tweets_for_mining[1]

#VCorpus in tm refers to "Volatile" corpus which means that 
#the corpus is stored in memory and would be destroyed when the R object containing it is destroyed.
#"Corpus" is a collection of text documents.

tweets_co = VCorpus(tweets_for_mining)
print(tweets_co)

#to change into lower
v<-tm_map(tweets_co, tolower)
v[[1]][1]
v1<-tm_map(tweets_co, removePunctuation)
v1[[1]][1]

library(qdap)
library(SnowballC)
v7 <- c("additional","additive","addition")
stem_doc<-stemDocument(v7)
stem_doc

v8<-'addition'
v8

#to make the completion of the word
stem_text=stemCompletion(stem_doc,v8)
stem_text

tweets_co[[1]]$content

#usage of document term matrix
#sparse ->words which appears very few number of times -here 503
#non- sparse -> Word which are replicated
v9<-DocumentTermMatrix(tweets_co)
v9

v10 <- as.matrix(v9)
dim(v10) #dimention of v10
View(v10)

#Reviewing a portion of matrix, 
v10[13:4,9:5]

#usage of term document matrix - transport of documenttrerm matrix
v11<-TermDocumentMatrix(tweets_co)
v11
dim(v11)

v12<-as.matrix(v11)
v12[4:13,5:9]
