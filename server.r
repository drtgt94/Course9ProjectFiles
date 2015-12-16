library(rCharts)
library(shiny)
shinyServer(function(input, output) {
        output$myChart <- renderChart2({
                iris = as.data.frame(iris)
                names(iris) = gsub("\\.", "", names(iris))
                irissubset = subset(iris, Species %in% input$Species)
                r1 <- rPlot(x = input$XAxis, y = input$YAxis, data = irissubset, color = 'Species', type = 'point')
                r1$guides(
                        x = list(
                                min = pretty(iris[,input$XAxis])[1],
                                max = tail(pretty(iris[,input$XAxis]),1) + 1),
                        y = list(
                                min = pretty(iris[,input$YAxis])[1],
                                max = tail(pretty(iris[,input$YAxis]),1) + 1))
                YMean <- reactive({as.numeric(mean(subset(iris, Species %in% input$Species)[,input$YAxis]))})
                XMax <- reactive({tail(pretty(iris[,input$XAxis]),1) + 1})
                addline <- data.frame(y=YMean(),x=seq(0,XMax()),name=5)
                r1$layer(y~x,data=addline,type='line',color=list(const = 'darkblue'))
                return(r1)
        })
        YAxisMean <- reactive({as.numeric(mean(subset(iris, Species %in% input$Species)[,input$YAxis]))})
        output$MeanYAxis <- renderText({YAxisMean()})
        output$YAxisLabel <- renderText(paste('Mean ', input$YAxis))
        
})