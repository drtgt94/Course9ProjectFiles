library(shiny)
library(rCharts)
shinyUI(pageWithSidebar(
        headerPanel("Exploring the iris dataset"),
        
        sidebarPanel(
                selectInput(inputId = "XAxis",
                            label = "Choose X-Axis Variable",
                            choices = c("SepalLength", "SepalWidth","PetalLength","PetalWidth"),
                            selected = "SepalLength"),
                selectInput(inputId = "YAxis",
                            label = "Choose Y-Axis Variable",
                            choices = c("SepalLength", "SepalWidth","PetalLength","PetalWidth"),
                            selected = "SepalWidth"),
                checkboxGroupInput(inputId = 'Species',
                                   label = strong("Select Species"),
                                   choices = c('setosa','versicolor','virginica'),
                                   selected = 'setosa'),
                p('DOCUMENTATION:'),
                p('Select X-Axis Variable and Y-Axis Variable'),
                p('Select any combination of Species'),
                p('Graph to right will plot all rows of the'),
                p('iris dataset that match criteria selected'),
                p('as well as the mean of all graphed points'),
                p('on the Y-Axis')
        ),
        mainPanel(
                textOutput('YAxisLabel'),
                textOutput('MeanYAxis'),
                showOutput("myChart",lib='polycharts')
        )
))