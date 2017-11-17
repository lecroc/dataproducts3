library(shiny)
library(dplyr)
library(plotly)

d2<-read.table("d2.Rda")

# Define server logic required plot a group of cars selected from UI

shinyServer(function(input, output) {
 
  d3<- reactive({
    filter(d2, Class==input$class & ModelYear==input$Year)%>%
      arrange(desc(MPG))%>%
      top_n(20)
    
    })
   
     output$plot<-renderPlot({
       plot(d3()$SavingsVAverage)
    })
    
})
     
