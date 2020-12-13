
library(shiny)
library(tidyverse)

shinyUI(fluidPage(
    # Application title
    titlePanel("Predict a price of diamonds"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("carat",
                        "carat :",
                        min = 0.1,
                        max = 6,
                        value = 3),
            textInput("textip", "input")
            # ,
            # selectInput("cut", "cut :",
            #            choices = unique(diamonds$cut)),
            #  selectInput("color", "color :",
            #               choices = unique(diamonds$color)),
            #  selectInput("clarity", "clarity :",
            #               choices = unique(diamonds$clarity))
                               )
        ,
        mainPanel(
            # plotOutput("model"),
            h3("Predicted diamond price :"),
            textOutput("pred"),
            h4("test :"),
            textOutput("testop")
            
        )
    )
))
