library(shiny)
library(dplyr)
econ_1 <-read.csv("C:/Users/I340968/Desktop/ed-code/R programming-elective/Week_7/data10.csv")
#View(econ_1)
str(econ_1)
dis_df=econ_1 %>% distinct(Country)
dis_df
ui_1 <- fluidPage(
  titlePanel("Sugar Content across Products and Prices"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId='priceInput',label="Price",min=0,max=100,value=c(30,100),animate=TRUE,pre="$"),
      radioButtons(inputId = "typenput",choices = c("Breverages","Cakes","Candy","Icecream"),
                   label = "Product type",selected = "Breverages"),
      uiOutput("countryOutput")
    ),
    mainPanel(
      plotOutput("coolplot"),
      br(), br(),
      tableOutput("results")
    )
  )
)
              
server_1 <- function(input, output) {
  output$countryOutput <- renderUI({
    selectInput("countryInput", "Country",
                sort(unique(econ_1$Country)),
                selected = "CANADA")
  })  
  
  filtered <- reactive({
    if (is.null(input$countryInput)) {
      return(NULL)
    }    
    
    econ_1 %>%
      filter(Price >= input$priceInput[1],
             Price <= input$priceInput[2],
             Type == input$typeInput,
             Country == input$countryInput
      )
  })
  
  output$coolplot <- renderPlot({
    if (is.null(filtered())) {
      return()
    }
    ggplot(filtered(), aes(Alcohol_Content)) +
      geom_histogram()
  })
  
  output$results <- renderTable({
    filtered()
  })
}

#server_1 <- function(input,output){}

shinyApp(ui=ui_1,server=server_1)
