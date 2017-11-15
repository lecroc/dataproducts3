
library(shiny)
library(dplyr)
library(plotly)

d2<-read.table("d2.Rda")

pageWithSidebar(
  headerPanel('Vehicle Fuel Efficiency'),
  sidebarPanel(
    selectInput('class', 'Select Vehicle Class', levels(d2$class)),
    numericInput('Year', 'Model Year', 1984,
                 min = 1984, max = 2018)
  ),
  mainPanel(
    plotOutput('plot')
   )
  )