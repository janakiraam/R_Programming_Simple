library(shiny)
ui = fluidPage("This is sparta")  #creation of user interface
server = function(input,output){} #creation of server
shinyApp(ui=ui,server=server)     #integration of UI with the server

#defining the input

scdin= sliderInput(inputId = "slider_1",label="Marks",value = 0,min = 0,max = 5)
shinyApp(ui=scdin,server=server)

#action button
acb = actionButton(inputId = "b1",label="press",width = 300,icon("play-circle"))
shinyApp(ui=acb,server=server)

#checkbox
chkbx = checkboxInput(inputId = "chk",label = "checkbox",value = TRUE,width = 500)
shinyApp(ui=chkbx,server=server)

#creating multiple checkbox

chkbxin = checkboxGroupInput(inputId = "chk1", label = "select fruits",choices = c("Apple","Orange","Grap","Bannana"),
                             selected = "Apple")

shinyApp(ui=chkbxin,server=server)

#giving option to user to select the dates

date_in = dateInput(inputId = "dl",label = "input_date", min="1950-01-01", max="2999-12-31")
shinyApp(ui=date_in,server=server)


#file input uploadin the file
fin = fileInput(inputId = "f1",label = "Fileinput",buttonLabel = "open",placeholder = "uploadfile")
shinyApp(ui=fin,server=server)

#slider Input

sli=sliderInput(inputId = "slid",label="marks",min=0,max=100,value=99)
shinyApp(ui=sli,server=server)

#radiobutton

rub=radioButtons(input="r1",label="favourite games",choices=c("Football","ciricket","volleyball","tennis"),selected="Football")
shinyApp(ui=rub,server=server)


#imageoutput

io = imageOutput(outputId = "li")
shinyApp(ui=io,server = server)

#usage of render gunction

ui=fluidPage(plotOutput(outputId = "p1"))

server <- function(input,output){
                   output$p1<-renderPlot(plot(1:100))
                    }

shinyApp(ui=ui,server = server)


#ploting historgram

ui=fluidPage(plotOutput(outputId = "p2"))

server <- function(input,output){
  output$p2<-renderPlot(hist(iris$Sepal.Length,col="blue"))
}

shinyApp(ui=ui,server = server)

#integrating box plot

library(ggplot2)

ggplot(iris,aes(y=Sepal.Length,x=Species,fill=Species))+geom_boxplot()

ui=fluidPage(plotOutput(outputId = "p3"))

server <- function(input,output){
  output$p3<-renderPlot(ggplot(iris,aes(y=Sepal.Length,x=Species,fill=Species))+geom_boxplot())
}

shinyApp(ui=ui,server = server)

#combining input and output
ui=fluidPage(sliderInput(inputId = "slid",label = "in",value = 99,min=0,max=100),
             plotOutput(outputId = "histi"))
server <- function(input,output){
  output$histi=renderPlot(hist(rnorm(input$slid),col="cadetblue"))
}
shinyApp(ui=ui,server = server)


#clicking in ui and increasing in number of click

ui=fluidPage(actionButton(inputId = "b1",label = "click"),textOutput(outputId = "results"))
server<-function(input,output){
  output$results<-renderText(as.numeric(input$b1))
}
shinyApp(ui=ui,server = server)


#creating application with help of economic data set

econ <- read.csv("C:/Users/i340968/Downloads/ed7/economics.csv")
View(econ)
ui=fluidPage(
  selectInput(
    inputId = "si1",
    label = "Choos coloumn",
    choices = c(
      "Personal savings Rate" = 2,
      "Personal Savings Expenditure" = 3,
      "Number of unemployment" = 4,
      "Mean duration of unemployment in thousand"=5
    )
  ),
  selectInput(inputId = "si2",label = "choose color",choices = c("cadetblue","palegreen4","darkmagenta")),
  sliderInput(inputId = "slide1",label="slider1",min=30,max=100,value = 30),
  plotOutput(outputId = "hist")
)

server<-function(input,output){
  output$hist=renderPlot({
    option=as.numeric(input$si1)+ggplot(econ,aes(x=econ[,option]))+
      geom_histogram(fill=input$si2,col="blue",bin=input$slide1)
  })
}

shinyApp(ui=ui,server=server)
