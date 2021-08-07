# Stat 613 Final Exam
# Harry Nitzberg
# Problem 5

library(shiny)
library(tidyverse)
library(shinyWidgets)

ui <- fluidPage(
  tags$h2("Harry Nitzberg", style = "color:blue"),
  h3("FINAL EXAM Shiny App Iris Data",
     style = "color:red"),
  setBackgroundColor("yellow"),
  selectInput("vars", "Iris variables", choices = names(iris)),
  
  mainPanel(
    plotOutput(outputId = "Histogramplotvar1"),
    plotOutput(outputId = "Boxplotvar1"),
    verbatimTextOutput("summary")
  )
)

server <- function(input, output) {
  output$Histogramplotvar1 <- renderPlot({
    ggplot(iris, mapping = aes(x = .data[[input$vars]])) +
      geom_histogram(fill = "blue", color = "red")
  })
  output$Boxplotvar1 <- renderPlot({
    ggplot(iris, mapping = aes(x = .data[[input$vars]])) +
      geom_boxplot(fill = "red", color = "blue")
  })
  output$summary <- renderPrint({
    summary(iris)
  })
}
shinyApp(ui = ui, server = server) 
