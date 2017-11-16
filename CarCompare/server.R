# Server.R

library(shiny)
library(dplyr)


function(input, output, session) {
  
  d3<- reactive({
    filter(d2, class==input$class & year==input$Year)
    
  })
  output$test<-renderText(input$class)
  output$test1<-renderText(input$Year)
  output$plot<-renderPlot(
    plot(d3()$hwy, d3()$cost)
  )
  }
  
  
  

