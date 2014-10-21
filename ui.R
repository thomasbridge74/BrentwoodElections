library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Brentwood Elections"),
  sidebarPanel(
    h3('Select Party/Year')
    ),
  mainPanel(
    h3('Election Results')
    )
))