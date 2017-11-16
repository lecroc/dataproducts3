# ui.R

# load libraries and data set
library(shiny)
library(dplyr)
d2<-read.table("d2.Rda")

shinyUI(fluidPage(
        headerPanel('Vehicle Fuel Efficiency'),
        sidebarPanel(
          selectInput('class', 'Select Vehicle Class', levels(d2$class)),
          numericInput('Year', 'Model Year', 1984,min = 1984, max = 2018),
          submitButton("Submit")
                    ),
        mainPanel(
          textOutput('test'),
          textOutput('test1'),
          plotOutput('plot')
                  )
))