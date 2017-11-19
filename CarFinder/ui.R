# UI for Car Finder App

library(shiny)
library(dplyr)

d2<-read.table("d2.Rda")

# Define UI for application that finds the most cost-efficient vehicle in a particular class
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Vehicle Efficiency Search"),
  
  # Sidebar with drop-down for vehicle class and numeric input for model year
  sidebarPanel(
    selectInput('Class', 'Select Vehicle Class', levels(d2$Class)),
    numericInput('Year', 'Model Year', 1997,
                 min = 1997, max = 2018),
    submitButton("Submit"),
    h4("Instructions:"),
    textOutput("helptext1"),
    textOutput("helptext2"),
    textOutput("helptext3"),
    textOutput("helptext4"),
    h6("If error, no cars match selection"),
    h6("Save/Spend is 5 year fuel cost vs. average"),
    h6("Data from US EPA available here:"),
    uiOutput("tab")
  ),
  mainPanel(
    plotOutput('plot'),
    dataTableOutput('table')
  )
))