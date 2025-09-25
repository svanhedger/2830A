#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(rsconnect)

set.seed(1234567)

writeManifest()


# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Mystery Distribution!!"),
    strong(p("Psychology 2830A, Section 551")),
    p("You are a super cool researcher studying a population. You're interested in learning about how many times your population of interest (Canadians who own more than five cats) say 'fishsticks' in a 24-hour period. There's only one small problem: You have no idea what the population parameters are. What is the population's mean (mu)? What is the population's standard deviation (sigma)?"),
    p("Collecting observations from the entire population is not feasible (in this case, it's 100,000 people), so we'll use the central limit theorem to learn more about the population parameters. "),
    strong(p("How this works:")),
    p("Press the button below to generate a random sample. Based on the central limit theorem and law of large numbers, we'll set the sample size at 30. Just to be clear, what this means is that every time you press the button, you are taking a new random sample of 30 individuals from the larger population (100,000)."),
    actionButton(inputId = "myButton", label = "Generate a random sample (n = 30)"),
    textOutput("randomSample"),
    textOutput("clickCounter"),
    textOutput("current_mean_sample_dist"),
    textOutput("current_se_sample_dist"),
    plotOutput("sample_dist_hist")
    )
