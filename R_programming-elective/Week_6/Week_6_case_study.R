#1. loading required library
library(stringr)
library(tm)
library(ggplot2)
library(qdap)
library(SnowballC)
library(wordcloud)
tweets=read.csv("C:/Users/I340968/Desktop/ed-code/R programming-elective/Week_6/Tweets.csv",
                    stringsAsFactors = FALSE)
View(tweets)

#2.understanding the data structure.
str(tweets)

#3.setting up before text processing.
r1 = as.character(tweets$Tweet)
set.seed(100)
sample=sample(r1,(length(r1)))
sample
View(sample)

#4.data process
#4.1 create croups
tweets_vs <- VectorSource(r1)
tweets_co1=VCorpus(tweets_vs)

#4.2 remove punctuations
v1<-tm_map(tweets_co1,removePunctuation)
v1[[1]][1]

#4.3 lower case
v2<-tm_map(tweets_co1,tolower)

#4.3 removing numbers
v3<-tm_map(tweets_co1,removeNumbers)

#4.4 removing whitespace
v4<-tm_map(tweets_co1,stripWhitespace)

#4.5 remvoing stop words
v5<-tm_map(tweets_co1,removeWords,stopwords('english'))

#4.6 stemming

v6 <- c("additional","additive","addition")
stem_doc<-stemDocument(v6)
stem_doc

v7<-'addition'
v7

#to make the completion of the word
stem_text=stemCompletion(stem_doc,v7)
stem_text

#4.7 Document term matrix via croups

v10<-DocumentTermMatrix(tweets_co1)
v10

#4.8data fram from the output

v11<-as.matrix(v10)
dim(v11)
View(v11)

#5. creating worldcloud 
wordcloud(tweets$Tweet,min.freq = 5,random.order = TRUE, colors=brewer.pal(8, "Dark2"))
wordcloud(tweets$Tweet,min.freq = 5,random.order = FALSE, colors=brewer.pal(8, "Dark2"))

#Negative review
#1. Creating datafram.
str(tweets)
tweets$Avg = as.integer(tweets$Avg)
negativeTweets <- tweets[tweets$Avg < 0,]
View(negativeTweets)

#2. Running following code:
n1 = as.character(negativeTweets$Tweet)
set.seed(100)
sample2 = sample(n1, (length(n1)))

#1.1 create croups
tweets_ng <- VectorSource(negativeTweets)
tweets_co2=VCorpus(tweets_ng)

#1.2 remove punctuations
v1<-tm_map(tweets_co2,removePunctuation)
v1[[1]][1]

#1.3 lower case
v2<-tm_map(tweets_co2,tolower)

#1.4 removing numbers
v3<-tm_map(tweets_co2,removeNumbers)

#1.5 removing whitespace
v4<-tm_map(tweets_co2,stripWhitespace)

#1.6 remvoing stop words
v5<-tm_map(tweets_co2,removeWords,stopwords('english'))

#1.7 stemming

v11 <- c("additional","additive","addition")
stem_doc<-stemDocument(v11)
stem_doc

v12<-'addition'
v12

#1.8 to make the completion of the word
stem_text=stemCompletion(stem_doc,v12)
stem_text

#1.9 Document term matrix via croups

v13<-DocumentTermMatrix(tweets_co2)
v13

#4.8data fram from the output

v14<-as.matrix(v13)
dim(v13)
View(v13)

#creating worldcloud 
wordcloud(negativeTweets$Tweet,min.freq = 5,random.order = TRUE, colors=brewer.pal(8, "Dark2"))
wordcloud(negativeTweets$Tweet,min.freq = 5,random.order = FALSE, colors=brewer.pal(8, "Dark2"))

#possitive feedback

#5. Creating datafram.
str(tweets)
tweets$Avg = as.integer(tweets$Avg)
possitiveTweets <- tweets[tweets$Avg >= 0,]
View(possitiveTweets)

#6. Running following code:
p1 = as.character(possitiveTweets$Tweet)
set.seed(100)
sample2 = sample(p1, (length(p1)))

#7.1 create croups
tweets_pg <- VectorSource(possitiveTweets)
tweets_co3=VCorpus(tweets_pg)

#7.2 remove punctuations
v1<-tm_map(tweets_co3,removePunctuation)
v1[[1]][1]

#7.3 lower case
v2<-tm_map(tweets_co3,tolower)

#7.4 removing numbers
v3<-tm_map(tweets_co3,removeNumbers)

#7.5 removing whitespace
v4<-tm_map(tweets_co3,stripWhitespace)

#7.6 remvoing stop words
v5<-tm_map(tweets_co3,removeWords,stopwords('english'))

#1.7 stemming

v15 <- c("additional","additive","addition")
stem_doc<-stemDocument(v15)
stem_doc

v16<-'addition'
v16

#1.8 to make the completion of the word
stem_text=stemCompletion(stem_doc,v16)
stem_text

#1.9 Document term matrix via croups

v17<-DocumentTermMatrix(tweets_co3)
v17

#4.8data fram from the output

v18<-as.matrix(v17)
dim(v18)
View(v18)

#creating worldcloud 
wordcloud(possitiveTweets$Tweet,min.freq = 5,random.order = TRUE, colors=brewer.pal(8, "Dark2"))
wordcloud(possitiveTweets$Tweet,min.freq = 5,random.order = FALSE, colors=brewer.pal(8, "Dark2"))

