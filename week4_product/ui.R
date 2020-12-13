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
            submitButton("Submit!"),
            
            
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("document", "This app is built to predict a price of a diamond and show the table and plot related with it. 
                         There are 4 variables which are used to predict a price of a diamond : carat, cut, color, clairty.
                         First tab, Predict, is built to predict a price of a diamond. It is a multiple regression model.
                         Second tab, Plot, is built to show a linear model of diamond price as function of carat only.
                         Third tab, Table, is built to show a mean and sd of diamond price below the carat selected.
                         Please enjoy this app."),
                tabPanel("Predict", "multiple regression : Price(USD) ~ Carat + Cut + color + clarity", textOutput("pred")),
                tabPanel("Plot(Please wait)",   plotOutput("plot")),
                tabPanel("Table",   DT::DTOutput("table"))
            )
            
        ),
        
    )
))
