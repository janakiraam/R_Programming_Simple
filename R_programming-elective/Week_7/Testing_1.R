library(shiny)
bcl<-read.csv("C:\\Users\\i340968\\Desktop\\ed-code\\R programming-elective\\Week_7\\Shiny_app2\\data.csv",
              stringsAsFactors = FALSE)
#print(str(bcl))
ui=fluidPage(
  titlePanel("BC Liquorstoreprice"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "priceinput",label="Price",value = c(25,40),min=0,max=100,pre="$"),
      radioButtons(inputId = "typeInput", label = "Product type",
                   choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
                   selected = "WINE"),
      selectInput(inputId = "countryinput",label="Country",choice=c("CANADA", "FRANCE", "ITALY"))
  ),
  mainPanel("the results will go here",
            plotOutput("coolplot"),
            br(),br(),
            tableOutput("result"))
  
  )
)


server<-function(input,output){
  output$coolplot<- renderPlot({
    plot(rnorm(100))
  })
}

shinyApp(ui=ui,server=server)




