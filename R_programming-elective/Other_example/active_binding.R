#active binding other example


library(R6)
ClassyClass <- R6Class("ClassyClass", 
                       active = list(
                         classy_word = function(value){
                           if (missing(value)) 
                             sample(c("Classy","Modish", "High-Class","Dashing","Posh"), 1)
                           else 
                             cat(paste("Your classy word is", value))
                         }
                       ))

classy_object <- ClassyClass$new()
classy_object$classy_word

#another example of active_binding
#==================================

Vegetable_Generator <- R6Class("vegetable",private = list(..Vegetable_Name='NA',
                                                          ..Vegetable_Cost='NA'),
                               active=list(
                                 Vegetable_Name=function(x)
                                   {
                                   if(missing(x))
                                     sample(c("carrot","bens","gems"),1)
                                   else
                                   private$..Vegetable_Name=x
                                   },
                                 Vegetable_Cost=function(x)
                                   {
                                   if(missing(x))
                                     sample(c(50,60,70),1)
                                   else
                                   private$..Vegetable_Cost=x
                                   }
                               )) 

vg<- Vegetable_Generator$new()
vg$Vegetable_Name

#===============================
#> vg<- Vegetable_Generator$new()
#> vg$Vegetable_Name
#[1] "bens"
#==============================


#=====================================================================
#usage of cat
#=============
#> paste("The value is",j)
#[1] "The value is 20"
#> cat(paste("The value is",j))
#The value is 20
#=====================================================================
