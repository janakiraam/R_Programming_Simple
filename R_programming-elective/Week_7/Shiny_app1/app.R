library(shiny)
ui <- fluidPage(
  h1("My APP"),
  "BC",
  em("liquor"),
  br(),
  "store",
  strong("price")
)
server <- function(input, output) {}
shinyApp(ui = ui, server = server)
