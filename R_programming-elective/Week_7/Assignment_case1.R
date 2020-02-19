library(shiny)
library(ggplot2)
library(dplyr)

bcl <- read.csv("C:\\Users\\i340968\\Desktop\\ed-code\\R programming-elective\\Week_7\\Shiny_app2\\data10.csv", stringsAsFactors = FALSE)

ui <- fluidPage(
  titlePanel("Sugar Content across Product and Price"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("priceInput", "Price", 0, 100, c(25, 40), pre = "$"),
      radioButtons("typeInput", "Product type",
                   choices = c("Beverages", "Cake", "Candy", "Icecream"),
                   selected = "Beverages"),
      uiOutput("countryOutput")
    ),
    mainPanel(
      plotOutput("coolplot"),
      br(), br(),
      tableOutput("results")
    )
  )
)

server <- function(input, output) {
  output$countryOutput <- renderUI({
    selectInput("countryInput", "Country",
                sort(unique(bcl$Country)),
                selected = "CANADA")
  })  
  
  filtered <- reactive({
    if (is.null(input$countryInput)) {
      return(NULL)
    }    
    
    bcl %>%
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
    ggplot(filtered(), aes(Sugar_Content)) +
      geom_histogram()
  })
  
  output$results <- renderTable({
    filtered()
  })
}

shinyApp(ui = ui, server = server)
