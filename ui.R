library(DT)
library(shiny)
library(shinydashboard)


shinyUI(dashboardPage(
  dashboardHeader(title = "My Dashboard"),
  dashboardSidebar(
    "Here's the sidebar",
    menuItem("graph1", tabName="graph1"),
    menuItem("graph2", tabName="graph2"),
    menuItem("graph3", tabName="graph3")
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "graph1",
        fluidRow(box(plotOutput('graph1',height=650),width = 12 )
      )),
      
      tabItem(tabName = "graph2",
        fluidRow(box(plotOutput('graph2', height = 650),width = 12)
      )
    ),
    tabItem(tabName = "graph3",
            fluidRow(box(plotOutput('graph3', height = 650),width = 12))) 
  )
)))
