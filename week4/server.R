library(shiny)
library(tidyverse)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    diamonds_md <- lm(price ~ carat, diamonds) #+ cut + color + clarity
        
     modelpred <- reactive({
        caratInput   <- input$carat
        # cutInput     <- input$cut
        # colorInput   <- input$color
        # clarityInput <- input$clarity

        predict(diamonds_md, 
                newdata = data.frame(carat = caratInput
                                     # ,cut = cutInput
                                     # ,color = colorInput
                                     # ,clarity = clarityInput
                                     ) %>%
                    mutate(carat = as.numeric(carat)))
         
     output$pred  <- renderText({
         modelpred()
     })
    })
     
     output$testop <- renderText(({
         input$testip
     }))

})
