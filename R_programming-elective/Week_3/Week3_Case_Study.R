#1. Loading required pacakage

library(R6)

#2. Creating class template/object generator with name "Football_generator"
#three private data member
#three public data member.

Football_Generator<-R6Class("template",private=list(Player_Name='NA',Player_club='N',
                                                    Player_salary='NA'),
                            public=list(set_name=function(x){private$Player_Name=x},
                                        set_club=function(x){private$Player_club=x},
                                        set_salary=function(x){private$Player_salary=x}
                                        )
                            ) 

#3.creating two new object and assigning value to prive data member
#with public function

Footbaal_object1<-Football_Generator$new()
Footbaal_object2<-Football_Generator$new()
Footbaal_object1$set_name("Raam")
Footbaal_object1$set_club("CSE")
Footbaal_object1$set_salary("100000000")
Footbaal_object2$set_name("Janaki")
Footbaal_object2$set_club("CSE")
Footbaal_object2$set_salary("1000000000")
Footbaal_object1
Footbaal_object2


#Combining 4 and 5th question as both are dependent
#4. creating new class with three private data member
#5. Assigning value to private method using initialize


Movie_Generator <- R6Class("Movie",private = list(Movie_Name='NA',
                                                  protagonist_Name='NA',
                                                  Movie_Budget='NA'),
                           public = list(
                             initialize=function(x,y,z){
                               private$Movie_Name=x
                               private$protagonist_Name=y
                               private$Movie_Budget=z
                             }
                           ))


#assigning value using initialize method

Move_gen <- Movie_Generator$new("Raam",'YA','$500000')
Move_gen


#combining 6 and 7 as both are inter related
#6. vegwtable_generator and two private data member

Vegetable_Generator <- R6Class("vegetable",private = list(..Vegetable_Name='NA',
                                                          ..Vegetable_Cost='NA'),
                               active=list(
                                 Vegetable_Name=function(x){private$..Vegetable_Name=x},
                                 Vegetable_Cost=function(x){private$..Vegetable_Cost=x}
                               )) 
vg <- Vegetable_Generator$new()
vg
vg$Vegetable_Name="Carrot"
vg$Vegetable_Cost=55
vg
