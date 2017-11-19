library(shiny)
library(dplyr)

d2<-read.table("d2.Rda")

# Define server logic required plot a group of cars selected from UI

shinyServer(function(input, output) {
 
  d3<- reactive({
    filter(d2, Class==input$Class & Year==input$Year)%>%
    arrange(SaveSpend) %>%
    tail(20)
    })
  
  d4<-reactive({d3()%>%
    select(MakeModel, Cylinders, Displacement, Transmission, SaveSpend) %>%
    arrange(desc(SaveSpend))
    
  })
  
       output$table<-renderDataTable(d4())
       
       output$plot<-renderPlot({
       par(mar=c(6.1,18.1,4.1,2.1))
       
       barplot(height=d3()$SaveSpend, names.arg = d3()$MakeModel, 
               xlab="", las=2, cex.axis = 1, 
               cex.names = 1, horiz = T, col = "blue", 
               xlim = c(-7500, 7500))
       
       title(main="What You Save or Spend Vs. Average")
    })
       output$helptext1<-renderText({
         "1. Select Vehicle Class"
           })
       output$helptext2<-renderText({
         "2. Input Model Year"
       })
       output$helptext3<-renderText({
         "3. Click Submit"
       })
       output$helptext4<-renderText({
         "4. Plot and Table returned"
       })
       url <- a("EPA Data Website", href="https://www.fueleconomy.gov/feg/download.shtml")
       output$tab <- renderUI({
         tagList("URL link:", url)
       })
})
     
