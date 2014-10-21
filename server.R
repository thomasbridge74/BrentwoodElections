library(shiny)
library(plyr)

electiondata <- read.csv("https://raw.githubusercontent.com/thomasbridge74/BrentwoodElections/master/Brentwood%20Elections.csv", header=TRUE)
years <- sort(unique(electiondata$Year))
parties <- as.character(sort(unique(electiondata$Party)))

summarize_data <- function(year, party) {    
  party_vote <- ddply(electiondata[electiondata$Year == year, c("Party", "Vote")], ~Party, summarize, votes = sum(Vote))
  party_vote$percent <- party_vote$votes/sum(party_vote$votes)
  party_vote[party_vote$Party %in% party, ]
}

shinyServer(
  function(input, output) {
    output$oyear <- renderPrint({input$year})
    output$oparty <- renderPrint({input$party})
    output$osummary <- renderPrint({summarize_data(input$year, input$party)})
  }
)