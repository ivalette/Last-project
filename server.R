# Load Libraries
library(shiny)
library(datasets)
library(ggplot2)
library(corrplot)
require(stats)
require(graphics)
require(GGally)


# We load the data
data(mtcars)
mpgData <- mtcars[,c(1:4,6,9 )]
# We tweak the "am" field to have nicer factor labels.
mpgData$am <- factor(mpgData$am, labels = c("0 - Automatic", "1 - Manual"))
# Building a regression model
fit <- lm (mpg ~ cyl + am + wt + disp, data=mpgData)
#prediction <- predict(fit, data=newdata)
prob <- function( am, wt, disp, cyl, hp) {38.20 - 1.56 * am -  3.3 * wt + 0.012 * disp - 1.11 * cyl - 0.03 * hp}
# Define server logic required to summarize and view the selected data
shinyServer(
        function(input, output) {
             
                # Create Output and id Variables
                output$wt <- renderPrint({input$id1})
                output$disp <- renderPrint({input$id2})
                output$cyl <- renderPrint({input$id3})
                output$am <- renderPrint({input$id4})
                output$hp <- renderPrint({input$id5})
                # Create Prediction
                output$prediction <- renderPrint({prob(input$id4, input$id1, input$id2, input$id3, input$id5)})
                # Create a correlation, EDA and predictive plot
                output$newHist <- renderPlot({
                M <- cor(mtcars[,c(1:4,6,9 )])
                corrplot.mixed(M)
                        })
                output$newHist2 <- renderPlot({
                        pairs(mpgData, panel = panel.smooth, main = "Mtcars data", col = 3 + (mpgData$mpg > 22))
                        })
              
                # Generate a summary of the dataset
                output$summary <- renderPrint({
                        summary(mpgData[,2:5])
                })
                
                # Show the first "n" observations
                output$view <- renderTable({
                        head(mpgData, 10)
                })
        }
)
