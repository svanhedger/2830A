#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

uniform_dist <- runif(n = 100000, min = 0, max = 60)
all_values = c()

# Define server logic required to draw a histogram
function(input, output, session) {
  clickCounter <- reactiveVal(1)
  my_vector <- reactiveVal(numeric())
  observeEvent(input$myButton, {
      current_count <- clickCounter()
      clickCounter(current_count + 1)
    
    cursample <- sample(uniform_dist, 30)
    cursample_mean <- mean(cursample)
    
    current_vector_value <- my_vector()
    updated_vector <- c(current_vector_value, cursample_mean)
    my_vector(updated_vector)
    
    output$randomSample <- renderText({
      paste("Your sample mean is: ", round(cursample_mean, digits=2))
    })
    output$clickCounter <- renderText({
    paste("You have generated ", current_count, "sample(s)")
  })
    output$current_mean_sample_dist <- renderPrint({
      cursampledistmean <- mean(my_vector())
      paste("Current mean of the sampling distribution: ", round(cursampledistmean, digits=2))
    })
    output$current_se_sample_dist <- renderPrint({
      cursampledistse <- sd(my_vector())
      paste("Current standard error of the sampling distribution: ", round(cursampledistse, digits=2))
    })
    output$sample_dist_hist <- renderPlot({
      hist(my_vector(), main="Sampling Distribution of Mystery Distribution", col="dodgerblue3", border="black", xlab="Value", ylab="Count")
    })
  
  })
}
