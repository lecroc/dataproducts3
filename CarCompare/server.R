
library(shiny)

shinyServer(function(input, output) {
  output$vclass <- renderText(input$class)
  output$Year<-renderText(input$Year)
   
  
  
})
