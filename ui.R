library(shiny)
library(shinydashboard)
library(shinycssloaders)

dashboardPage(
  dashboardHeader(),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Enter text", tabName = "text", icon = icon("pencil")),
      menuItem("About application", tabName = "about", icon = icon("book"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "text",
              h2("Coursera Data Science Capstone Project"),
              tags$img(src = "logocoursera.png", height=100, width =250),
              
              textInput("text", label = h2("Enter text..."), value = ""),
              
              hr(),
              p("The predicted next word:"),
              fluidRow(column(3, verbatimTextOutput("value") ))
              
      ),
      
      tabItem(tabName = "about",
              includeHTML("about.html")
              
      )
    )
    
  )
)