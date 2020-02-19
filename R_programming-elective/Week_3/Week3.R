library(R6)

# using R6class object_generator <- R6class(<"class_name">,)

Fruit <- R6Class("Fruit",private=list(name=c("apple","orange","waterme"),cost=c(100,200,300)))
class(Fruit)
apple1<-Fruit$new()
apple1

#object generator assigning function as R object

Employee_Generator <- R6Class("Employee",private = list(name=NA,designation=NA),
                              public = list(set_name=function(x){private$name=x},
                                            set_designation=function(x){private$designation=x}
                                            )
                              )

class(Employee_Generator)
employee1<-Employee_Generator$new()
employee1
employee1$set_name("Raam")
employee1$set_designation("CEO")
employee1


#initialize function

Food <- R6Class("Food", private = list(name=NA,cost=NA),
                public=list(
                  initialize=function(x,y)
                  {
                    private$name=x
                    private$cost=y
                  }
                           )
                )

pizza<-Food$new("Pizza",100)
pizza

salad <-Food$new("Salad",50)
salad


#initialize multiple value

mard_generator<- R6Class("Marks", private = list(name=NA,marks=NA),
                         public=list(
                                    initialize=function(x,y)
                                                           {
                             private$name=x
                             private$marks=y
                           } 
                           )
                       )




marks_1 <- mard_generator$new(c("john","sam","lucky","amy"),c(100,100,100,100))
marks_1

#intializing multiple value for more than two variables
mark_moretwo<-R6Class("Marks1",private = list(name=NA,mark=NA,department=NA),
                      public = list(
                        initialize=function(x,y,z)
                        {
                          private$name=x
                          private$mark=y
                          private$department=z
                        }
                                    )
                      )

marks_2<-mark_moretwo$new(c("ragav","raju","ranjeet","ragu"),c(100,100,100),c('cse','cse','cse'))
marks_2


# Active binding

Furit_generator <- R6Class("Fruit", private=list(..name=NA,..cost=NA),
                           active=list(
                             name=function(x){private$..name=x},
                             cost=function(x){private$..cost=x}
                           )
                           )
furit<-Furit_generator$new()
furit
furit$name=c("gova","orange","apple")
furit$cost=55
furit

#inheritance 
#============

#parent class
velhical_genrator<-R6Class("vehical",private=list(hp=NA,mpg=NA),
                  public=list(
                    set_hp=function(x){private$hp=x},
                    set_mpg=function(x){private$mpg=x}
                              )
                  )


v1<-velhical_genrator$new()
v1$set_hp(110)
v1$set_mpg(220)
v1


#chiled class
car_generator <- R6Class("car",
                         inherit = velhical_genrator,
                         private = list(typer=NA,colour=NA),
                         public = list(
                           set_typer=function(x){private$typer=x},
                           set_colour=function(x){private$colour=x}
                         ))


velhical_genrator
car_generator
c1<-car_generator$new()
c1
c1$set_hp(110)
c1$set_mpg(20)
c1$set_typer("cyet")
c1$set_colour("Red")
c1
class(c1)
class(velhical_genrator)


#multilevel inheritance

#grandpraent
velhical_genrator1<-R6Class("vehical",private=list(hp=NA,mpg=NA),
                           public=list(
                             set_hp=function(x){private$hp=x},
                             set_mpg=function(x){private$mpg=x}
                           )
)

#parent 
car_generator1 <- R6Class("car",
                         inherit = velhical_genrator1,
                         private = list(typer=NA,colour=NA),
                         public = list(
                           set_typer=function(x){private$typer=x},
                           set_colour=function(x){private$colour=x}
                         ))


#child
ferrari_generator <- R6Class("ferrari",
                             inherit= car_generator1,
                             private=list(cost=NA),
                             public = list(
                               set_cost=function(x){private$cost=x}
                             )
                             )

fe<-ferrari_generator$new()
fe$set_hp(110)
fe$set_mpg(20)
fe$set_colour("Red")
fe$set_cost("15555")
fe$set_typer("ceyt")
fe
