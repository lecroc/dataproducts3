
library(shiny)
d2<-read.table("C:/Coursera/DevelopingDataProducts/dataproducts3/d2.Rda")

pageWithSidebar(
  headerPanel('Vehicle Fuel Efficiency'),
  sidebarPanel(
    selectInput('class', 'Select Vehicle Class', levels(d2$class)),
    numericInput('Year', 'Model Year', 1984,
                 min = 1984, max = 2018)
  ),
  mainPanel(
    h3("Selected Values:"),
    textOutput("vclass"),
    textOutput("Year")
  )
)