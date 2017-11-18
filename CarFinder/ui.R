# UI for Car Finder App

library(shiny)
library(dplyr)

d2<-read.table("d2.Rda")

# Define UI for application that finds the most cost-efficient vehicle in a particular class
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Car Finder App"),
  
  # Sidebar with drop-down for vehicle class and numeric input for model year
  sidebarLayout(
    sidebarPanel(
      selectInput('Class', 'Select Vehicle Class', levels(d2$Class)),
      numericInput('Year', 'Year', 1997,
                   min = 1997, max = 2018),
      submitButton("Submit")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("plot")
    )
  )
))
