library(shiny)
library(tidyverse)

shinyUI(fluidPage(

    titlePanel("Predict a price of diamond"),
    
    theme = shinythemes::shinytheme("simplex"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("carat", "carat :",
                        min = 0.10, max = 5.90, value = 0.79),
            selectInput("cut", "cut :",
                        choices = unique(diamonds$cut)),
            selectInput("color", "color :",
                        choices = unique(diamonds$color)),
            selectInput("clarity", "clarity :",
                        choices = unique(diamonds$clarity)),
            submitButton("Submit!")
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("Predict", "multiple regression : Price(USD) ~ Carat + Cut + color + clarity", textOutput("pred")),
                tabPanel("Plot(Please wait)",   plotOutput("plot")),
                tabPanel("Table",   DT::DTOutput("table"))
            )
            
        )
    )
))
