
library(shiny)
library(dplyr)
library(ggplot2)

function(input, output) {
  
  d3<- reactive({
      filter(d2, class==input$class & year==input$Year)
      
  })
  
  
 output$plot<-renderPlot({
    plot(d3()$hwy, d3()$cost)
 })
   
}
