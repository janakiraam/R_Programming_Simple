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
  sliderInput(inputId = "slide1",label="slider1",min=30,max=100,value = 30,animate = TRUE),
  plotOutput(outputId = "hist")
)

server<-function(input,output){
  output$hist=renderPlot({option=as.numeric(input$si1)
  ggplot(econ,aes(x=econ[,option]))+geom_histogram(fill=input$si2,col="blue",
                                                   bins = input$slide1)})
}

shinyApp(ui=ui,server=server)

