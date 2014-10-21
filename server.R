library(shiny)
library(plyr)
library(ggplot2)

electiondata <- read.csv("Brentwood Elections.csv", header=TRUE)
years <- sort(unique(electiondata$Year))
parties <- as.character(sort(unique(electiondata$Party)))

yearly_vote <- ddply(electiondata[,c("Year", "Party", "Vote")], ~Party + Year, summarize, votes=sum(Vote))
yearly_vote$percent = 100*unsplit(lapply(split(yearly_vote, yearly_vote$Year), function(x) { 
   x$votes/sum(x$votes)}), yearly_vote$Year)
yearly_vote <- yearly_vote[with(yearly_vote, order(Year, -percent)), ]

yearly_summary <- function(year, party) {
  year_vote <- yearly_vote[yearly_vote$Year == year, ]
  year_vote[year_vote$Party %in% party, ]
}

summarize_data <- function(year, party) {    
  party_vote <- ddply(electiondata[electiondata$Year == year, c("Party", "Vote")], ~Party, summarize, votes = sum(Vote))
  party_vote$percent <- party_vote$votes/sum(party_vote$votes)
  party_vote <- party_vote[order(-party_vote$votes), ]
  party_vote[party_vote$Party %in% party, ]
}

create_plot <- function(party) {
  p <- qplot(Year, percent, data=yearly_vote[yearly_vote$Party %in% party, ], group=Party, colour=Party) + geom_line()
  print(p)
}

shinyServer(
  function(input, output) {
    output$oyear <- renderText({input$year})
    output$oparty <- renderPrint({input$party})
#    output$osummary <- renderPrint({summarize_data(input$year, input$party)}) 
    output$osummary2 <- renderPrint({yearly_summary(input$year, input$party)})
    output$plot <- renderPlot({create_plot(input$party)})
  }
)