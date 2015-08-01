library(shiny)

electiondata <- read.csv("Brentwood Elections.csv", header=TRUE)
years <- sort(unique(electiondata$Year))
parties <- as.character(sort(unique(electiondata$Party)))
latestyear <- max(electiondata$Year)

shinyUI(pageWithSidebar(
  
  headerPanel("Brentwood Elections"),
  sidebarPanel(
    h3('Select Party/Year'),
    selectInput("year", "Select Year", choices=years, selected=latestyear),
    checkboxGroupInput("party", "Parties", choices=parties, selected=parties)
    ),
  mainPanel(
    p("This webpage presents a summary of the results from the Borough Council Elections held in the English borough of Brentwood
      Essex.   Elections to the Council are held over a cycle of three years (there were no elections in 2013 as that year there
      were County Council elections)."),
    p("This page allows you to view the results borough wide for each year, and includes the ability to only report on 
      particular political parties.   To obtain the results for a specific year, please select the year from the pull down
      menu on the left.   By default, all parties that have run candidates are selected.   If you wish to see the results
      for only particular parties, then unselect the parties you are not interested in."),
    h3('Results Summary'),
    textOutput("oyear"),
    h4("Table of results"),
    tableOutput("osumtable"),
    h4("Graph of results"),
    p("This graph shows the trends for the parties over the years captured in the data.   Note that some parties may not have run
       in all elections so may show up here as a dot rather than a line.   Colours are automatically allocated by R"),

    plotOutput("plot")

    )
  )
)