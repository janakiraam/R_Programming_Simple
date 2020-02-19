# 1.Question answer
a<-rnorm(3,mean = 5, sd=1)
b<-rnorm(3,mean = 3, sd=3)
c<-rnorm(4,mean = 1, sd=4)
Random<-c(a,b,c)
Random

#2. creating a vector LogExp
var_log<-c(1,2,3,4,5)
var1_log<-c(log(var_log))
var_exp<-c(6,7,8,9,10)
var1_exp<-c(exp(var_exp))
LogExp<-c(var1_log,var1_exp)
LogExp

#3. Adding thousand and negative thousand
negative_thousand <- seq(-1000,0,1)
thousand <- seq(0,1000,1)
Final_Thousand <- c(negative_thousand + thousand)
Final_Thousand

#4.Extracting values
Final_Thousand[500]
First_Hundred<-c(Final_Thousand[1:100])
First_Hundred
Last_Hundred<-c((length(First_Hundred)-100):length(First_Hundred))
Last_Hundred
Werid_set<-c(Final_Thousand[321:764])
Werid_set

#5.Creating list Book_Details
Book_Details <-list(Book_Name=c("Che","Guvur","Ambani","Google","Karl","max","Sundar","Pichai","Bharathi","Arunachalam"),
                    Author_Name=c("federal","castro","dhirubhai","larry","nalla","kannu","Google","CEO","Poet","Mururganathan"),
                    Book_Cost=c(1000,2000,3000,4000,5000,6000,7000,8000,9000,9500))
Book_Details

#6.Extracing details from Book_details
Book_Details$Book_Name
Book_Details$Author_Name
Book_Details$Book_Cost
Book_Details[[1]][4]
Book_Details[[2]][2]
Book_Details[[3]][length(Book_Details$Book_Cost)]

#7.Loding inbuild data set

#View(women)
data(women)
women[6,2]#extracting 6th row 2nd column
#nrow(women)
#extracting last 4 rows
women[c(nrow(women)-3,nrow(women)-2,nrow(women)-1,nrow(women)),]
#extracting alternative rows in dataset
women[c(seq(1,nrow(women),2)),]

#8.Student dataset with ten rows and different data type

Student <- data.frame(Name=c("Ram","Arun","Raju","Aravind","Balu","Ragav","Bharathi","Philips","Ragu","Sundar"),
                      Department=c("CSE","ECE","MECH","EEE","EI","CSE","ECE","MECH","EEE","EI"),
                      CGPA=c(8.43,8.45,9.00,9.12,9.45,9.55,9.70,9.80,9.85,10.00),
                      Placement=c(T,T,T,T,T,T,T,T,T,T),
                      stringsAsFactors = FALSE)
#str(Student)

