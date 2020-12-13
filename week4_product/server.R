library(shiny)
library(tidyverse)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    dia_mod <- lm(price ~ carat, diamonds)
    
    dia_pred <- reactive({
        carat   <- input$carat
        
        predict(dia_mod, newdata = data.frame(carat))
    })
    
    dia_plot <- reactive({
        caratInput <- input$carat
        
        diamonds %>% ggplot(mapping = aes(carat, price))+
            geom_jitter(alpha = 0.3)+
            geom_smooth(method = "lm", se = FALSE)+
            geom_point(aes(x = caratInput, y = dia_pred()), color = "red", size = 3)+
            labs(title = "linear model : Price ~ Carat")
        
    })
    
    dia_table <- reactive({
        diamonds %>% 
            filter(carat <= input$carat)%>% 
            group_by(cut, color, clarity) %>% 
            summarise(count = n(), 
                      mean_price = round(mean(price),1), 
                      sd_price = round(sd(price),1))
            
    })
    
    output$pred <- renderText({
        dia_pred()
    })
    
    output$plot <- renderPlot({
        dia_plot()
    })

    output$table <- DT::renderDT({
        dia_table()
    })

})
