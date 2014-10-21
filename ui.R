library(shiny)

electiondata <- read.csv("Brentwood Elections.csv", header=TRUE)
years <- sort(unique(electiondata$Year))
parties <- as.character(sort(unique(electiondata$Party)))

shinyUI(pageWithSidebar(
  
  headerPanel("Brentwood Elections"),
  sidebarPanel(
    h3('Select Party/Year'),
    selectInput("year", "Select Year", choices=years),
    checkboxGroupInput("party", "Parties", choices=parties, selected=parties)
    ),
  mainPanel(
    h3('Main Panel'),
    verbatimTextOutput("oyear"),
    h3('Parties'),
    verbatimTextOutput("oparty"),
    h3('Vote Summary'),
    verbatimTextOutput("osummary")
    )
  )
)