library(shiny)
#fluidpage - text that we like to print on the UI
ui_1=fluidPage("this is spartaa")
#defining a server script
server_1 = function(input,output){}
#integrating user interface with server
shinyApp(ui=ui_1,server = server_1)

#defining an input
#slider input
scdin=sliderInput(inputId = "Slider 1",label="marks",value=0,min=0,max=5)
shinyApp(ui=scdin,server = server_1)

#action button
acb = actionButton(inputId = "act1",label = "Press",width=100,icon=icon("play-circle"))
shinyApp(ui=acb,server=server_1)

#check box
chkbx=checkboxInput(inputId = "c1",value = TRUE,label = "YES",width = 500)
shinyApp(ui=chkbx,server=server_1)

#check goup box
chkbxi=checkboxGroupInput(inputId = "c2",label="SELECT FRUITS",
                          choices = c("APPLE","ORANGE","BANANNA","GRAPS"),
                          selected = "APPLE")
shinyApp(ui=chkbxi,server=server_1)

#date input
datei=dateInput(inputId='di',label = "Date_input",min="1950-01-01",max="9999-12-31")
shinyApp(ui=datei,server=server_1)

#user interface for uploading a file
filei = fileInput(inputId = "fi",label="select a file",
                  buttonLabel = "open",
                  placeholder="uploadfie")
shinyApp(ui=filei,server=server_1)

#slider input
scdin1=sliderInput(inputId='sl1',label='MARKS',min=0,max=100,value=99)
shinyApp(ui=scdin1,server=server_1)

#radio buttons

radi=radioButtons(inputId = "rdb1",choices = c("cricket","tennis","football","volleyball"),
                  label = "select",selected = "cricket")
shinyApp(ui=radi,server = server_1)

#image output
img=imageOutput(outputId="IM")
shinyApp(ui=img,server = server_1)

#render function
ui1=fluidPage(plotOutput(outputId = "p1"))

server_2 <- function(input,output){
  output$p1<-renderPlot(plot(1:100))
}

shinyApp(ui=ui1,server = server_2)

#histrogram rendering
ui2=fluidPage(plotOutput(outputId = "p2"))
server_3<-function(input,output){
  output$p2<-renderPlot(hist(iris$Sepal.Length,col="palegreen4"))
}

shinyApp(ui=ui2,server=server_3)

hist(iris$Sepal.Length,col="palegreen4")

#boxplot
library(ggplot2)
ggplot(iris,aes(y=Sepal.Length,x=Species,fill=Species))+geom_boxplot()

ui3=fluidPage(plotOutput(outputId = "p3"))
server_4<-function(input,output){
  output$p3<-renderPlot(ggplot(iris,aes(y=Sepal.Length,x=Species,fill=Species))+geom_boxplot())
}

shinyApp(ui=ui3,server=server_4)

#combine input and output

ui4=fluidPage(sliderInput(inputId = "slider",min=0,max=100,label = "selectvalue",
                          value=50),plotOutput(outputId = 'hist'))
server_5<-function(input,output){
  output$hist<-renderPlot(hist(rnorm(input$slider),col="cadetblue"))
}
shinyApp(ui=ui4,server=server_5)

#in above rnorm number genenrate random number based on the random number
#histrogram is been generated


#application for finding number of clicks 
ui5=fluidPage(actionButton(input="b1",label="click"),textOutput(outputId = "result"))
server_6<-function(input,output){
  output$result<-renderText(as.numeric(input$b1))
}

shinyApp(ui=ui5,server=server_6)


#end to end application using economics.csv
econ <-read.csv("C:/Users/I340968/Desktop/ed-code/R programming-elective/Week_7/economics.csv")
ui=fluidPage(selectInput(inputId = 'si1',label = "choose cloumn",
                         choice=c(
                           "personal savings rate"=2,
                           "personal savings expenditure"=3,
                           "Number of unemployee"=4,
                           "mean duration of unemployeement in thousands"=5
                         )
                         ),
             selectInput(inputId = 'si2',label="choose colour",
                         choice=c("cadetblue","palegree4","darkmagenta")),
             sliderInput(inputId='slider1',label="select Bin Value",
                         min=30,max=100,value=30,animate=TRUE),
             plotOutput(outputId = "hist"))

server <- function(input,output){
  output$hist=renderPlot({option=as.numeric(input$si1)
                          ggplot(econ,aes(x=econ[,option]))+geom_histogram(fill=input$si2,col="blue",
                                                                           bins=input$slider1)
                          }
                         )
}

shinyApp(ui=ui,server=server)
