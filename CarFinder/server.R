library(shiny)
library(dplyr)

d2<-read.table("d2.Rda")

# Define server logic required plot a group of cars selected from UI

shinyServer(function(input, output) {
 
  d3<- reactive({
    filter(d2, Class==input$Class & Year==input$Year)%>%
    arrange(desc(SaveSpend))
              })
  
   
     output$plot<-renderPlot({
       par(mar=c(6.1,15.1,4.1,2.1))
       
       barplot(height=d3()$SaveSpend, names.arg = d3()$MakeModel, 
               xlab="Spend / Save Vs. Average", las=2, cex.axis = 1, 
               cex.names = .8, horiz = T, col = d3()$Color, 
               xlim = c(min(d3()$SaveSpend), max(d3()$SaveSpend)))
       
       title(main="What You Save or Spend Vs. Average")
    })
    
})
     
